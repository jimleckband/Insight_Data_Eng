# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for sub_leagues.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `sub_leagues`;
CREATE TABLE IF NOT EXISTS `sub_leagues` (`league_id` INT, `sub_league_id` INT, `name` VARCHAR(50), `abbr` VARCHAR(50), `gender` INT, `designated_hitter` TINYINT, PRIMARY KEY (`league_id`, `sub_league_id`));
insert into `sub_leagues` (`league_id`, `sub_league_id`, `name`, `abbr`, `gender`, `designated_hitter`) VALUES (100, 0, "National League", "NL", 0, 1), (100, 1, "American League", "AL", 0, 1), (101, 0, "", "", 0, 1), (102, 0, "", "", 0, 1), (103, 0, "", "", 0, 1), (104, 0, "", "", 0, 1), (105, 0, "Sub League 1", "SL1", 0, 0), (105, 1, "Sub League 2", "SL2", 0, 0), (106, 0, "", "", 0, 0), (106, 1, "Sub League 2", "SL2", 0, 0), (107, 0, "", "", 0, 1);

# 
# Dump completed
