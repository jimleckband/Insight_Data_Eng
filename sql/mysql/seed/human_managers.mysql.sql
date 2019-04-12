# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for human_managers.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `human_managers`;
CREATE TABLE IF NOT EXISTS `human_managers` (`human_manager_id` INT, `is_commish` TINYINT, `first_name` VARCHAR(50), `last_name` VARCHAR(50), `nick_name` VARCHAR(50), `age` SMALLINT, `date_of_birth` DATE, `city_of_birth_id` INT, `nation_id` INT, `second_nation_id` INT, `weight` SMALLINT, `height` SMALLINT, `retired` TINYINT, `free_agent` TINYINT, `league_id` INT, `last_league_id` INT, `team_id` INT, `last_team_id` INT, `organization_id` INT, `last_organization_id` INT, `language_ids0` INT, `language_ids1` INT, `uniform_number` SMALLINT, `experience` SMALLINT, `person_type` SMALLINT, `bats` SMALLINT, `throws` SMALLINT, `personality_greed` SMALLINT, `personality_loyalty` SMALLINT, `personality_play_for_winner` SMALLINT, `personality_work_ethic` SMALLINT, `personality_intelligence` SMALLINT, `personality_leader` SMALLINT);
insert into `human_managers` (`human_manager_id`, `is_commish`, `first_name`, `last_name`, `nick_name`, `age`, `date_of_birth`, `city_of_birth_id`, `nation_id`, `second_nation_id`, `weight`, `height`, `retired`, `free_agent`, `league_id`, `last_league_id`, `team_id`, `last_team_id`, `organization_id`, `last_organization_id`, `language_ids0`, `language_ids1`, `uniform_number`, `experience`, `person_type`, `bats`, `throws`, `personality_greed`, `personality_loyalty`, `personality_play_for_winner`, `personality_work_ethic`, `personality_intelligence`, `personality_leader`) VALUES (1, 0, "Jim", "Leckband", "", 83, "1831-3-15", 0, 206, 0, 190, 183, 0, 1, 0, 100, 0, 90, 0, 90, -1, -1, 0, 30, 2, 0, 0, 0, 150, 0, 0, 0, 0), (2, 1, "Jimmy", "Leckband", "", 64, "1850-3-15", 0, 206, 0, 190, 183, 0, 0, 100, 100, 3, 127, 3, 127, -1, -1, 0, 14, 2, 0, 0, 0, 150, 0, 0, 0, 0);

# 
# Dump completed
