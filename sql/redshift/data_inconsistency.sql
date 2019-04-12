Script

0. Look at Flask sheet
1. Update dw table to make descrepancy
2. Update staged_partition table to lowest checksum_date
3. Run partition consistency check
4. Look at Flask results
5. Run partition load
6. Update staged_partition table to lowest checksum_date
7. Run partition consistency check


update dw_players_career_batting_stats set g = g + 1 where load_date='2018-12-14' and 
    player_id = 17809;


update staged_partitions set checksum_date = '2010-12-15' where load_date = '2018-12-14';
