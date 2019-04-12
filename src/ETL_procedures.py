#################### ETL_procedures.py ###############
#
#   Info:       Python procedure module for handling the ETL of DataFingerprint
#   Usage:      Called by Airflow DAG operators
#   Install:    Install in $AIRFLOW_HOME/dags on the Airflow cluster machines
#
####################

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

#################### Initializations and User Configurables ###############

# Hook connections are defined in the Airflow GUI which handles the details
# of the connections such as IPs, Hostnames, and credentials
mysql_hook = MySqlHook(mysql_conn_id='mysql_baseball')
redshift_hook = PostgresHook(postgres_conn_id='redshift_host')
S3_hook = S3Hook('S3_conn')

S3_bucket_name = 'insight-leckband'
bucket = S3_hook.get_bucket(S3_bucket_name)

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

    if ram_string:
        return ram_string.getvalue().strip('\r\n')
    else:
        return ''

########### new_partition ###########
#
#   new_partition:      Checks to see if any partition needs to be synced to S3
#   returns:            The task_id of the correct branch to follow
#
###########
def new_partition():

    mysql_sql = "select 1 from staged_partitions where staged=0"
    mysql_cur = mysql_hook.get_records(mysql_sql)

    if mysql_cur:
        return "partition_exists"
    else:
        return "partition_does_not_exist"

########### find_partition ###########
#
#   find_partition:     Finds the stalest partition to load
#   returns:            Returns a string of the partition to load.
#                       Value is also available in the kwargs context for other procedures
#
###########
def find_partition(**kwargs):

    mysql_sql = "select min(load_date) from staged_partitions where staged=0"
    mysql_cur = mysql_hook.get_records(mysql_sql)

    if mysql_cur:
        load_date = mysql_cur[0][0]
        return load_date;
    else:
        raise ValueError('No staged partitions to process')

########### compare_dimensions ###########
#
#   compare_dimensions:     Checks to see if a dimension table needs to be synced to S3 by rowcount
#   returns:                The task_id of the correct load or skip branch to follow
#
###########
def compare_dimensions(tablename,**kwargs):

    task_instance = kwargs['task_instance']
    my_load_date = task_instance.xcom_pull(task_ids='partition_exists')

    redshift_sql = "select count(*) from " + tablename
    red_cur = redshift_hook.get_records(redshift_sql)
    redshift_rows = red_cur[0]

    mysql_sql = "select count(*) from " + tablename
    mysql_cur = mysql_hook.get_records(mysql_sql)
    mysql_rows = mysql_cur[0]

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

    truncate_dim = "truncate table " + tablename
    redshift_hook.run(truncate_dim)

    mysql_sql = "select * from " + tablename

    cur = mysql_hook.get_records(mysql_sql)

    if cur:
        redshift_hook.insert_rows(tablename,cur)
    else:
        raise ValueError('No dimension rows for ' + tablename)
    return

########### skip_dimensions ###########
#
#   skip_dimensions:     Placeholder procedure for skipping dimension loading
#
###########
def skip_dimensions(tablename):

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

# Get warehouse data from MySQL for the load_date
    mysql_sql  = "select " + batting_columns_sql + " from dw_players_career_batting_stats "
    mysql_sql += "where load_date = '" + my_load_date + "'"

# Get data cursor and convert to comma delimited string
    cur = mysql_hook.get_records(mysql_sql)
    if cur:
        cur_string = csv2string(cur)
    else:
        raise ValueError('No data in MySQL partition ' + my_load_date)

# Construct the S3 key and delete key and value if bucket key exists
    key = "load_date=" + my_load_date + "/" + "dw_players_career_batting_stats" + ".csv"

    if S3_hook.check_for_key(key,S3_bucket_name):
        key_obj = Key(bucket)
        key_obj.key = key
        bucket.delete_key(key_obj)

# Load the warehouse data as the value for the S3 key
    S3_hook.load_string(cur_string,key,S3_bucket_name)

# Check to see if a partition already exists in the Redshift Spectrum external table and create if not
    redshift_sql  = "select 1 from svv_external_partitions where tablename = 'dw_players_career_batting_stats' "
    redshift_sql += "and schemaname='baseball_ext' and substring(values,3,10)= '" + my_load_date + "'"

    redshift_cur = redshift_hook.get_records(redshift_sql)
    if not redshift_cur:
        redshift_add_part_sql  = "alter table baseball_ext.dw_players_career_batting_stats add "
        redshift_add_part_sql += "partition(load_date='" + my_load_date + "') "
        redshift_add_part_sql += "location 's3://" + S3_bucket_name + "/load_date=" + my_load_date + "/'"

        redshift_hook.run(redshift_add_part_sql,autocommit=True)

# Tell the data warehouse that the data has been moved to S3 (staged=1) and it needs to be queued for checksumming
# An extremely early checksum_date than any other partition is used for fingerprinting priority pickup
# Otherwise, background fingerprinting is done by the stalest partition checksum_date

    mysql_update_stage_sql = "update staged_partitions set staged = 1, checksum_date='2005-01-01' "
    mysql_update_stage_sql += "where load_date = '" + my_load_date + "'"

    mysql_hook.run(mysql_update_stage_sql)

    return
