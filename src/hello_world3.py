from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
import airflow.hooks.S3_hook
from airflow.hooks.mysql_hook import MySqlHook
import csv



def print_hello():
    return 'Hello world!'

def upload_file_to_S3_with_hook(filename, key, bucket_name):
    hook = airflow.hooks.S3_hook.S3Hook('S3_conn')
    now = datetime.now()
    date_string = now.strftime('%Y-%m-%d-%H-%M')
    key = "my_sql_file" + date_string + ".csv"

    hook.load_file(filename, key, bucket_name)

def get_data_from_mysql(filename,tablename):
    hook = MySqlHook(mysql_conn_id='mysql_baseball')

    sql = "select * from "
    sql += tablename

    cur = hook.get_records(sql)

#    f = open(filename,'w')
#    print >>f, cur

    c = csv.writer(open(filename,"wb"), quoting=csv.QUOTE_NONNUMERIC)

    for row in cur:
        c.writerow(row)

    c.close()

    return cur;

dag = DAG('hello_sql_to_s3', description='Simple tutorial DAG with s3 and mysql',
          schedule_interval='0 12 * * *',
          start_date=datetime(2017, 3, 20), catchup=False)

dummy_operator = DummyOperator(task_id='dummy_task', retries=3, dag=dag)

hello_operator = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)

get_mysqldata_operator = PythonOperator(
    task_id='get_mysql_data',
    python_callable=get_data_from_mysql,
        op_kwargs={
            'filename': '/home/ubuntu/temp/sql_file.csv',
            'tablename': 'leagues'
        }
)

upload_to_S3_operator = PythonOperator(
    task_id='upload_to_S3',
    python_callable=upload_file_to_S3_with_hook,
        op_kwargs={
          'filename': '/home/ubuntu/temp/sql_file.csv',
          'key': 'my_S3_sql_file.csv',
          'bucket_name': 'insight-leckband',
      },
      dag=dag)

dummy_operator >> hello_operator >> get_mysqldata_operator >> upload_to_S3_operator
