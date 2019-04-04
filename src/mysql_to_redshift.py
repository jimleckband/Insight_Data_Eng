from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator, BranchPythonOperator
from airflow.hooks.S3_hook import S3Hook
from airflow.hooks.mysql_hook import MySqlHook
from airflow.hooks.postgres_hook import PostgresHook
from boto.s3.connection import S3Connection, Bucket, Key
from boto.s3.key import Key

import csv
import logging
from cStringIO import StringIO

#################### Initializations ###############

mysql_hook = MySqlHook(mysql_conn_id='mysql_baseball')
redshift_hook = PostgresHook(postgres_conn_id='redshift_host')
S3_hook = S3Hook('S3_conn')

S3_bucket_name = 'insight-leckband'
bucket = Bucket('S3_conn', S3_bucket_name)
bucket = S3_hook.get_bucket(S3_bucket_name)

dims = ['leagues_dim', 'teams_dim', 'players_dim']

batting_columns = "player_id,year,team_id,game_id,league_id,level_id,split_id,position,ab,h,k,pa,pitches_seen,g,gs,d,t,hr,r,rbi,sb,cs,bb,ibb,gdp,sh,sf,hp,ci,wpa,stint,war"

#################### Procedures ###############

def print_message():

    print "Got to this task"


def csv2string(data):
    ram_string = StringIO()
    csv_file = csv.writer(ram_string, quoting=csv.QUOTE_NONNUMERIC)
    for row in data:
        csv_file.writerow(row)
    return ram_string.getvalue().strip('\r\n')
#    return ram_string

def new_partition():

    mysql_sql = "select min(load_date) from staged_partitions where staged=0"
    mysql_cur = mysql_hook.get_records(mysql_sql)
    mysql_rows = mysql_cur[0]

    print mysql_rows

    if mysql_rows == "9999-99-99":
        return "partition_does_not_exist"
    else:
        return "partition_exists"

def find_partition(**kwargs):
    mysql_sql = "select min(load_date) from staged_partitions where staged=0"
    mysql_cur = mysql_hook.get_records(mysql_sql)
    load_date = mysql_cur[0]

#    task_instance = kwargs['task_instance']
#    task_instance.xcom_push(key='load_date',value=load_date)

    return load_date[0];
#    return {'load_date':mysql_rows}


def compare_dimensions(tablename,**kwargs):

#    load_date = context['task_instance'].xcom_pull(task_ids='find_partition')['load_date']

    task_instance = kwargs['task_instance']
#    load_date = task_instance.xcom_pull(task_ids='find_partition',key='load_date')
    my_load_date = task_instance.xcom_pull(task_ids='partition_exists')


    print my_load_date

    redshift_sql = "select count(*) from " + tablename
    red_cur = redshift_hook.get_records(redshift_sql)
    redshift_rows = red_cur[0]

    mysql_sql = "select count(*) from " + tablename
    mysql_cur = mysql_hook.get_records(mysql_sql)
    mysql_rows = mysql_cur[0]

    print mysql_rows
#    log.info("MySql %d", mysql_rows)
    if mysql_rows == redshift_rows:
        return 'skip_' + tablename
    else:
        return 'load_' + tablename

def load_dimensions(tablename):

    truncate_dim = "truncate table " + tablename
    redshift_hook.run(truncate_dim)

    mysql_sql = "select * from " + tablename

    cur = mysql_hook.get_records(mysql_sql)

    redshift_hook.insert_rows(tablename,cur)

    return

def skip_dimensions(tablename):

    print "Skipping load of " + tablename

    return

def load_facts(tablename, **kwargs):

    task_instance = kwargs['task_instance']
#    load_date = task_instance.xcom_pull(task_ids='find_partition',key='load_date')
    my_load_date = task_instance.xcom_pull(task_ids='partition_exists')


#    mysql_sql = "select * from dw_players_career_batting_stats "
    mysql_sql = "select " + batting_columns + " from dw_players_career_batting_stats "
#    mysql_sql += "where load_date = '2019-02-12'"
    mysql_sql += "where load_date = '" + my_load_date + "'"

    print mysql_sql

    cur = mysql_hook.get_records(mysql_sql)

#    print cur

    cur_string = csv2string(cur)

#    print cur_string

    date_string = '2019-02-12'
    key = "load_date=" + my_load_date + "/customer_id=1/" + "dw_players_career_batting_stats" + ".csv"

    if S3_hook.check_for_key(key,S3_bucket_name):
        key_obj = Key(bucket)
#        print key_obj.key
        key_obj.key = key
        bucket.delete_key(key_obj)
        print "I got to delete objects"
#        S3_hook.delete_objects(S3_bucket_name, key)

    S3_hook.load_string(cur_string,key,S3_bucket_name)

    return

#################### DAG ###############

dag = DAG('mysql_to_redshift', description='Migrate data warehouse from MySQL to Redshift',
          schedule_interval='0 12 * * *',
          start_date=datetime(2019, 3, 20), catchup=False)

#################### Operators ###############

dummy_operator = DummyOperator(task_id='dummy_task', retries=3, dag=dag)

new_partition_operator = BranchPythonOperator(
    task_id='new_partition',
    python_callable=new_partition,
    trigger_rule='one_success',
    dag=dag
)

start_load_operator = DummyOperator(task_id='start_load', trigger_rule='one_success', retries=3, dag=dag)

partition_exists_operator = PythonOperator(
    task_id='partition_exists',
    trigger_rule='one_success',
    python_callable=find_partition,
    provide_context=True,
    dag=dag)

partition_nonexists_operator = DummyOperator(task_id='partition_does_not_exist', trigger_rule='one_success', retries=3, dag=dag)


load_facts_operator = PythonOperator(
    task_id='load_facts',
    python_callable=load_facts,
        op_kwargs={
            'tablename': 'dw_players_career_batting_stats'
        },
    provide_context=True,
    dag=dag
)

for dim in dims:
    branch = BranchPythonOperator(
          task_id='compare_' + dim,
          python_callable=compare_dimensions,
            op_kwargs={
              'tablename': dim
            },
          provide_context=True,
          dag=dag
    )

    load_dim = PythonOperator(
          task_id = 'load_' + dim,
          python_callable=load_dimensions,
            op_kwargs={
              'tablename': dim
          },
          dag=dag
    )

    skip_dim = PythonOperator(
        task_id = 'skip_' + dim,
        python_callable=skip_dimensions,
            op_kwargs={
                'tablename': dim
            },
            dag=dag)

    start_load_operator >> branch >> load_dim >> load_facts_operator
    branch >> skip_dim >> load_facts_operator

end_operator = DummyOperator(task_id='end_task', retries=3, dag=dag)

#################### Flow ###############

dummy_operator >> new_partition_operator
partition_exists_operator >> start_load_operator
partition_nonexists_operator >> end_operator
new_partition_operator >> partition_exists_operator
new_partition_operator >> partition_nonexists_operator
load_facts_operator >> end_operator
