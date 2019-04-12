# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for languages.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (`language_id` INT, `name` VARCHAR(50), PRIMARY KEY (`language_id`));
insert into `languages` (`language_id`, `name`) VALUES (19, "African"), (21, "Albanian"), (17, "Arabic"), (26, "Armenian"), (28, "Australian"), (31, "Austrian"), (29, "Azerbaijan"), (32, "Canadian"), (4, "Chinese"), (14, "Czech"), (25, "Danish"), (6, "Dutch"), (34, "Filipino"), (11, "Finnish"), (8, "French"), (7, "German"), (23, "Greek"), (1, "Hispanic"), (27, "Indian"), (36, "Indonesian"), (18, "Irish"), (9, "Italian"), (2, "Japanese"), (3, "Korean"), (37, "Pakistani"), (15, "Polish"), (30, "Polynesian"), (5, "Portugese"), (35, "Romanian"), (13, "Russian"), (10, "Scandinavien"), (16, "Scottish"), (22, "Serbian"), (12, "Swedish"), (24, "Turkish"), (39, "U.S. (African-American)"), (0, "U.S. (Modern)"), (20, "UK"), (38, "Vietnamese");

# 
# Dump completed
