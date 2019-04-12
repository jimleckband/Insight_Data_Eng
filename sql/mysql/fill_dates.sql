#Helper procedure to fill dates and data from a seed table

DELIMITER $$
CREATE PROCEDURE filldates (in dateStart DATE,in dateEnd DATE)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO staged_partitions VALUES (dateStart, 0, now(), 'something', 'something');
    SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
  END WHILE;
END $$
DELIMITER ;

CALL filldates('2011-03-02','2018-11-29');

update temp_date set dw_date = date_day

insert into dw_players_career_batting_stats select d.dw_date, p.* from temp_date d, players_career_batting_stats p;

DELIMITER $$
CREATE PROCEDURE filldata (in dateStart DATE,in dateEnd DATE)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO temp_date (date_day) VALUES (dateStart);
    INSERT INTO dw_players_career_batting_stats select dateStart, d.* from players_career_batting_stats d;
    SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
    commit;
  END WHILE;
END $$
DELIMITER ;

CALL filldata('2011-03-02','2016-03-01');

#Calculate size of database

SELECT table_schema "DB Name",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB"
FROM information_schema.tables
GROUP BY table_schema;
