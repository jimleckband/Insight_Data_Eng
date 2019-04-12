# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for league_playoff_fixtures.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `league_playoff_fixtures`;
CREATE TABLE IF NOT EXISTS `league_playoff_fixtures` (`league_id` INT, `team_id0` INT, `team_id1` INT, `winner` INT, `finished` TINYINT, `best_of` SMALLINT, `played` SMALLINT, `round` SMALLINT, `result0` SMALLINT, `result1` SMALLINT);
insert into `league_playoff_fixtures` (`league_id`, `team_id0`, `team_id1`, `winner`, `finished`, `best_of`, `played`, `round`, `result0`, `result1`) VALUES (105, 139, 58, 58, 1, 5, 3, 0, 0, 3), (105, 57, 140, 140, 1, 5, 3, 0, 0, 3), (105, 142, 109, 109, 1, 5, 5, 0, 2, 3), (105, 122, 103, 122, 1, 5, 3, 0, 3, 0), (105, 140, 58, 58, 1, 7, 5, 1, 1, 4), (105, 122, 109, 122, 1, 7, 6, 1, 4, 2), (105, 122, 58, 58, 1, 7, 7, 2, 3, 4), (106, 63, 144, 144, 1, 5, 4, 0, 1, 3), (106, 62, 67, 67, 1, 5, 5, 0, 2, 3), (106, 145, 118, 118, 1, 5, 5, 0, 2, 3), (106, 126, 125, 125, 1, 5, 3, 0, 0, 3), (106, 67, 144, 67, 1, 7, 6, 1, 4, 2), (106, 125, 118, 125, 1, 7, 5, 1, 4, 1), (106, 67, 125, 67, 1, 7, 6, 2, 4, 2);

# 
# Dump completed
