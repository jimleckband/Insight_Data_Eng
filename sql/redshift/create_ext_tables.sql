Field                                  | Type         | Null | Key | Default | Extra |
+----------------------------------------+--------------+------+-----+---------+-------+
| league_id                              | int(11)      | NO   | PRI | 0       |       |
| name                                   | varchar(50)  | YES  |     | NULL    |       |
| abbr                                   | varchar(50)

create table leagues (league_id int, name varchar(50), abbr varchar(50))

drop  schema baseball_ext;

create external schema baseball_ext 
from data catalog 
database 'baseball'
iam_role 'arn:aws:iam::356032320829:role/Redshift-spectrum'
create external database if not exists;


create external table baseball_ext.ext_leagues (
  	league_id int,
  	name varchar(50),
  	abbr varchar(50))
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  'separatorChar' = ',',
  'quoteChar' = '\"')
stored as textfile
location 's3://insight-leckband/test_folder/'


