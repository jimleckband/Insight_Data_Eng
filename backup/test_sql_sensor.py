from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
import airflow.hooks.S3_hook
from airflow.hooks.mysql_hook import MySqlHook
from airflow.operators.sensors import SqlSensor
import csv

dag = DAG('test_sql_sensor', description='Simple sql sensor test',
          schedule_interval='0 12 * * *',
          start_date=datetime(2017, 3, 20), catchup=False)


new_partition_sensor = SqlSensor(
  task_id='new_partition_sensor',
  conn_id='mysql_baseball',
  sql='select min(load_date) from staged_partitions where staged=0',
  poke_interval = 60,
  timeout = 5,
  dag=dag
)
