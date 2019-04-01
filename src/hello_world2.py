from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
import airflow.hooks.S3_hook

def print_hello():
    return 'Hello world!'

def upload_file_to_S3_with_hook(filename, key, bucket_name):
    hook = airflow.hooks.S3_hook.S3Hook('S3_conn')
    hook.load_file(filename, key, bucket_name)

dag = DAG('hello_s3', description='Simple tutorial DAG with s3',
          schedule_interval='0 12 * * *',
          start_date=datetime(2017, 3, 20), catchup=False)

dummy_operator = DummyOperator(task_id='dummy_task', retries=3, dag=dag)

hello_operator = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)

upload_to_S3_operator = PythonOperator(
    task_id='upload_to_S3',
    python_callable=upload_file_to_S3_with_hook,
        op_kwargs={
          'filename': '/home/ubuntu/temp/my_file.csv',
          'key': 'my_S3_file.csv',
          'bucket_name': 'insight-leckband',
      },
      dag=dag)

dummy_operator >> hello_operator >> upload_to_S3_operator
