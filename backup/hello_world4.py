from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
import airflow.hooks.S3_hook
from airflow.hooks.mysql_hook import MySqlHook
from airflow.hooks.postgres_hook import PostgresHook
import csv



def print_hello():
    return 'Hello world!'

def move_mysql_to_redshift(tablename):
    mysql_hook = MySqlHook(mysql_conn_id='mysql_baseball')
    redshift_hook = PostgresHook(postgres_conn_id='redshift_host')

    sql = "select league_id, name, abbr from "
    sql += tablename

    cur = mysql_hook.get_records(sql)

    redshift_hook.insert_rows(tablename,cur)

    return cur;

dag = DAG('hello_sql_to_redshift', description='Simple tutorial DAG with s3 and mysql and redshift',
          schedule_interval='0 12 * * *',
          start_date=datetime(2017, 3, 20), catchup=False)

dummy_operator = DummyOperator(task_id='dummy_task', retries=3, dag=dag)

hello_operator = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)

mysql_to_redshift_operator = PythonOperator(
    task_id='mysql_to_redshift',
    python_callable=move_mysql_to_redshift,
        op_kwargs={
            'tablename': 'leagues'
        },
    dag=dag
)

dummy_operator >> hello_operator >> mysql_to_redshift_operator

#dummy_operator >> hello_operator >> get_mysqldata_operator >> upload_to_S3_operator
