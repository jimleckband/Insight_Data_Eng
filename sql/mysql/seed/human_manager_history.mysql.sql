# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for human_manager_history.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `human_manager_history`;
CREATE TABLE IF NOT EXISTS `human_manager_history` (`human_manager_id` INT, `team_id` INT, `year` SMALLINT, `league_id` INT, `sub_league_id` INT, `division_id` INT, `best_hitter_id` INT, `best_pitcher_id` INT, `best_rookie_id` INT, `manager_id` INT, `made_playoffs` TINYINT, `won_playoffs` TINYINT, `fired` TINYINT, `position_in_division` SMALLINT);
insert into `human_manager_history` (`human_manager_id`, `team_id`, `year`, `league_id`, `sub_league_id`, `division_id`, `best_hitter_id`, `best_pitcher_id`, `best_rookie_id`, `manager_id`, `made_playoffs`, `won_playoffs`, `fired`, `position_in_division`) VALUES (1, 19, 1871, 100, 0, 0, 293, 293, 0, 0, 0, 0, 0, 0), (1, 19, 1872, 100, 0, 0, 298, 888, 0, 0, 0, 0, 0, 0), (1, 19, 1873, 100, 0, 0, 198, 615, 0, 0, 0, 0, 0, 0), (1, 19, 1874, 100, 0, 0, 615, 282, 0, 0, 0, 0, 0, 0), (1, 19, 1875, 100, 0, 0, 615, 545, 0, 0, 0, 0, 0, 0), (1, 19, 1876, 100, 0, 0, 198, 983, 0, 0, 0, 0, 0, 0), (1, 19, 1877, 100, 0, 0, 198, 1227, 0, 0, 0, 0, 0, 0), (1, 19, 1878, 100, 0, 0, 198, 4362, 0, 0, 0, 0, 0, 0), (1, 19, 1879, 100, 0, 0, 198, 1346, 0, 0, 0, 0, 0, 0), (1, 19, 1880, 100, 0, 0, 4220, 4220, 0, 0, 0, 1, 0, 0), (1, 78, 1881, 100, 0, 0, 4724, 973, 0, 0, 0, 0, 0, 0), (1, 78, 1882, 100, 0, 0, 200, 1553, 0, 0, 0, 0, 0, 0), (1, 78, 1883, 100, 0, 1, 200, 1570, 0, 0, 0, 0, 0, 0), (1, 78, 1884, 100, 0, 1, 416, 4583, 0, 0, 1, 1, 0, 0), (1, 1, 1885, 100, 0, 0, 1482, 716, 0, 0, 0, 0, 1, 0), (1, 1, 1886, 100, 0, 0, 1181, 749, 0, 0, 0, 0, 0, 0), (1, 1, 1887, 100, 0, 0, 5137, 5204, 0, 0, 1, 0, 0, 0), (1, 1, 1888, 100, 0, 0, 5137, 3303, 0, 0, 0, 0, 0, 0), (1, 1, 1889, 100, 0, 0, 4624, 394, 0, 0, 0, 0, 0, 0), (1, 1, 1890, 100, 0, 0, 4624, 680, 0, 0, 1, 1, 0, 0), (1, 2, 1891, 100, 0, 0, 4134, 5953, 0, 0, 0, 0, 0, 0), (1, 2, 1892, 100, 0, 0, 4134, 7081, 0, 0, 1, 1, 0, 0), (1, 2, 1893, 100, 0, 0, 4134, 6971, 0, 0, 1, 1, 0, 0), (1, 2, 1894, 100, 0, 0, 4134, 7075, 0, 0, 1, 1, 0, 0), (1, 2, 1895, 100, 0, 0, 4134, 496, 0, 0, 1, 1, 0, 0), (1, 90, 1896, 100, 0, 0, 6835, 2897, 0, 0, 0, 0, 0, 0), (1, 90, 1897, 100, 0, 0, 3844, 8588, 0, 0, 0, 0, 0, 0), (1, 90, 1898, 100, 0, 0, 3844, 1657, 0, 0, 1, 1, 0, 0), (1, 90, 1899, 100, 0, 0, 3844, 514, 0, 0, 1, 1, 0, 0), (1, 90, 1900, 100, 0, 0, 3844, 5932, 0, 0, 1, 1, 0, 0), (2, 20, 1901, 100, 0, 1, 5545, 7678, 0, 0, 0, 0, 0, 0), (2, 20, 1902, 100, 0, 1, 5545, 7594, 0, 0, 1, 0, 0, 0), (2, 20, 1903, 100, 0, 1, 5545, 3231, 0, 0, 0, 0, 0, 0), (2, 20, 1904, 100, 0, 1, 7594, 2299, 0, 0, 0, 0, 0, 0), (2, 20, 1905, 100, 0, 1, 7594, 10244, 0, 0, 0, 0, 0, 0), (2, 20, 1906, 100, 0, 1, 10094, 9027, 0, 0, 0, 0, 0, 0), (2, 20, 1907, 100, 0, 1, 11294, 11294, 0, 0, 0, 0, 0, 0), (2, 20, 1908, 100, 0, 1, 12493, 3708, 0, 0, 1, 1, 0, 0), (2, 127, 1909, 100, 0, 1, 11456, 11649, 0, 0, 0, 0, 0, 0), (2, 127, 1910, 100, 1, 0, 11456, 12807, 0, 0, 1, 1, 0, 0), (2, 127, 1911, 100, 1, 0, 11456, 13052, 0, 0, 0, 0, 0, 0), (2, 127, 1912, 100, 1, 0, 11653, 6712, 0, 0, 1, 1, 0, 0), (2, 3, 1913, 100, 1, 0, 15033, 4976, 0, 0, 0, 0, 0, 0), (2, 3, 1914, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

# 
# Dump completed
