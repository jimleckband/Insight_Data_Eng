# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for divisions.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `divisions`;
CREATE TABLE IF NOT EXISTS `divisions` (`league_id` INT, `sub_league_id` INT, `division_id` INT, `name` VARCHAR(50), `gender` INT, PRIMARY KEY (`league_id`, `sub_league_id`, `division_id`));
insert into `divisions` (`league_id`, `sub_league_id`, `division_id`, `name`, `gender`) VALUES (100, 0, 0, "National", 0), (100, 1, 0, "American", 0), (101, 0, 0, "Eastern Division", 0), (101, 0, 1, "Western Division", 0), (102, 0, 0, "Eastern Division", 0), (102, 0, 1, "Western Division", 0), (103, 0, 0, "Eastern Division", 0), (103, 0, 1, "Western Division", 0), (104, 0, 0, "Eastern Division", 0), (104, 0, 1, "Western Division", 0), (105, 0, 0, "Eastern Division", 0), (105, 0, 1, "Western Division", 0), (105, 1, 0, "Eastern Division", 0), (105, 1, 1, "Western Division", 0), (106, 0, 0, "Eastern Division", 0), (106, 0, 1, "Western Division", 0), (106, 1, 0, "Eastern Division", 0), (106, 1, 1, "Western Division", 0), (107, 0, 0, "Eastern Division", 0), (107, 0, 1, "Western Division", 0);

# 
# Dump completed
