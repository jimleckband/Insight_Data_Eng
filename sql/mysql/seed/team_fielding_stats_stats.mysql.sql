# Sunday, March 24th, 2019 - OOTP Baseball 17.12 Build 75
# 
# Dumping data for team_fielding_stats_stats.mysql.sql
# Game name: The Show
# Game date: 1914-06-22
# 
DROP TABLE IF EXISTS `team_fielding_stats_stats`;
CREATE TABLE IF NOT EXISTS `team_fielding_stats_stats` (`team_id` INT, `year` SMALLINT, `league_id` INT, `level_id` SMALLINT, `split_id` SMALLINT, `position` SMALLINT, `g` INT, `gs` INT, `tc` INT, `a` INT, `po` INT, `e` INT, `dp` INT, `tp` INT, `pb` INT, `sba` INT, `rto` INT, `er` INT, `ip` INT, `ipf` INT, `pct` DOUBLE, `range` DOUBLE, `rtop` DOUBLE, `cera` DOUBLE, PRIMARY KEY (`team_id`));
insert into `team_fielding_stats_stats` (`team_id`, `year`, `league_id`, `level_id`, `split_id`, `position`, `g`, `gs`, `tc`, `a`, `po`, `e`, `dp`, `tp`, `pb`, `sba`, `rto`, `er`, `ip`, `ipf`, `pct`, `range`, `rtop`, `cera`) VALUES (1, 0, 0, 0, 0, 0, 72, 0, 2845, 887, 1884, 74, 85, 0, 8, 146, 60, 0, 5652, 0, 0.9740, 4.4124, 0.4110, 0.0000), (2, 0, 0, 0, 0, 0, 73, 0, 2837, 846, 1937, 54, 75, 0, 2, 121, 53, 0, 5811, 0, 0.9810, 4.3103, 0.4380, 0.0000), (3, 0, 0, 0, 0, 0, 73, 0, 2817, 853, 1929, 35, 66, 0, 7, 112, 57, 0, 5787, 0, 0.9876, 4.3266, 0.5089, 0.0000), (4, 0, 0, 0, 0, 0, 73, 0, 2905, 888, 1969, 48, 67, 0, 4, 141, 58, 0, 5907, 0, 0.9835, 4.3530, 0.4113, 0.0000), (17, 0, 0, 0, 0, 0, 73, 0, 2838, 833, 1954, 51, 67, 0, 10, 118, 57, 0, 5865, 0, 0.9820, 4.2767, 0.4831, 0.0000), (18, 0, 0, 0, 0, 0, 73, 0, 2933, 928, 1957, 48, 69, 0, 7, 126, 50, 0, 5871, 0, 0.9836, 4.4226, 0.3968, 0.0000), (19, 0, 0, 0, 0, 0, 73, 0, 2854, 803, 2006, 45, 57, 0, 4, 110, 50, 0, 6018, 0, 0.9842, 4.2009, 0.4545, 0.0000), (20, 0, 0, 0, 0, 0, 72, 0, 2889, 938, 1896, 55, 82, 0, 2, 175, 63, 0, 5688, 0, 0.9810, 4.4842, 0.3600, 0.0000), (21, 0, 0, 0, 0, 0, 64, 0, 2455, 697, 1712, 46, 61, 0, 4, 78, 45, 0, 5136, 0, 0.9813, 4.2214, 0.5769, 0.0000), (22, 0, 0, 0, 0, 0, 65, 0, 2496, 725, 1727, 44, 83, 0, 8, 86, 37, 0, 5181, 0, 0.9824, 4.2594, 0.4302, 0.0000), (23, 0, 0, 0, 0, 0, 63, 0, 2345, 617, 1687, 41, 51, 0, 7, 121, 45, 0, 5061, 0, 0.9825, 4.0972, 0.3719, 0.0000), (24, 0, 0, 0, 0, 0, 65, 0, 2397, 618, 1726, 53, 54, 0, 4, 119, 53, 0, 5178, 0, 0.9779, 4.0742, 0.4454, 0.0000), (25, 0, 0, 0, 0, 0, 65, 0, 2432, 653, 1733, 46, 52, 0, 8, 113, 38, 0, 5199, 0, 0.9811, 4.1304, 0.3363, 0.0000), (26, 0, 0, 0, 0, 0, 65, 0, 2548, 742, 1765, 41, 56, 0, 10, 105, 37, 0, 5295, 0, 0.9839, 4.2612, 0.3524, 0.0000), (27, 0, 0, 0, 0, 0, 65, 0, 2439, 669, 1730, 40, 54, 0, 7, 126, 42, 0, 5190, 0, 0.9836, 4.1601, 0.3333, 0.0000), (28, 0, 0, 0, 0, 0, 65, 0, 2444, 669, 1731, 44, 65, 0, 7, 122, 49, 0, 5193, 0, 0.9820, 4.1594, 0.4016, 0.0000), (29, 0, 0, 0, 0, 0, 70, 0, 2661, 713, 1895, 53, 59, 0, 5, 188, 66, 0, 5685, 0, 0.9801, 4.1288, 0.3511, 0.0000), (30, 0, 0, 0, 0, 0, 70, 0, 2605, 717, 1845, 43, 72, 0, 6, 112, 56, 0, 5535, 0, 0.9835, 4.1659, 0.5000, 0.0000), (31, 0, 0, 0, 0, 0, 70, 0, 2628, 692, 1889, 47, 50, 0, 4, 136, 51, 0, 5667, 0, 0.9821, 4.0990, 0.3750, 0.0000), (32, 0, 0, 0, 0, 0, 70, 0, 2665, 738, 1883, 44, 69, 0, 1, 141, 54, 0, 5652, 0, 0.9835, 4.1736, 0.3830, 0.0000), (33, 0, 0, 0, 0, 0, 70, 0, 2621, 704, 1876, 41, 65, 0, 4, 91, 46, 0, 5628, 0, 0.9844, 4.1258, 0.5055, 0.0000), (34, 0, 0, 0, 0, 0, 69, 0, 2589, 728, 1808, 53, 72, 0, 8, 126, 63, 0, 5424, 0, 0.9795, 4.2080, 0.5000, 0.0000), (35, 0, 0, 0, 0, 0, 70, 0, 2581, 686, 1846, 49, 71, 0, 4, 115, 55, 0, 5538, 0, 0.9810, 4.1148, 0.4783, 0.0000), (36, 0, 0, 0, 0, 0, 68, 0, 2561, 714, 1811, 36, 86, 0, 4, 85, 42, 0, 5433, 0, 0.9859, 4.1828, 0.4941, 0.0000), (37, 0, 0, 0, 0, 0, 70, 0, 2520, 621, 1855, 44, 37, 0, 7, 162, 44, 0, 5565, 0, 0.9825, 4.0043, 0.2716, 0.0000), (38, 0, 0, 0, 0, 0, 70, 0, 2550, 659, 1830, 61, 56, 0, 8, 181, 79, 0, 5490, 0, 0.9761, 4.0803, 0.4365, 0.0000), (39, 0, 0, 0, 0, 0, 70, 0, 2597, 650, 1889, 58, 44, 0, 5, 177, 73, 0, 5667, 0, 0.9777, 4.0323, 0.4124, 0.0000), (40, 0, 0, 0, 0, 0, 70, 0, 2589, 686, 1843, 60, 55, 0, 8, 179, 59, 0, 5529, 0, 0.9768, 4.1167, 0.3296, 0.0000), (41, 0, 0, 0, 0, 0, 70, 0, 2564, 633, 1895, 36, 42, 0, 8, 152, 57, 0, 5685, 0, 0.9860, 4.0021, 0.3750, 0.0000), (42, 0, 0, 0, 0, 0, 70, 0, 2643, 690, 1900, 53, 61, 0, 7, 168, 72, 0, 5700, 0, 0.9799, 4.0895, 0.4286, 0.0000), (43, 0, 0, 0, 0, 0, 70, 0, 2564, 618, 1919, 27, 55, 0, 3, 126, 56, 0, 5757, 0, 0.9895, 3.9661, 0.4444, 0.0000), (44, 0, 0, 0, 0, 0, 70, 0, 2587, 681, 1869, 37, 64, 0, 4, 180, 74, 0, 5607, 0, 0.9857, 4.0931, 0.4111, 0.0000), (45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (53, 0, 0, 0, 0, 0, 50, 0, 1826, 464, 1322, 40, 57, 0, 4, 98, 44, 0, 3972, 0, 0.9781, 4.0468, 0.4490, 0.0000), (54, 0, 0, 0, 0, 0, 50, 0, 1821, 433, 1341, 47, 32, 0, 2, 108, 36, 0, 4029, 0, 0.9742, 3.9628, 0.3333, 0.0000), (55, 0, 0, 0, 0, 0, 50, 0, 1872, 462, 1366, 44, 35, 0, 5, 108, 48, 0, 4113, 0, 0.9765, 4.0000, 0.4444, 0.0000), (56, 0, 0, 0, 0, 0, 50, 0, 1840, 458, 1320, 62, 43, 0, 5, 111, 52, 0, 3972, 0, 0.9663, 4.0287, 0.4685, 0.0000), (57, 0, 0, 0, 0, 0, 50, 0, 1831, 452, 1347, 32, 40, 0, 7, 72, 37, 0, 4041, 0, 0.9825, 4.0067, 0.5139, 0.0000), (58, 0, 0, 0, 0, 0, 50, 0, 1819, 424, 1364, 31, 44, 0, 4, 62, 30, 0, 4104, 0, 0.9830, 3.9211, 0.4839, 0.0000), (59, 0, 0, 0, 0, 0, 50, 0, 1932, 520, 1365, 47, 53, 0, 0, 102, 45, 0, 4098, 0, 0.9757, 4.1398, 0.4412, 0.0000), (60, 0, 0, 0, 0, 0, 50, 0, 1844, 448, 1345, 51, 41, 0, 4, 91, 50, 0, 4044, 0, 0.9723, 3.9904, 0.5495, 0.0000), (61, 0, 0, 0, 0, 0, 40, 0, 1482, 366, 1061, 55, 34, 0, 2, 74, 29, 0, 3198, 0, 0.9629, 4.0159, 0.3919, 0.0000), (62, 0, 0, 0, 0, 0, 40, 0, 1467, 346, 1068, 53, 36, 0, 5, 59, 34, 0, 3213, 0, 0.9639, 3.9608, 0.5763, 0.0000), (63, 0, 0, 0, 0, 0, 40, 0, 1489, 374, 1073, 42, 36, 0, 6, 60, 35, 0, 3219, 0, 0.9718, 4.0457, 0.5833, 0.0000), (64, 0, 0, 0, 0, 0, 40, 0, 1421, 331, 1048, 42, 39, 0, 5, 45, 24, 0, 3147, 0, 0.9704, 3.9438, 0.5333, 0.0000), (65, 0, 0, 0, 0, 0, 40, 0, 1486, 356, 1056, 74, 27, 0, 8, 66, 21, 0, 3168, 0, 0.9502, 4.0114, 0.3182, 0.0000), (66, 0, 0, 0, 0, 0, 40, 0, 1473, 353, 1065, 55, 31, 0, 5, 81, 34, 0, 3195, 0, 0.9627, 3.9944, 0.4198, 0.0000), (67, 0, 0, 0, 0, 0, 40, 0, 1458, 341, 1070, 47, 31, 0, 5, 83, 34, 0, 3222, 0, 0.9678, 3.9413, 0.4096, 0.0000), (68, 0, 0, 0, 0, 0, 40, 0, 1428, 323, 1058, 47, 41, 0, 6, 65, 31, 0, 3177, 0, 0.9671, 3.9122, 0.4769, 0.0000), (69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (77, 0, 0, 0, 0, 0, 73, 0, 2905, 903, 1957, 45, 78, 0, 8, 110, 47, 0, 5871, 0, 0.9845, 4.3843, 0.4273, 0.0000), (78, 0, 0, 0, 0, 0, 73, 0, 2861, 828, 1969, 64, 62, 0, 8, 176, 50, 0, 5907, 0, 0.9776, 4.2616, 0.2841, 0.0000), (79, 0, 0, 0, 0, 0, 64, 0, 2409, 649, 1721, 39, 85, 0, 4, 92, 33, 0, 5163, 0, 0.9838, 4.1313, 0.3587, 0.0000), (80, 0, 0, 0, 0, 0, 70, 0, 2575, 653, 1873, 49, 61, 0, 9, 140, 54, 0, 5619, 0, 0.9810, 4.0459, 0.3857, 0.0000), (81, 0, 0, 0, 0, 0, 70, 0, 2532, 620, 1859, 53, 49, 0, 8, 202, 73, 0, 5577, 0, 0.9791, 4.0005, 0.3614, 0.0000), (82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (84, 0, 0, 0, 0, 0, 65, 0, 2435, 644, 1735, 56, 61, 1, 6, 126, 23, 0, 5208, 0, 0.9770, 4.1112, 0.1825, 0.0000), (85, 0, 0, 0, 0, 0, 70, 0, 2682, 719, 1906, 57, 68, 0, 5, 153, 66, 0, 5718, 0, 0.9787, 4.1317, 0.4314, 0.0000), (86, 0, 0, 0, 0, 0, 70, 0, 2617, 698, 1862, 57, 64, 0, 5, 211, 69, 0, 5586, 0, 0.9782, 4.1246, 0.3270, 0.0000), (87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (89, 0, 0, 0, 0, 0, 73, 0, 2946, 909, 1978, 59, 74, 0, 1, 128, 52, 0, 5934, 0, 0.9800, 4.3787, 0.4062, 0.0000), (90, 0, 0, 0, 0, 0, 72, 0, 2796, 783, 1961, 52, 70, 0, 8, 130, 41, 0, 5883, 0, 0.9814, 4.1979, 0.3154, 0.0000), (91, 0, 0, 0, 0, 0, 65, 0, 2443, 628, 1763, 52, 50, 0, 4, 109, 47, 0, 5289, 0, 0.9787, 4.0686, 0.4312, 0.0000), (92, 0, 0, 0, 0, 0, 70, 0, 2648, 721, 1889, 38, 53, 0, 5, 143, 58, 0, 5667, 0, 0.9856, 4.1451, 0.4056, 0.0000), (93, 0, 0, 0, 0, 0, 70, 0, 2615, 729, 1827, 59, 51, 0, 7, 194, 78, 0, 5481, 0, 0.9774, 4.1970, 0.4021, 0.0000), (94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (96, 0, 0, 0, 0, 0, 64, 0, 2382, 658, 1690, 34, 58, 0, 1, 99, 47, 0, 5070, 0, 0.9857, 4.1680, 0.4747, 0.0000), (97, 0, 0, 0, 0, 0, 70, 0, 2554, 634, 1880, 40, 64, 0, 4, 108, 51, 0, 5640, 0, 0.9843, 4.0117, 0.4722, 0.0000), (98, 0, 0, 0, 0, 0, 70, 0, 2632, 717, 1859, 56, 71, 0, 8, 154, 53, 0, 5577, 0, 0.9787, 4.1571, 0.3442, 0.0000), (99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (103, 0, 0, 0, 0, 0, 50, 0, 1810, 439, 1336, 35, 44, 0, 6, 84, 40, 0, 4020, 0, 0.9807, 3.9739, 0.4762, 0.0000), (104, 0, 0, 0, 0, 0, 50, 0, 1795, 435, 1314, 46, 43, 0, 6, 117, 58, 0, 3951, 0, 0.9744, 3.9841, 0.4957, 0.0000), (105, 0, 0, 0, 0, 0, 50, 0, 1810, 440, 1320, 50, 38, 0, 7, 97, 53, 0, 3963, 0, 0.9724, 3.9970, 0.5464, 0.0000), (106, 0, 0, 0, 0, 0, 50, 0, 1830, 438, 1350, 42, 41, 0, 1, 78, 38, 0, 4059, 0, 0.9770, 3.9645, 0.4872, 0.0000), (107, 0, 0, 0, 0, 0, 50, 0, 1809, 433, 1333, 43, 48, 0, 4, 64, 26, 0, 4002, 0, 0.9762, 3.9715, 0.4062, 0.0000), (108, 0, 0, 0, 0, 0, 50, 0, 1783, 425, 1319, 39, 33, 0, 8, 75, 39, 0, 3960, 0, 0.9781, 3.9636, 0.5200, 0.0000), (109, 0, 0, 0, 0, 0, 50, 0, 1812, 426, 1346, 40, 33, 0, 0, 69, 41, 0, 4041, 0, 0.9779, 3.9465, 0.5942, 0.0000), (110, 0, 0, 0, 0, 0, 50, 0, 1771, 411, 1327, 33, 31, 0, 6, 84, 35, 0, 3990, 0, 0.9814, 3.9203, 0.4167, 0.0000), (111, 0, 0, 0, 0, 0, 40, 0, 1466, 359, 1047, 60, 30, 0, 4, 82, 34, 0, 3147, 0, 0.9591, 4.0210, 0.4146, 0.0000), (112, 0, 0, 0, 0, 0, 40, 0, 1470, 358, 1059, 53, 29, 0, 2, 84, 39, 0, 3186, 0, 0.9639, 4.0028, 0.4643, 0.0000), (113, 0, 0, 0, 0, 0, 40, 0, 1494, 370, 1059, 65, 28, 0, 8, 100, 36, 0, 3177, 0, 0.9565, 4.0482, 0.3600, 0.0000), (114, 0, 0, 0, 0, 0, 40, 0, 1447, 327, 1049, 71, 26, 0, 9, 73, 26, 0, 3153, 0, 0.9509, 3.9277, 0.3562, 0.0000), (115, 0, 0, 0, 0, 0, 40, 0, 1461, 354, 1052, 55, 30, 0, 0, 81, 34, 0, 3162, 0, 0.9624, 4.0019, 0.4198, 0.0000), (116, 0, 0, 0, 0, 0, 40, 0, 1445, 327, 1062, 56, 20, 0, 3, 95, 39, 0, 3189, 0, 0.9612, 3.9200, 0.4105, 0.0000), (117, 0, 0, 0, 0, 0, 40, 0, 1469, 370, 1049, 50, 20, 0, 5, 69, 29, 0, 3156, 0, 0.9660, 4.0466, 0.4203, 0.0000), (118, 0, 0, 0, 0, 0, 40, 0, 1482, 370, 1064, 48, 26, 0, 2, 82, 38, 0, 3198, 0, 0.9676, 4.0356, 0.4634, 0.0000), (119, 0, 0, 0, 0, 0, 50, 0, 1837, 449, 1335, 53, 42, 0, 4, 91, 42, 0, 4017, 0, 0.9711, 3.9970, 0.4615, 0.0000), (120, 0, 0, 0, 0, 0, 50, 0, 1833, 458, 1331, 44, 39, 0, 4, 102, 52, 0, 4002, 0, 0.9760, 4.0232, 0.5098, 0.0000), (121, 0, 0, 0, 0, 0, 51, 0, 1913, 473, 1397, 43, 49, 0, 2, 108, 55, 0, 4191, 0, 0.9775, 4.0157, 0.5093, 0.0000), (122, 0, 0, 0, 0, 0, 50, 0, 1868, 457, 1342, 69, 37, 0, 4, 93, 40, 0, 4032, 0, 0.9631, 4.0156, 0.4301, 0.0000), (123, 0, 0, 0, 0, 0, 40, 0, 1456, 346, 1051, 59, 24, 0, 4, 70, 34, 0, 3159, 0, 0.9595, 3.9801, 0.4857, 0.0000), (124, 0, 0, 0, 0, 0, 40, 0, 1489, 382, 1057, 50, 40, 0, 3, 77, 35, 0, 3174, 0, 0.9664, 4.0803, 0.4545, 0.0000), (125, 0, 0, 0, 0, 0, 40, 0, 1494, 350, 1078, 66, 32, 0, 3, 87, 32, 0, 3243, 0, 0.9558, 3.9630, 0.3678, 0.0000), (126, 0, 0, 0, 0, 0, 40, 0, 1490, 361, 1068, 61, 32, 0, 4, 78, 36, 0, 3213, 0, 0.9591, 4.0028, 0.4615, 0.0000), (127, 0, 0, 0, 0, 0, 73, 0, 2889, 901, 1958, 30, 55, 0, 7, 102, 37, 0, 5874, 0, 0.9896, 4.3805, 0.3627, 0.0000), (128, 0, 0, 0, 0, 0, 73, 0, 2873, 859, 1966, 48, 78, 1, 5, 137, 63, 0, 5898, 0, 0.9833, 4.3108, 0.4599, 0.0000), (129, 0, 0, 0, 0, 0, 65, 0, 2551, 755, 1765, 31, 73, 0, 6, 104, 34, 0, 5295, 0, 0.9878, 4.2833, 0.3269, 0.0000), (130, 0, 0, 0, 0, 0, 68, 0, 2635, 721, 1874, 40, 59, 0, 4, 134, 63, 0, 5622, 0, 0.9848, 4.1542, 0.4701, 0.0000), (131, 0, 0, 0, 0, 0, 70, 0, 2579, 671, 1855, 53, 53, 0, 2, 146, 58, 0, 5565, 0, 0.9794, 4.0852, 0.3973, 0.0000), (132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (134, 0, 0, 0, 0, 0, 65, 0, 2574, 767, 1771, 36, 69, 0, 3, 87, 40, 0, 5313, 0, 0.9860, 4.2993, 0.4598, 0.0000), (135, 0, 0, 0, 0, 0, 69, 0, 2587, 635, 1916, 36, 51, 0, 7, 123, 54, 0, 5748, 0, 0.9861, 3.9943, 0.4390, 0.0000), (136, 0, 0, 0, 0, 0, 70, 0, 2597, 671, 1878, 48, 49, 0, 8, 190, 80, 0, 5634, 0, 0.9815, 4.0719, 0.4211, 0.0000), (137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (139, 0, 0, 0, 0, 0, 50, 0, 1953, 467, 1430, 56, 35, 0, 1, 97, 46, 0, 4305, 0, 0.9713, 3.9659, 0.4742, 0.0000), (140, 0, 0, 0, 0, 0, 50, 0, 1884, 445, 1407, 32, 37, 0, 5, 76, 46, 0, 4230, 0, 0.9830, 3.9404, 0.6053, 0.0000), (141, 0, 0, 0, 0, 0, 50, 0, 1784, 416, 1319, 49, 38, 0, 4, 88, 36, 0, 3957, 0, 0.9725, 3.9462, 0.4091, 0.0000), (142, 0, 0, 0, 0, 0, 51, 0, 1861, 467, 1341, 53, 44, 0, 3, 100, 56, 0, 4026, 0, 0.9715, 4.0417, 0.5600, 0.0000), (143, 0, 0, 0, 0, 0, 40, 0, 1510, 374, 1071, 65, 38, 0, 4, 67, 28, 0, 3222, 0, 0.9570, 4.0363, 0.4179, 0.0000), (144, 0, 0, 0, 0, 0, 40, 0, 1461, 343, 1064, 54, 31, 0, 13, 67, 19, 0, 3195, 0, 0.9630, 3.9634, 0.2836, 0.0000), (145, 0, 0, 0, 0, 0, 40, 0, 1522, 386, 1065, 71, 36, 0, 7, 82, 35, 0, 3195, 0, 0.9534, 4.0873, 0.4268, 0.0000), (146, 0, 0, 0, 0, 0, 40, 0, 1484, 369, 1049, 66, 29, 0, 4, 124, 65, 0, 3159, 0, 0.9555, 4.0399, 0.5242, 0.0000), (147, 0, 0, 0, 0, 0, 73, 0, 2891, 905, 1936, 50, 73, 1, 6, 106, 37, 0, 5808, 0, 0.9827, 4.4024, 0.3491, 0.0000), (148, 0, 0, 0, 0, 0, 72, 0, 2882, 857, 1978, 47, 66, 0, 6, 117, 48, 0, 5934, 0, 0.9837, 4.2998, 0.4103, 0.0000), (149, 0, 0, 0, 0, 0, 64, 0, 2399, 640, 1728, 31, 59, 0, 3, 89, 33, 0, 5184, 0, 0.9871, 4.1111, 0.3708, 0.0000), (150, 0, 0, 0, 0, 0, 70, 0, 2587, 678, 1860, 49, 58, 0, 9, 163, 62, 0, 5580, 0, 0.9811, 4.0935, 0.3804, 0.0000), (151, 0, 0, 0, 0, 0, 70, 0, 2544, 665, 1839, 40, 41, 0, 7, 167, 59, 0, 5517, 0, 0.9843, 4.0848, 0.3533, 0.0000), (152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (154, 0, 0, 0, 0, 0, 65, 0, 2497, 738, 1720, 39, 80, 0, 4, 85, 42, 0, 5160, 0, 0.9844, 4.2872, 0.4941, 0.0000), (155, 0, 0, 0, 0, 0, 70, 0, 2606, 680, 1883, 43, 57, 0, 1, 166, 77, 0, 5649, 0, 0.9835, 4.0834, 0.4639, 0.0000), (156, 0, 0, 0, 0, 0, 70, 0, 2562, 656, 1860, 46, 57, 0, 6, 118, 48, 0, 5580, 0, 0.9820, 4.0581, 0.4068, 0.0000), (157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000), (158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 0.0000);

# 
# Dump completed
