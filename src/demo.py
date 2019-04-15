from airflow.operators.python_operator import PythonOperator, BranchPythonOperator
from airflow.operators.dummy_operator import DummyOperator
from airflow.contrib.operators.sns_publish_operator import SnsPublishOperator
from airflow.models import Variable

def demo_check():

    demo = Variable.get("Demo_Flag")

    if demo:
        if demo == '1':
            return "send_sns"

    return "end_task"

skip_operator = DummyOperator(task_id='skip_message', trigger_rule='one_success', dag=dag)
end_operator = DummyOperator(task_id='end_task', trigger_rule='one_success', dag=dag)

demo_check_operator = BranchPythonOperator(
    task_id='demo_check',
    python_callable=demo_check,
    trigger_rule='one_success',
    dag=dag
)

sns_operator = SnsPublishOperator(
    task_id='send_sns',
    target_arn='arn:aws:sns:us-west-2:356032320829:airflow',
    message='Airflow fingerprinting done',
    aws_conn_id='S3_conn',
    trigger_rule='one_success',
    dag=dag
)
