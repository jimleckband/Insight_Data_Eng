# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for leagues.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `leagues`;
CREATE TABLE IF NOT EXISTS `leagues` (`league_id` INT, `name` VARCHAR(50), `abbr` VARCHAR(50), `nation_id` INT, `language_id` INT, `gender` INT, `historical_league` TINYINT, `logo_file_name` VARCHAR(200), `players_path` VARCHAR(200), `start_date` DATE, `preferred_start_date` DATE, `pitcher_award_name` VARCHAR(50), `mvp_award_name` VARCHAR(50), `rookie_award_name` VARCHAR(50), `defense_award_name` VARCHAR(50), `fictional_players` TINYINT, `start_fantasy_draft` TINYINT, `trading_deadline` TINYINT, `winter_meetings` TINYINT, `arbitration_offering` TINYINT, `show_draft_pool` TINYINT, `rosters_expanded` TINYINT, `draft_date` DATE, `rule_5_draft_date` DATE, `roster_expand_date` DATE, `trade_deadline_date` DATE, `allstar_date` DATE, `days_until_deadline` INT, `next_draft_type` INT, `parent_league_id` INT, `league_state` SMALLINT, `season_year` INT, `historical_year` SMALLINT, `league_level` SMALLINT, `stats_detail` INT, `historical_import_path` VARCHAR(200), `foreigner_percentage` SMALLINT, `was_ootp6` TINYINT, `was_65` TINYINT, `allstar_game` TINYINT, `auto_schedule_allstar` TINYINT, `allstar_team_id0` INT, `allstar_team_id1` INT, `schedule_file_1` VARCHAR(200), `schedule_file_2` VARCHAR(200), `rules_rule_5` TINYINT, `rules_minor_league_options` TINYINT, `rules_trading` TINYINT, `rules_draft_pick_trading` TINYINT, `rules_financials` TINYINT, `rules_amateur_draft` TINYINT, `rules_fa_compensation` TINYINT, `rules_schedule_balanced` TINYINT, `rules_schedule_inter_league` TINYINT, `rules_schedule_force_start_day` TINYINT, `rules_trades_other_leagues` TINYINT, `rules_free_agents_from_other_leagues` TINYINT, `rules_free_agents_leave_other_leagues` TINYINT, `rules_allstar_game` TINYINT, `rules_spring_training` TINYINT, `rules_active_roster_limit` SMALLINT, `rules_secondary_roster_limit` SMALLINT, `rules_expanded_roster_limit` SMALLINT, `rules_min_service_days` SMALLINT, `rules_waiver_period_length` SMALLINT, `rules_dfa_period_length` SMALLINT, `rules_fa_minimum_years` SMALLINT, `rules_salary_arbitration_minimum_years` SMALLINT, `rules_minor_league_fa_minimum_years` SMALLINT, `rules_foreigner_limit` SMALLINT, `rules_foreigner_pitcher_limit` SMALLINT, `rules_foreigner_hitter_limit` SMALLINT, `rules_schedule_games_per_team` SMALLINT, `rules_schedule_typical_series` SMALLINT, `rules_schedule_preferred_start_day` SMALLINT, `rules_amateur_draft_rounds` SMALLINT, `rules_minimum_salary` INT, `rules_salary_cap` INT, `rules_player_salary0` INT, `rules_player_salary1` INT, `rules_player_salary2` INT, `rules_player_salary3` INT, `rules_player_salary4` INT, `rules_player_salary5` INT, `rules_player_salary6` INT, `rules_player_salary7` INT, `rules_average_coach_salary` INT, `rules_average_attendance` INT, `rules_average_national_media_contract` INT, `rules_cash_maximum` INT, `rules_average_ticket_price` DOUBLE, `rules_revenue_sharing` TINYINT, `rules_national_media_contract_fixed` TINYINT, `rules_owner_decides_budget` TINYINT, `rules_schedule_auto_adjust_dates` TINYINT, `rules_historical_import_rookies` TINYINT, `avg_rating_contact` INT, `avg_rating_gap` INT, `avg_rating_power` INT, `avg_rating_eye` INT, `avg_rating_strikeouts` INT, `avg_rating_stuff` INT, `avg_rating_movement` INT, `avg_rating_control` INT, `avg_rating_fielding0` INT, `avg_rating_fielding1` INT, `avg_rating_fielding2` INT, `avg_rating_fielding3` INT, `avg_rating_fielding4` INT, `avg_rating_fielding5` INT, `avg_rating_fielding6` INT, `avg_rating_fielding7` INT, `avg_rating_fielding8` INT, `avg_rating_fielding9` INT, `avg_rating_overall` INT, `avg_rating_age` DOUBLE, `league_totals_ab` INT, `league_totals_h` INT, `league_totals_d` INT, `league_totals_t` INT, `league_totals_hr` INT, `league_totals_bb` INT, `league_totals_hp` INT, `league_totals_k` INT, `league_totals_pa` INT, `league_totals_babip` DOUBLE, `league_totals_mod_h` DOUBLE, `league_totals_mod_d` DOUBLE, `league_totals_mod_t` DOUBLE, `league_totals_mod_hr` DOUBLE, `league_totals_mod_bb` DOUBLE, `league_totals_mod_hp` DOUBLE, `league_totals_mod_k` DOUBLE, `league_totals_mod_babip` DOUBLE, `ml_equivalencies_avg` DOUBLE, `ml_equivalencies_hr` DOUBLE, `ml_equivalencies_eb` DOUBLE, `ml_equivalencies_bb` DOUBLE, `ml_equivalencies_k` DOUBLE, `ml_equivalencies_hp` DOUBLE, `player_creation_modifier_contact` DOUBLE, `player_creation_modifier_gap` DOUBLE, `player_creation_modifier_power` DOUBLE, `player_creation_modifier_eye` DOUBLE, `player_creation_modifier_strikeouts` DOUBLE, `player_creation_modifier_stuff` DOUBLE, `player_creation_modifier_movement` DOUBLE, `player_creation_modifier_control` DOUBLE, `player_creation_modifier_speed` DOUBLE, `player_creation_modifier_fielding` DOUBLE, `financial_coefficient` DOUBLE, `world_start_year` INT, `current_date` DATE, `background_color_id` VARCHAR(8), `text_color_id` VARCHAR(8), `scouting_coach_id` INT, PRIMARY KEY (`league_id`));
insert into `leagues` (`league_id`, `name`, `abbr`, `nation_id`, `language_id`, `gender`, `historical_league`, `logo_file_name`, `players_path`, `start_date`, `preferred_start_date`, `pitcher_award_name`, `mvp_award_name`, `rookie_award_name`, `defense_award_name`, `fictional_players`, `start_fantasy_draft`, `trading_deadline`, `winter_meetings`, `arbitration_offering`, `show_draft_pool`, `rosters_expanded`, `draft_date`, `rule_5_draft_date`, `roster_expand_date`, `trade_deadline_date`, `allstar_date`, `days_until_deadline`, `next_draft_type`, `parent_league_id`, `league_state`, `season_year`, `historical_year`, `league_level`, `stats_detail`, `historical_import_path`, `foreigner_percentage`, `was_ootp6`, `was_65`, `allstar_game`, `auto_schedule_allstar`, `allstar_team_id0`, `allstar_team_id1`, `schedule_file_1`, `schedule_file_2`, `rules_rule_5`, `rules_minor_league_options`, `rules_trading`, `rules_draft_pick_trading`, `rules_financials`, `rules_amateur_draft`, `rules_fa_compensation`, `rules_schedule_balanced`, `rules_schedule_inter_league`, `rules_schedule_force_start_day`, `rules_trades_other_leagues`, `rules_free_agents_from_other_leagues`, `rules_free_agents_leave_other_leagues`, `rules_allstar_game`, `rules_spring_training`, `rules_active_roster_limit`, `rules_secondary_roster_limit`, `rules_expanded_roster_limit`, `rules_min_service_days`, `rules_waiver_period_length`, `rules_dfa_period_length`, `rules_fa_minimum_years`, `rules_salary_arbitration_minimum_years`, `rules_minor_league_fa_minimum_years`, `rules_foreigner_limit`, `rules_foreigner_pitcher_limit`, `rules_foreigner_hitter_limit`, `rules_schedule_games_per_team`, `rules_schedule_typical_series`, `rules_schedule_preferred_start_day`, `rules_amateur_draft_rounds`, `rules_minimum_salary`, `rules_salary_cap`, `rules_player_salary0`, `rules_player_salary1`, `rules_player_salary2`, `rules_player_salary3`, `rules_player_salary4`, `rules_player_salary5`, `rules_player_salary6`, `rules_player_salary7`, `rules_average_coach_salary`, `rules_average_attendance`, `rules_average_national_media_contract`, `rules_cash_maximum`, `rules_average_ticket_price`, `rules_revenue_sharing`, `rules_national_media_contract_fixed`, `rules_owner_decides_budget`, `rules_schedule_auto_adjust_dates`, `rules_historical_import_rookies`, `avg_rating_contact`, `avg_rating_gap`, `avg_rating_power`, `avg_rating_eye`, `avg_rating_strikeouts`, `avg_rating_stuff`, `avg_rating_movement`, `avg_rating_control`, `avg_rating_fielding0`, `avg_rating_fielding1`, `avg_rating_fielding2`, `avg_rating_fielding3`, `avg_rating_fielding4`, `avg_rating_fielding5`, `avg_rating_fielding6`, `avg_rating_fielding7`, `avg_rating_fielding8`, `avg_rating_fielding9`, `avg_rating_overall`, `avg_rating_age`, `league_totals_ab`, `league_totals_h`, `league_totals_d`, `league_totals_t`, `league_totals_hr`, `league_totals_bb`, `league_totals_hp`, `league_totals_k`, `league_totals_pa`, `league_totals_babip`, `league_totals_mod_h`, `league_totals_mod_d`, `league_totals_mod_t`, `league_totals_mod_hr`, `league_totals_mod_bb`, `league_totals_mod_hp`, `league_totals_mod_k`, `league_totals_mod_babip`, `ml_equivalencies_avg`, `ml_equivalencies_hr`, `ml_equivalencies_eb`, `ml_equivalencies_bb`, `ml_equivalencies_k`, `ml_equivalencies_hp`, `player_creation_modifier_contact`, `player_creation_modifier_gap`, `player_creation_modifier_power`, `player_creation_modifier_eye`, `player_creation_modifier_strikeouts`, `player_creation_modifier_stuff`, `player_creation_modifier_movement`, `player_creation_modifier_control`, `player_creation_modifier_speed`, `player_creation_modifier_fielding`, `financial_coefficient`, `world_start_year`, `current_date`, `background_color_id`, `text_color_id`, `scouting_coach_id`) VALUES (100, "Fictional Baseball League", "FBL", 206, 0, 0, 0, "fictional_baseball_league.png", "", "1914-4-6", "1914-4-1", "Cy Young Award", "Babe Ruth Award", "Rookie of the Year Award", "Gold Glove Award", 0, 0, 0, 0, 0, 0, 0, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1914-6-25", -1, 0, 0, 2, 1914, 1914, 1, 3, "", 0, 0, 0, 1, 1, 101, 102, "iln_bgn_g162_sl1d1t7d2t7_c_t14-d120-n42.lsdl", "", 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 25, 0, 0, 172, 0, 0, 5, 3, 0, 0, 0, 0, 158, 3, 2, 20, 712, 0, 890, 1440, 1660, 2380, 3080, 3320, 3800, 4740, 720, 5655, 0, 4180, 0.8700, 1, 1, 1, 1, 0, 111, 119, 92, 86, 110, 116, 131, 114, 0, 98, 98, 79, 105, 110, 119, 149, 111, 103, 109, 0.0000, 165849, 43524, 8737, 949, 5042, 16620, 1590, 33591, 184059, 0.3025, 1.0200, 1.0000, 1.0000, 1.0500, 1.0000, 1.0000, 0.9500, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (101, "FBL Triple A", "FBLAAA", 206, 0, 0, 0, "fbl_triple_a.png", "", "1914-4-14", "1914-4-8", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 1, 0, 0, 0, 1, 0, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1871-6-22", -1, 0, 100, 2, 1914, 1914, 2, 1, "", 0, 0, 0, 0, 1, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 25, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 144, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12000, 0, 0, 0.0000, 0, 0, 0, 1, 0, 98, 115, 82, 85, 99, 103, 122, 100, 0, 100, 98, 81, 114, 103, 110, 132, 123, 135, 100, 0.0000, 88639, 24009, 4865, 613, 2533, 8753, 947, 18596, 98339, 0.3181, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 0.8500, 0.8000, 0.8500, 0.8500, 0.8500, 0.8500, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (102, "FBL Double A", "FBLAA", 206, 0, 0, 0, "fbl_double_a.png", "", "1914-4-9", "1914-4-4", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 1, 0, 0, 0, 1, 0, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1871-6-27", -1, 0, 100, 2, 1914, 1914, 3, 1, "", 0, 0, 0, 0, 1, 0, 0, "iln_bgy_g140_t8_c_h2005.lsdl", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 25, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 140, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10500, 0, 0, 0.0000, 0, 0, 0, 1, 0, 95, 110, 71, 69, 95, 96, 107, 91, 0, 108, 122, 84, 115, 112, 134, 114, 121, 126, 91, 0.0000, 87960, 23392, 4654, 593, 2107, 9239, 1111, 17992, 98310, 0.3137, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 0.8000, 0.7500, 0.8000, 0.8000, 0.8000, 0.8000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (103, "FBL Single A", "FBLA", 206, 0, 0, 0, "fbl_single_a.png", "", "1914-4-9", "1914-4-4", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 1, 0, 0, 0, 1, 0, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1871-6-27", -1, 0, 100, 2, 1914, 1914, 4, 1, "", 0, 0, 0, 0, 1, 0, 0, "iln_bgy_g140_t8_c_h2005.lsdl", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 25, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 140, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9000, 0, 0, 0.0000, 0, 0, 0, 1, 0, 86, 105, 54, 62, 82, 91, 94, 70, 0, 109, 104, 76, 133, 142, 127, 145, 125, 134, 80, 0.0000, 88838, 22982, 4608, 635, 1787, 8354, 1267, 19495, 98459, 0.3137, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 0.7500, 0.7000, 0.7500, 0.7500, 0.7500, 0.7500, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (104, "FBL Rookie League", "FBLR", 206, 0, 0, 0, "fbl_rookie_league.png", "", "1914-6-23", "1914-6-20", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 1, 0, 0, 0, 1, 1, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1871-7-25", -1, 0, 100, 0, 1914, 1914, 6, 1, "", 0, 0, 0, 0, 1, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 68, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6000, 0, 0, 0.0000, 0, 0, 0, 1, 0, 97, 107, 82, 80, 100, 102, 115, 92, 0, 105, 96, 89, 123, 120, 123, 120, 105, 119, 96, 0.0000, 88229, 23532, 4658, 977, 1674, 8674, 1654, 21607, 98557, 0.3365, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 0.6000, 0.5000, 0.6000, 0.5000, 0.6000, 0.6000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (105, "FBL College", "FBLCOL", 206, 0, 0, 0, "fbl_college.png", "", "1915-3-15", "1915-3-15", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 0, 0, 0, 0, 0, 0, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1871-4-26", -1, 0, 100, 4, 1914, 1914, 10, 1, "", 0, 0, 0, 0, 1, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 50, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1500, 0, 0, 0.0000, 0, 0, 0, 1, 0, 36, 52, 26, 31, 30, 44, 68, 18, 0, 90, 55, 53, 61, 71, 87, 71, 65, 80, 39, 0.0000, 165849, 43524, 8737, 949, 5042, 16620, 1590, 33591, 184059, 0.3025, 1.0500, 1.0000, 1.0000, 1.2000, 1.1000, 1.0000, 1.0000, 1.0000, 0.6000, 0.5000, 0.6000, 0.5000, 0.6000, 0.6000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (106, "FBL High School", "FBLHS", 206, 0, 0, 0, "fbl_high_school.png", "", "1915-3-15", "1915-3-15", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 0, 0, 0, 0, 0, 0, "1914-6-15", "1871-12-1", "1914-9-1", "1914-7-31", "1871-4-22", -1, 0, 100, 4, 1914, 1914, 11, 1, "", 0, 0, 0, 0, 1, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 40, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 400, 0, 0, 0.0000, 0, 0, 0, 1, 0, 17, 29, 15, 18, 15, 21, 69, 9, 0, 78, 18, 19, 26, 28, 22, 32, 23, 26, 25, 0.0000, 165849, 43524, 8737, 949, 5042, 16620, 1590, 33591, 184059, 0.3025, 1.1000, 1.1000, 1.0000, 1.2000, 1.2000, 1.0000, 1.0000, 1.0000, 0.5000, 0.4000, 0.5000, 0.4000, 0.5000, 0.5000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0), (107, "FBL Short Season A", "FBLS A", 206, 0, 0, 0, "fbl_short_season_a.png", "", "1914-6-23", "1914-6-20", "Outstanding Pitcher Award", "Outstanding Hitter Award", "Newcomer of the Year Award", "Glove Wizard Award", 0, 1, 0, 0, 0, 0, 1, "1914-6-15", "1872-12-1", "1914-9-1", "1914-7-31", "1872-7-30", -1, 0, 100, 0, 1914, 1913, 5, 1, "", 0, 0, 0, 0, 1, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 76, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7500, 0, 0, 0.0000, 0, 0, 0, 1, 0, 77, 101, 45, 51, 72, 79, 87, 55, 0, 109, 95, 71, 120, 137, 127, 130, 140, 96, 70, 0.0000, 87643, 22198, 4454, 713, 1370, 9259, 1479, 21294, 98381, 0.3205, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 0.7000, 0.6000, 0.7000, 0.6000, 0.7000, 0.7000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1879, "1914-6-22", "#1E1E9E", "#DD0101", 0);

# 
# Dump completed
