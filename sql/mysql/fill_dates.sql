CREATE PROCEDURE 'filldates' (in dateStart DATE,in dateEnd DATE)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO dw_date (date_day) VALUES (dateStart);
    SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
  END WHILE;
END

CALL filldates('2018-12-01','2019-03-01');
