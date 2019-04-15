from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator, BranchPythonOperator
from airflow.contrib.hooks.aws_sns_hook import AwsSnsHook
from airflow.contrib.operators.sns_publish_operator import SnsPublishOperator
from airflow.models import Variable

#################### Procedures ###############

def demo_check():

    demo = Variable.get("Demo_Flag")

    if demo:
        return "send_test_sns"
    else:
        return "end_task"


#################### DAG ###############

dag = DAG('sns_test', description='Test Amazon SNS',
          schedule_interval='* * 12 * *',
          start_date=datetime(2019, 3, 20), catchup=False)

#################### Operators ###############

dummy_operator = DummyOperator(task_id='start_task', retries=3, dag=dag)

skip_operator = DummyOperator(task_id='skip_message', trigger_rule='one_success', dag=dag)

end_operator = DummyOperator(task_id='end_task', trigger_rule='one_success', dag=dag)

demo_check_operator = BranchPythonOperator(
    task_id='demo_check',
    python_callable=demo_check,
    trigger_rule='one_success',
    dag=dag
)

test_sns_operator = SnsPublishOperator(
    task_id='send_test_sns',
    target_arn='arn:aws:sns:us-west-2:356032320829:airflow',
    message='Testing from airflow',
    aws_conn_id='S3_conn',
    trigger_rule='one_success',
    dag=dag
)

#################### Flow ###############

dummy_operator >> demo_check_operator
demo_check_operator >> test_sns_operator
demo_check_operator >> skip_operator

test_sns_operator >> end_operator
skip_operator >> end_operator
