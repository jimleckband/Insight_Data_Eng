from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.hooks.mysql_hook import MySqlHook
from airflow.hooks.postgres_hook import PostgresHook

import logging

#################### Initializations ###############

# Connections are defined in Airflow GUI
mysql_hook = MySqlHook(mysql_conn_id='mysql_baseball')
redshift_hook = PostgresHook(postgres_conn_id='redshift_host')

# Warehouse table columns in list and string form
batting_columns_list = ['load_date','player_id','year','team_id','game_id','league_id','level_id','split_id','position','ab','h','k','pa','pitches_seen','g','gs','d','t','hr','r','rbi','sb','cs','bb','ibb','gdp','sh','sf','hp','ci','wpa','stint','war']
batting_columns_sql = ','.join(batting_columns_list)

#################### Procedures ###############

def get_stale_partition(**kwargs):

    mysql_sql = "select load_date from staged_partitions order by checksum_date asc"
    mysql_cur = mysql_hook.get_records(mysql_sql)

    stale_partition = mysql_cur[0][0]

    batting_columns_mysql_md5  = "select md5(concat(md5(" + '),md5('.join(batting_columns_list) + "))) as hash "
    batting_columns_mysql_md5 += "from dw_players_career_batting_stats "
    batting_columns_mysql_md5 += "where load_date='" + stale_partition + "') as t"

    fingerprint_mysql_sql  = "select sum(cast(conv(substring(hash, 1,8), 16, 10) as unsigned)), "
    fingerprint_mysql_sql +=       "sum(cast(conv(substring(hash, 9,8), 16, 10) as unsigned)), "
    fingerprint_mysql_sql +=       "sum(cast(conv(substring(hash,17,8), 16, 10) as unsigned)), "
    fingerprint_mysql_sql +=       "sum(cast(conv(substring(hash,25,8), 16, 10) as unsigned)) "
    fingerprint_mysql_sql += "from ( " + batting_columns_mysql_md5

    mysql_cur = mysql_hook.get_records(fingerprint_mysql_sql)

    fingerprint_mysql=''

    for fp in mysql_cur[0]:
        fingerprint_mysql = fingerprint_mysql + str(fp)

    batting_columns_redshift_md5  = "select md5(md5(" + ') || md5('.join(batting_columns_list) + ")) as hash "
    batting_columns_redshift_md5 += "from baseball_ext.dw_players_career_batting_stats "
    batting_columns_redshift_md5 += "where load_date='" + stale_partition + "') as t"

    fingerprint_redshift_sql  = "select sum(trunc(strtol(substring(hash, 1,8), 16))), "
    fingerprint_redshift_sql +=        "sum(trunc(strtol(substring(hash, 9,8), 16))), "
    fingerprint_redshift_sql +=        "sum(trunc(strtol(substring(hash,17,8), 16))), "
    fingerprint_redshift_sql +=        "sum(trunc(strtol(substring(hash,25,8), 16))) "
    fingerprint_redshift_sql += "from ( " + batting_columns_redshift_md5

    redshift_cur = redshift_hook.get_records(fingerprint_redshift_sql)

    fingerprint_redshift=''

    for fp in redshift_cur[0]:
        fingerprint_redshift += str(int(fp))

    insert_fingerprint_sql  = "update staged_partitions set mysql_fingerprint='" + fingerprint_mysql + "', redshift_fingerprint='" + fingerprint_redshift + "', "
    insert_fingerprint_sql += "checksum_date=NOW() "
    insert_fingerprint_sql += "where load_date = '" + stale_partition + "'"

    mysql_hook.run(insert_fingerprint_sql)

    if fingerprint_mysql != fingerprint_redshift:
        mysql_rerun_stage_sql = "update staged_partitions set staged=0 where load_date = '" + stale_partition + "'"
        mysql_hook.run(mysql_rerun_stage_sql)

#################### DAG ###############

dag = DAG('fingerprint_data', description='Maintain unique fingerprints of database data',
          schedule_interval='*/5 * * * *',
          start_date=datetime(2019, 3, 20), catchup=False)

#################### Operators ###############

dummy_operator = DummyOperator(task_id='start_task', retries=3, dag=dag)

get_stale_partition_operator = PythonOperator(
    task_id='get_stale_partition',
    python_callable=get_stale_partition,
    provide_context=True,
    dag=dag
)

#################### Flow ###############

dummy_operator >> get_stale_partition_operator
