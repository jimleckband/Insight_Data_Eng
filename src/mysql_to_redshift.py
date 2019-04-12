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
#bucket = Bucket('S3_conn', S3_bucket_name)
bucket = S3_hook.get_bucket(S3_bucket_name)

dims = ['leagues_dim', 'teams_dim', 'players_dim']

batting_columns_list = ['player_id','year','team_id','game_id','league_id','level_id','split_id','position','ab','h','k','pa','pitches_seen','g','gs','d','t','hr','r','rbi','sb','cs','bb','ibb','gdp','sh','sf','hp','ci','wpa','stint','war']
batting_columns_sql = ','.join(batting_columns_list)

#################### Procedures ###############

########### csv2string ###########
#
#   csv2string:     Converts a data object to a csv delimited string
#   returns:        A csv delimited string
#
###########
def csv2string(data):

    ram_string = StringIO()
    csv_file = csv.writer(ram_string, quoting=csv.QUOTE_NONNUMERIC)

    for row in data:
        csv_file.writerow(row)

    return ram_string.getvalue().strip('\r\n')

########### new_partition ###########
#
#   new_partition:      Checks to see if a partition needs to be synced to S3
#   returns:            The task_id of the correct branch to follow
#
###########
def new_partition():

    mysql_sql = "SELECT 1 FROM staged_partitions WHERE staged=0"
    mysql_cur = mysql_hook.get_records(mysql_sql)

    if mysql_cur:
        return "partition_exists"
    else:
        return "partition_does_not_exist"

########### find_partition ###########
#
#   find_partition:     Finds the stalest partition to load
#   returns:            Returns a string of the partition to load
#
###########
def find_partition(**kwargs):
    mysql_sql = "SELECT min(load_date) FROM staged_partitions WHERE staged=0"
    mysql_cur = mysql_hook.get_records(mysql_sql)
    load_date = mysql_cur[0][0]

#    task_instance = kwargs['task_instance']
#    task_instance.xcom_push(key='load_date',value=load_date)

    return load_date;
#    return {'load_date':mysql_rows}

########### compare_dimensions ###########
#
#   compare_dimensions:     Checks to see if a dimension table needs to be synced to S3 by rowcount
#   returns:                The task_id of the correct load or skip branch to follow
#
###########
def compare_dimensions(tablename,**kwargs):

    task_instance = kwargs['task_instance']
    my_load_date = task_instance.xcom_pull(task_ids='partition_exists')

    redshift_sql = "SELECT count(*) FROM " + tablename
    red_cur = redshift_hook.get_records(redshift_sql)
    redshift_rows = red_cur[0]

    mysql_sql = "SELECT count(*) FROM " + tablename
    mysql_cur = mysql_hook.get_records(mysql_sql)
    mysql_rows = mysql_cur[0]

#    log.info("MySql %d", mysql_rows)
    if mysql_rows == redshift_rows:
        return 'skip_' + tablename
    else:
        return 'load_' + tablename

########### load_dimensions ###########
#
#   load_dimensions:    Loads MySQL dimension table to Redshift
#
###########
def load_dimensions(tablename):

    truncate_dim = "TRUNCATE TABLE " + tablename
    redshift_hook.run(truncate_dim)

    mysql_sql = "SELECT * FROM " + tablename

    cur = mysql_hook.get_records(mysql_sql)

    redshift_hook.insert_rows(tablename,cur)

    return

########### skip_dimensions ###########
#
#   skip_dimensions:     Placeholder procedure for skipping dimension loading
#
###########
def skip_dimensions(tablename):

# Do logging instead

    print "Skipping load of " + tablename

    return

########### load_facts ###########
#
#   load_facts:     Loads the data warehouse fact table from mysql into S3 and creates partition in Redshift Spectrum if needed
#
###########
def load_facts(tablename, **kwargs):

    task_instance = kwargs['task_instance']
    my_load_date = task_instance.xcom_pull(task_ids='partition_exists')

    mysql_sql = "SELECT " + batting_columns_sql + " FROM dw_players_career_batting_stats "
    mysql_sql += "WHERE load_date = '" + my_load_date + "'"

    cur = mysql_hook.get_records(mysql_sql)
    cur_string = csv2string(cur)

    key = "load_date=" + my_load_date + "/" + "dw_players_career_batting_stats" + ".csv"

    if S3_hook.check_for_key(key,S3_bucket_name):
        key_obj = Key(bucket)
        key_obj.key = key
        bucket.delete_key(key_obj)
# put to logging
        print "I got to delete objects"

    S3_hook.load_string(cur_string,key,S3_bucket_name)

    redshift_sql = "SELECT 1 FROM svv_external_partitions WHERE tablename = 'dw_players_career_batting_stats' "
    redshift_sql += "and schemaname='baseball_ext' and SUBSTRING(values,3,10)= '" + my_load_date + "'"

    redshift_cur = redshift_hook.get_records(redshift_sql)
    if not redshift_cur:
        redshift_add_part_sql  = "ALTER TABLE baseball_ext.dw_players_career_batting_stats ADD "
        redshift_add_part_sql += "PARTITION(load_date='" + my_load_date + "') "
        redshift_add_part_sql += "location 's3://" + S3_bucket_name + "/load_date=" + my_load_date + "/'"

        redshift_hook.run(redshift_add_part_sql,autocommit=True)

    mysql_update_stage_sql = "UPDATE staged_partitions SET staged = 1, checksum_date='2005-01-01' "
    mysql_update_stage_sql += "WHERE load_date = '" + my_load_date + "'"

    mysql_hook.run(mysql_update_stage_sql)

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
