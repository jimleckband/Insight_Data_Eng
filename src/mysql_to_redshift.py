from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.hooks.S3_hook import S3Hook
from airflow.hooks.mysql_hook import MySqlHook
from airflow.hooks.postgres_hook import PostgresHook
from boto.s3.connection import S3Connection, Bucket, Key
from boto.s3.key import Key

import csv
from cStringIO import StringIO

#################### Initializations ###############

mysql_hook = MySqlHook(mysql_conn_id='mysql_baseball')
redshift_hook = PostgresHook(postgres_conn_id='redshift_host')
S3_hook = S3Hook('S3_conn')

S3_bucket_name = 'insight-leckband'
bucket = Bucket('S3_conn', S3_bucket_name)
bucket = S3_hook.get_bucket(S3_bucket_name)

#################### Procedures ###############

def csv2string(data):
    ram_string = StringIO()
    csv_file = csv.writer(ram_string, quoting=csv.QUOTE_NONNUMERIC)
    for row in data:
        csv_file.writerow(row)
    return ram_string.getvalue().strip('\r\n')
#    return ram_string

def load_dimensions(tablename):

    truncate_dim = "truncate table " + tablename
    redshift_hook.run(truncate_dim)

    mysql_sql = "select * from " + tablename

    cur = mysql_hook.get_records(mysql_sql)

    redshift_hook.insert_rows(tablename,cur)

    return

def load_facts(tablename):

    mysql_sql = "select * from dw_players_career_batting_stats "
    mysql_sql += "where load_date = '2019-02-12'"

    cur = mysql_hook.get_records(mysql_sql)

#    print cur

    cur_string = csv2string(cur)

#    print cur_string

    date_string = '2019-02-12'
    key = date_string + "/" + "dw_players_career_batting_stats" + ".csv"

    if S3_hook.check_for_key(key,S3_bucket_name):
        key_obj = Key(bucket)
#        print key_obj.key
        key_obj.key = key
        bucket.delete_key(key_obj)
#        S3_hook.delete_objects(S3_bucket_name, key)

    S3_hook.load_string(cur_string,key,S3_bucket_name)

    return

#################### DAG ###############

dag = DAG('mysql_to_redshift', description='Migrate data warehouse from MySQL to Redshift',
          schedule_interval='0 12 * * *',
          start_date=datetime(2019, 3, 20), catchup=False)

#################### Operators ###############

dummy_operator = DummyOperator(task_id='dummy_task', retries=3, dag=dag)

load_leagues_operator = PythonOperator(
    task_id='load_leagues',
    python_callable=load_dimensions,
        op_kwargs={
            'tablename': 'leagues_dim'
        },
    dag=dag
)

load_teams_operator = PythonOperator(
    task_id='load_teams',
    python_callable=load_dimensions,
        op_kwargs={
            'tablename': 'teams_dim'
        },
    dag=dag
)

load_players_operator = PythonOperator(
    task_id='load_players',
    python_callable=load_dimensions,
        op_kwargs={
            'tablename': 'players_dim'
        },
    dag=dag
)

load_fact_operator = PythonOperator(
    task_id='load_facts',
    python_callable=load_facts,
        op_kwargs={
            'tablename': 'dw_players_career_batting_stats'
        },
    dag=dag
)

#################### Flow ###############

dummy_operator >> load_leagues_operator >> load_fact_operator
dummy_operator >> load_teams_operator >> load_fact_operator
dummy_operator >> load_players_operator >> load_fact_operator
