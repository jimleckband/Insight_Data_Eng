# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for human_manager_history_financials.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `human_manager_history_financials`;
CREATE TABLE IF NOT EXISTS `human_manager_history_financials` (`human_manager_id` INT, `team_id` INT, `year` SMALLINT, `league_id` INT, `sub_league_id` INT, `division_id` INT, `gate_revenue` INT, `media_revenue` INT, `merchandising_revenue` INT, `other_revenue` INT, `revenue_sharing` INT, `playoff_revenue` INT, `cash` INT, `player_expenses` INT, `staff_expenses` INT, `stadium_expenses` INT, `attendance` INT, `fan_interest` SMALLINT, `fan_loyalty` SMALLINT, `fan_modifier` SMALLINT, `ticket_price` DOUBLE, `budget` INT, `market` SMALLINT, `owner_expectation` SMALLINT);
insert into `human_manager_history_financials` (`human_manager_id`, `team_id`, `year`, `league_id`, `sub_league_id`, `division_id`, `gate_revenue`, `media_revenue`, `merchandising_revenue`, `other_revenue`, `revenue_sharing`, `playoff_revenue`, `cash`, `player_expenses`, `staff_expenses`, `stadium_expenses`, `attendance`, `fan_interest`, `fan_loyalty`, `fan_modifier`, `ticket_price`, `budget`, `market`, `owner_expectation`) VALUES (1, 19, 1871, 100, 0, 0, 5609, 548, 2292, 0, 0, 0, 76, 3993, 335, 0, 63923, 59, 8, 0, 0.0000, 4930, 5, 0), (1, 19, 1872, 100, 0, 0, 5757, 548, 2276, 0, 0, 0, 383, 5120, 822, 0, 67072, 56, 8, 0, 0.0000, 5817, 5, 0), (1, 19, 1873, 100, 0, 0, 8234, 548, 3692, 0, 0, 0, 394, 5964, 1303, 0, 91416, 72, 8, 0, 0.0000, 6864, 5, 0), (1, 19, 1874, 100, 0, 0, 8580, 642, 4095, 0, 0, 0, 417, 5715, 1782, 0, 94738, 76, 8, 0, 0.0000, 8100, 5, 0), (1, 19, 1875, 100, 0, 0, 10434, 642, 4865, 0, 0, 0, 442, 6345, 1936, 0, 106196, 81, 8, 0, 0.0000, 9558, 5, 0), (1, 19, 1876, 100, 0, 0, 12633, 663, 5268, 0, 0, 0, 468, 6931, 1939, 0, 108223, 83, 8, 2, 0.0000, 11278, 5, 0), (1, 19, 1877, 100, 0, 0, 14483, 663, 6759, 0, 0, 0, 496, 7597, 2106, 0, 110387, 86, 8, 0, 0.0000, 13308, 5, 0), (1, 19, 1878, 100, 0, 0, 15373, 786, 6938, 0, 0, 0, 525, 8913, 2101, 0, 109542, 87, 8, 0, 0.0000, 15703, 5, 0), (1, 19, 1879, 100, 0, 0, 13770, 786, 5443, 0, 0, 0, 556, 8899, 2276, 0, 92308, 78, 8, 0, 0.0000, 18530, 5, 0), (1, 19, 1880, 100, 0, 0, 15984, 786, 6853, 0, 0, 0, 589, 11095, 2599, 0, 110476, 83, 8, 0, 0.0000, 20516, 5, 0), (1, 78, 1881, 100, 0, 0, 14489, 762, 7543, 0, 15, 0, 624, 12170, 3352, 0, 125390, 77, 9, 0, 0.0000, 21144, 4, 0), (1, 78, 1882, 100, 0, 0, 13875, 762, 7516, 0, -60, 0, 661, 12547, 2602, 0, 118741, 77, 9, 0, 0.0000, 22232, 4, 0), (1, 78, 1883, 100, 0, 1, 16215, 762, 8170, 0, 0, 0, 700, 12143, 2922, 0, 126241, 78, 9, 0, 0.0000, 22705, 4, 0), (1, 78, 1884, 100, 0, 1, 17797, 896, 9681, 0, 0, 709, 742, 15349, 3078, 0, 138957, 80, 9, 0, 0.0000, 24522, 4, 0), (1, 1, 1885, 100, 0, 0, 15919, 1501, 9100, 0, 25, 0, 785, 14795, 3240, 0, 115126, 73, 10, 1, 0.0000, 22020, 7, 0), (1, 1, 1886, 100, 0, 0, 16458, 1501, 8725, 0, 0, 0, 832, 20612, 3406, 0, 114711, 78, 10, 0, 0.0000, 24271, 7, 0), (1, 1, 1887, 100, 0, 0, 18976, 1501, 10090, 0, -498, 737, 881, 17948, 3888, 0, 123117, 83, 10, 0, 0.0000, 25229, 7, 0), (1, 1, 1888, 100, 0, 0, 19226, 1892, 10267, 0, -129, 0, 933, 18580, 4698, 0, 117186, 85, 10, 0, 0.0000, 28004, 7, 0), (1, 1, 1889, 100, 0, 0, 19805, 2440, 810, 0, 0, 0, 989, 18508, 5186, 0, 117822, 79, 10, 0, 0.0000, 38103, 7, 0), (1, 1, 1890, 100, 0, 0, 20339, 2440, 7721, 0, 0, 843, -1060, 20001, 5509, 0, 122882, 81, 10, 5, 0.0000, 30863, 7, 0), (1, 2, 1891, 100, 0, 0, 17584, 19000, 4847, 0, 91, 0, 672, 12477, 4376, 0, 98609, 50, 7, 0, 0.0000, 27530, 5, 0), (1, 2, 1892, 100, 0, 0, 24223, 23000, 7357, 0, -22312, 1101, 708, 16070, 5030, 0, 125645, 75, 9, 0, 0.0000, 32520, 5, 0), (1, 2, 1893, 100, 0, 0, 25076, 23000, 7894, 0, 17, 999, 756, 16653, 5830, 0, 124268, 79, 9, 0, 0.0000, 36748, 5, 0), (1, 2, 1894, 100, 0, 0, 25513, 23000, 8302, 0, 144, 764, 792, 19623, 6487, 0, 121545, 81, 9, 0, 0.0000, 41525, 5, 0), (1, 2, 1895, 100, 0, 0, 25416, 24000, 8405, 0, 0, 909, 840, 19600, 7289, 0, 123025, 84, 9, 2, 0.0000, 46923, 5, 0), (1, 90, 1896, 100, 0, 0, 27496, 26000, 7574, 0, 0, 0, 592, 19284, 7725, 0, 128464, 58, 8, 0, 0.0000, 53688, 6, 0), (1, 90, 1897, 100, 0, 0, 36314, 27000, 8098, 0, 0, 0, 632, 27672, 6609, 0, 176284, 65, 8, 2, 0.0000, 58018, 6, 0), (1, 90, 1898, 100, 0, 0, 38347, 31000, 9479, 0, 0, 1095, 664, 29998, 7427, 0, 187630, 71, 8, 0, 0.0000, 64980, 6, 0), (1, 90, 1899, 100, 0, 0, 40068, 34000, 9930, 0, 0, 1084, 704, 33494, 9322, 0, 189050, 80, 8, 0, 0.0000, 72778, 6, 0), (1, 90, 1900, 100, 0, 0, 41068, 34000, 10672, 0, -201, 1648, 752, 33478, 10278, 0, 193859, 81, 8, 0, 0.0000, 80460, 6, 0), (2, 20, 1901, 100, 0, 1, 31910, 37000, 9674, 0, -98, 0, 1980, 25645, 11244, 0, 127574, 55, 8, 2, 0.0000, 83152, 6, 0), (2, 20, 1902, 100, 0, 1, 36829, 39000, 11781, 0, 207, 1504, 2100, 39599, 9327, 0, 138215, 74, 8, 2, 0.0000, 86443, 6, 0), (2, 20, 1903, 100, 0, 1, 55963, 19000, 0, 0, 0, 0, 2220, 36079, 12667, 0, 130991, 76, 8, 0, 0.0000, 89000, 6, 0), (2, 20, 1904, 100, 0, 1, 91583, 0, 0, 0, 0, 0, 5000, 43207, 12328, 0, 129669, 77, 8, 0, 0.0000, 84000, 6, 0), (2, 20, 1905, 100, 0, 1, 95336, 0, 0, 0, 0, 0, 2500, 51049, 13272, 0, 131544, 82, 8, 1, 0.0000, 89000, 6, 0), (2, 20, 1906, 100, 0, 1, 99037, 0, 0, 0, -866, 0, 7640, 46143, 13590, 0, 127453, 72, 8, 0, 0.0000, 92000, 6, 0), (2, 20, 1907, 100, 0, 1, 102167, 0, 0, 0, 0, 0, 10000, 54910, 15632, 0, 131348, 73, 8, 1, 0.0000, 96000, 6, 0), (2, 20, 1908, 100, 0, 1, 108035, 0, 0, 0, -406, 3927, 2960, 52790, 16432, 0, 136412, 80, 8, 8, 0.0000, 99000, 6, 0), (2, 127, 1909, 100, 0, 1, 143341, 0, 0, 0, 0, 0, 3140, 51767, 14821, 0, 194530, 71, 7, 0, 0.0000, 152000, 2, 0), (2, 127, 1910, 100, 1, 0, 158297, 0, 0, 0, 0, 5329, -847, 52319, 15356, 0, 201915, 77, 7, 0, 0.0000, 150000, 2, 0), (2, 127, 1911, 100, 1, 0, 157122, 0, 0, 0, 0, 0, 3520, 62255, 17552, 0, 193461, 73, 7, 1, 0.0000, 158000, 2, 0), (2, 127, 1912, 100, 1, 0, 159475, 0, 0, 0, 0, 6048, 3720, 71357, 19746, 0, 202088, 80, 7, 0, 0.0000, 164000, 2, 0), (2, 3, 1913, 100, 1, 0, 131645, 0, 0, 0, 0, 0, 3152, 55872, 26075, 0, 146964, 66, 6, 0, 0.0000, 132000, 5, 0), (2, 3, 1914, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0, 0, 0);

# 
# Dump completed