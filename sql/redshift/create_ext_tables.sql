Field                                  | Type         | Null | Key | Default | Extra |
+----------------------------------------+--------------+------+-----+---------+-------+
| league_id                              | int(11)      | NO   | PRI | 0       |       |
| name                                   | varchar(50)  | YES  |     | NULL    |       |
| abbr                                   | varchar(50)

create table leagues (league_id int, name varchar(50), abbr varchar(50))

create table leagues_dim (league_id int, name varchar(50), abbr varchar(50))

create table teams_dim (team_id int, name varchar(50), abbr varchar(50), nickname varchar(50), league_id int)

create table players_dim (player_id int, team_id int, league_id int, first_name varchar(50),
    last_name varchar(50), nick_name varchar(50), age int, bats int, throws int, position int)


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

create external table baseball_ext.dw_players_career_batting_stats (
player_id integer,
year integer,
team_id integer,
game_id integer,
league_id integer,
level_id integer,
split_id integer,
position integer,
ab integer,
h integer,
k integer,
pa integer,
pitches_seen integer,
g integer,
gs integer,
d integer,
t integer,
hr integer,
r integer,
rbi integer,
sb integer,
cs integer,
bb integer,
ibb integer,
gdp integer,
sh integer,
sf integer,
hp integer,
ci integer,
wpa double,
stint integer,
war double)
partitioned by (load_date char(10), customer_id integer)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  'separatorChar' = ',',
  'quoteChar' = '\"')
stored as textfile
location 's3://insight-leckband/'

alter table baseball_ext.dw_players_career_batting_stats add
partition(load_date='2019-02-12',customer_id='1')
location 's3://insight-leckband/load_date=2019-02-12/customer_id=1/';


alter table baseball_ext.dw_players_career_batting_stats add
partition(load_date='2019-03-02',customer_id='1')
location 's3://insight-leckband/load_date=2019-03-02/customer_id=1/';
