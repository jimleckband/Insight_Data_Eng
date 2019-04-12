# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for continents.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `continents`;
CREATE TABLE IF NOT EXISTS `continents` (`continent_id` INT, `name` VARCHAR(50), `abbreviation` VARCHAR(50), `demonym` VARCHAR(50), `population` INT, `main_language_id` INT, PRIMARY KEY (`continent_id`));
insert into `continents` (`continent_id`, `name`, `abbreviation`, `demonym`, `population`, `main_language_id`) VALUES (1, "Africa", "AFR", "", 0, 0), (2, "Asia", "ASI", "", 0, 0), (3, "Europe", "EUR", "", 0, 0), (4, "North America", "NOR", "", 0, 0), (5, "Oceania", "OCE", "", 0, 0), (6, "South America", "SOU", "", 0, 0);

# 
# Dump completed
