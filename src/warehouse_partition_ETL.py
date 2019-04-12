#################### warehouse_partition_ETL.py ###############
#
#   Info:       Airflow DAG and Operators for Airflow DataFingerprint ETL flow
#   Usage:      Controls the scheduling and flow for migrating data from MySql to S3
#   Install:    Install in $AIRFLOW_HOME/dags on the Airflow cluster machines
#   Algorithm:  If partitions exist to migrate to S3, then the earliest partition
#               is selected. Otherwise the flow ends. If there is a partition
#               is ready a check is made to see if the data warehouse dimension
#               tables need updating, and reloads them to S3 if so. Finally the
#               main "fact" tables are loaded into S3 and partitions are created
#               if need be in the Redshift Spectrum table.
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

from ETL_procedures import new_partition, find_partition, load_facts, compare_dimensions, load_dimensions, skip_dimensions

dims = ['leagues_dim', 'teams_dim', 'players_dim']

#################### DAG ###############

dag = DAG('migrate_data_partitions', description='Migrate data warehouse from MySQL to Redshift',
          schedule_interval='0 12 * * *',
          start_date=datetime(2019, 3, 20), catchup=False)

#################### Operators ###############

dummy_operator = DummyOperator(task_id='start_task', retries=3, dag=dag)

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

# Operator factory for creating the dimension load and skip operators and their
#   associated flows. The dimension tables are a list defined in dim.

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
