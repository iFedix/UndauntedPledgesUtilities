----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities data file  	   				    																--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
local UPU = UndauntedPledgesUtilities

ESO_Dialogs["UPU_TELEPORT"] = {
	title ={
		text = GetString(UPU_TELEPORT_TO), -- "Teleport to <<1>>",
	},
	mainText ={
		text = GetString(UPU_TELEPORT_ALERT), -- "Your group is not in veteran mode!",
	},
	buttons ={
		[1] ={
			text =      GetString(UPU_TELEPORT_ANYWAY), --"Teleport anyway",
			callback =  function(dialog)
				--Debug(dialog.data[1],"FastTravelToNode")
				FastTravelToNode(dialog.data[1])
				CHAT_SYSTEM["containers"][1]["currentBuffer"]:AddMessage("|cFFFFFF"..GetString(UPU_TELEPORTING_TO)..dialog.data[2]..GetString(UPU_HAS_COST_YOU).."|r|ccc0a00"..GetRecallCost(194).."|r|cFFFFFF "..GetString(UPU_GOLD).."|r")
			end,
		},
		[2] ={
			text =      SI_DIALOG_DECLINE,
		}
	}
}

local commonAchievements = {709, 753, 754, 710, 711, 749, 750, 751, 752, 691}

local pledgesData = {
	['Maj'] =
	{
		[0] = {
			ZoneID = 283, -- "Fungal Grotto I"
			Acronym = "fg1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {294},
					Composed = {
						[1073] = {294} --Vanquisher of the Pact
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1559, 1556, 1558, 1557, 1560, 1561},
					Composed = {}
				},
			},
			QuestID = 3993,
			NodeID = 98,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94741,
				[ARMORTYPE_MEDIUM] = 95013,
				[ARMORTYPE_HEAVY] = 94469
			},
		},
		[1] = {
			ZoneID = 935, -- "The Banished Cells II"
			Acronym = "bc2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1555},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {545, 852, 853, 451, 449, 1564},
					Composed = {
						[1071] = {449}, --Banished Cells II Assassin
						[1072] = {451} --Cursed Hero
					}
				},
			},
			QuestID = 4597,
			NodeID = 262,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59685,
				[ARMORTYPE_MEDIUM] = 59679,
				[ARMORTYPE_HEAVY] = 59673
			},
		},
		[2] = {
			ZoneID = 63, -- "Darkshade Caverns I"
			Acronym = "dc1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {78},
					Composed = {
						[1073] = {78} --Vanquisher of the Pact
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1581, 1582, 1583, 1584, 1585, 1586},
					Composed = {}
				},
			},
			QuestID = 4145,
			NodeID = 198,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94757,
				[ARMORTYPE_MEDIUM] = 95029,
				[ARMORTYPE_HEAVY] = 94485
			},
		},
		[3] = {
			ZoneID = 931, -- "Elden Hollow II"
			Acronym = "eh2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1579},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {858, 859, 461, 463, 459, 1580},
					Composed = {
						[1071] = {461}, --Elden Hollow 2 Assassin
						[1072] = {463} --Closing the Book
					}
				},
			},
			QuestID = 4675,
			NodeID = 265,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59577,
				[ARMORTYPE_MEDIUM] = 59571,
				[ARMORTYPE_HEAVY] = 59565
			},
		},
		[4] = {
			ZoneID = 146, -- "Wayrest Sewers I"
			Acronym = "ws1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {79},
					Composed = {
						[1074] = {79} --Vanquisher of the Covenant
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1589, 1590, 1591, 1592, 1593, 1594},
					Composed = {}
				},
			},
			QuestID = 4246,
			NodeID = 189,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94773,
				[ARMORTYPE_MEDIUM] = 95045,
				[ARMORTYPE_HEAVY] = 94501
			},
		},
		[5] = {
			ZoneID = 936, -- "Spindleclutch II"
			Acronym = "s2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1571},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] =
				{
					Single = {854, 855, 448, 446, 421, 1572},
					Composed = {
						[1071] = {446}, --Spindleclutch II Assassin
						[1072] = {448} --Compassionate Hero
					}
				},
			},
			QuestID = 4555,
			NodeID = 267,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59433,
				[ARMORTYPE_MEDIUM] = 59427,
				[ARMORTYPE_HEAVY] = 59421
			},
		},
		[6] = {
			ZoneID = 380, -- "Banished Cells I"
			Acronym = "bc1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {325},
					Composed = {
						[1075] = {325} --Vanquisher of the Dominion
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1549, 1550, 1551, 1552, 1553, 1554},
					Composed = {}
				},
			},
			QuestID = 4107,
			NodeID = 194,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94733,
				[ARMORTYPE_MEDIUM] = 95005,
				[ARMORTYPE_HEAVY] = 94461
			},
		},
		[7] = {
			ZoneID = 934, -- "Fungal Grotto II"
			Acronym = "fg2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {294},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] =
				{
					Single = {850, 851, 343, 342, 340, 1563},
					Composed = {
						[1071] = {340}, --Fungal Grotto II Assassin
						[1072] = {342} --Fearless Assaulter
					}
				},
			},
			QuestID = 4303,
			NodeID = 98,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59397,
				[ARMORTYPE_MEDIUM] = 59391,
				[ARMORTYPE_HEAVY] = 59385
			},
		},
		[8] = {
			ZoneID = 144, -- "Spindleclutch I"
			Acronym = "s1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {301},
					Composed = {
						[1074] = {301} --Vanquisher of the Covenant
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1565, 1566, 1567, 1568, 1569, 1570},
					Composed = {}
				},
			},
			QuestID = 4054,
			NodeID = 193,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94749,
				[ARMORTYPE_MEDIUM] = 95021,
				[ARMORTYPE_HEAVY] = 94477
			},
		},
		[9] = {
			ZoneID = 930, -- "Darkshade Caverns II"
			Acronym = "dc2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1587},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {857, 856, 465, 467, 464, 1588},
					Composed = {
						[1071] = {465}, --Darkshade Caverns II Assassin
						[1072] = {467} --Deadly Engineer
					}
				},
			},
			QuestID = 4641,
			NodeID = 264,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59541,
				[ARMORTYPE_MEDIUM] = 59535,
				[ARMORTYPE_HEAVY] = 59529
			},
		},
		[10] = {
			ZoneID = 126, -- "Elden Hollow I"
			Acronym = "eh1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {11},
					Composed = {
						[1075] = {11} --Vanquisher of the Dominion
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1573, 1574, 1575, 1576, 1577, 1578},
					Composed = {}
				},
			},
			QuestID = 4336,
			NodeID = 191,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94765,
				[ARMORTYPE_MEDIUM] = 95037,
				[ARMORTYPE_HEAVY] = 94493
			},
		},
		[11] = {
			ZoneID =  933, -- "Wayrest Sewers II"
			Acronym = "ws2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1595},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {860, 861, 679, 681, 678, 1596},
					Composed = {
						[1071] = {679}, --Wayrest Sewers II Assassin
						[1072] = {681}  --Pellingare Ghoul Slayer
					}
				},
			},
			QuestID = 4813,
			NodeID = 263,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59505,
				[ARMORTYPE_MEDIUM] = 59499,
				[ARMORTYPE_HEAVY] = 59493
			},
		},

	},
	['Glirion'] = {
		[0] = {
			ZoneID = 31, -- "Selene's Web"
			Acronym = "sw",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {417},
					Composed = {
						[1075] = {417} --Vanquisher of the Dominion
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1635, 1636, 1637, 1638, 1639, 1640},
					Composed = {}
				},
			},
			QuestID = 4733,
			NodeID = 185,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94845,
				[ARMORTYPE_MEDIUM] = 95117,
				[ARMORTYPE_HEAVY] = 94573
			},
		},
		[1] = {
			ZoneID = 681, -- "City of Ash II"
			Acronym = "coa2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1603, 1111, 1082},
					Composed = {
						[1159] = {1111, 1082}
					}
				}, --DOMINION
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {878, 1114, 1108, 1107, 1105, 1106},
					Composed = {
						[1072] = {1114} --The Blade's Edge
					}
				},
			},
			QuestID = 5120,
			NodeID = 268,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59649,
				[ARMORTYPE_MEDIUM] = 59643,
				[ARMORTYPE_HEAVY] = 59637
			},
		},
		[2] = {
			ZoneID = 130, -- "Crypt Of Hearts I"
			Acronym = "coh1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {80},
					Composed = {
						[1074] = {80} --Vanquisher of the Covenant
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1614, 1613, 1610, 1612, 1611, 1615},
					Composed = {}
				},
			},
			QuestID = 4379,
			NodeID = 190,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94797,
				[ARMORTYPE_MEDIUM] = 95069,
				[ARMORTYPE_HEAVY] = 94525},
		},
		[3] = {
			ZoneID = 22, -- "Volenfell"
			Acronym = "v",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {391},
					Composed = {
						[1074] = {391}
					}
				}, --Vanquisher of the Covenant
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1629, 1630, 1631, 1632, 1633, 1634},
					Composed = {}
				},
			},
			QuestID = 4432,
			NodeID = 196,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94821,
				[ARMORTYPE_MEDIUM] = 95093,
				[ARMORTYPE_HEAVY] = 94549
			},
		},
		[4] = {
			ZoneID = 64, -- "Blessed Crucible"
			Acronym = "bc",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {393},
					Composed = {
						[1073] = {393} --Vanquisher of the Pact
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1641, 1642, 1643, 1644, 1645, 1646},
					Composed = {}
				},
			},
			QuestID = 4469,
			NodeID = 187,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94837,
				[ARMORTYPE_MEDIUM] = 95109,
				[ARMORTYPE_HEAVY] = 94565
			},
		},
		[5] = {
			ZoneID = 449, -- "Direfrost Keep"
			Acronym = "dk",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {357},
					Composed = {
						[1073] = {357} --Vanquisher of the Pact
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1623, 1624, 1625, 1626, 1627, 1628},
					Composed = {}
				},
			},
			QuestID = 4346,
			NodeID = 195,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94805,
				[ARMORTYPE_MEDIUM] = 95077,
				[ARMORTYPE_HEAVY] = 94533
			},
		},
		[6] = {
			ZoneID = 11, -- "Vaults of Madness"
			Acronym = "vom",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {570},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1653, 1654, 1655, 1656, 1657, 1658},
					Composed = {}
				},
			},
			QuestID = 4822,
			NodeID = 184,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94853,
				[ARMORTYPE_MEDIUM] = 95125,
				[ARMORTYPE_HEAVY] = 94581},
		},
		[7] = {
			ZoneID = 932, -- "Crypt of Hearts II"
			Acronym = "coh2",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1616},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1084, 939, 940, 941, 942, 876},
					Composed = {
						[1071] = {941}, --Crypt of Hearts II Assassin
						[1072] = {942} --Deadly Crypt Survivor (Crypt of Hearts II)
					}
				},
			},
			QuestID = 5113,
			NodeID = 269,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59613,
				[ARMORTYPE_MEDIUM] = 59607,
				[ARMORTYPE_HEAVY] = 59601
			},
		},
		[8] = {
			ZoneID = 176, -- "City of Ash I"
			Acronym = "coa1",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {551},
					Composed = {
						[1075] = {551} --Vanquisher of the Dominion
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1597, 1598, 1599, 1600, 1601, 1602},
					Composed = {}
				},
			},
			QuestID = 4778,
			NodeID = 197,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94789,
				[ARMORTYPE_MEDIUM] = 95061,
				[ARMORTYPE_HEAVY] = 94517
			},
		},
		[9] = {
			ZoneID = 131, -- "Tempest Island"
			Acronym = "ti",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {81},
					Composed = {
						[1075] = {81}
					} --Vanquisher of the Dominion
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1617, 1618, 1619, 1620, 1621, 1622},
					Composed = {}
				},
			},
			QuestID = 4538,
			NodeID = 188,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94813,
				[ARMORTYPE_MEDIUM] = 95085,
				[ARMORTYPE_HEAVY] = 94541
			},
		},
		[10] = {
			ZoneID = 38, -- "Blackheart Haven"
			Acronym = "bh",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {410},
					Composed = {
						[1074] = {410} --Vanquisher of the Covenant
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1647, 1648, 1649, 1650, 1651, 1652},
					Composed = {}
				},
			},
			QuestID = 4589,
			NodeID = 186,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94829,
				[ARMORTYPE_MEDIUM] = 95101,
				[ARMORTYPE_HEAVY] = 94557
			},
		},
		[11] = {
			ZoneID = 148, -- "Arx Corinium"
			Acronym = "ac",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {272},
					Composed = {
						[1073] = {272} --Vanquisher of the Pact
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1604, 1605, 1606, 1607, 1608, 1609},
					Composed = {}
				},
			},
			QuestID = 4202,
			NodeID = 192,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 94781,
				[ARMORTYPE_MEDIUM] = 95053,
				[ARMORTYPE_HEAVY] = 94509
			},
		},
	},
	['Urgarlag'] =
	{
		[8] = {
			ZoneID = 678, -- "Imperial City Prison" 08/16/2017
			Acronym = "icp",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1122, 1345},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {880, 1129, 1303, 1131, 1130, 1128, 1133, 1142},
					Composed = {
						[1132] = {1128, 1129, 1303}
					}
				},
			},
			QuestID = 5136,
			NodeID = 236,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 59469,
				[ARMORTYPE_MEDIUM] = 59463,
				[ARMORTYPE_HEAVY] = 59457},
		},
		[9] = {
			ZoneID = 843, -- "Ruins of Mazzatun"
			Acronym = "rom",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1520, 1504, 1512, 1514},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1511, 1505, 1506, 1507, 1508, 1509, 1510, 1513, 1515, 1516, 1517, 1518, 1519},
					Composed = {
						[1538] = {1505,1523}
					}
				},
			},
			QuestID = 5403,
			NodeID = 260,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 82180,
				[ARMORTYPE_MEDIUM] = 82178,
				[ARMORTYPE_HEAVY] = 82176
			},
		},
		[10] = {
			ZoneID = 688, -- "White-Gold Tower"
			Acronym = "wgt",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1281, 1346},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1278, 1277, 1280, 1275, 1279, 1306, 1276, 1120},
					Composed = {
						[1132] = {1275, 1276, 1279}
					}
				},
			},
			QuestID = 5342,
			NodeID = 247,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 68124,
				[ARMORTYPE_MEDIUM] = 68118,
				[ARMORTYPE_HEAVY] = 68112
			},
		},
		[11] = {
			ZoneID = 848, -- "Cradle of Shadows"
			Acronym = "cos",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1520, 1522, 1536},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1529, 1523, 1524, 1525, 1526, 1527, 1528, 1530, 1531, 1532, 1533, 1534, 1535},
					Composed = {
						[1538] = {1505,1523}
					}
				},
			},
			QuestID = 5702,
			NodeID = 261,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 82132,
				[ARMORTYPE_MEDIUM] = 82130,
				[ARMORTYPE_HEAVY] = 82128
			},
		},
		[12] = {
			ZoneID = 973, -- "Bloodroot Forge" 08/14/2017
			Acronym = "bf",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1940, 1690, 1697},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1941, 1691, 1696, 1694, 1695, 1692, 1693, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823},
					Composed = {
						[1937] = {1691,1699}
					}
				},
			},
			QuestID = 5889,
			NodeID = 326,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 127722,
				[ARMORTYPE_MEDIUM] = 127738,
				[ARMORTYPE_HEAVY] = 127706
			},
		},
		[13] = {
			ZoneID = 974, -- "Falkreath Hold" 08/15/2017
			Acronym = "fh",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1940, 1698, 1705, 1945, 1949},
					Composed = {}},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1942, 1704, 1702, 1703, 1700, 1701, 1946, 1947, 1948, 1950, 1951},
					Composed = {
						[1937] = {1691,1699}
					}
				},
			},
			QuestID = 5891,
			NodeID = 332,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 128325,
				[ARMORTYPE_MEDIUM] = 128341,
				[ARMORTYPE_HEAVY] = 128309
			},
		},
		[14] = {
			ZoneID = 1009, -- "Fang Lair" 12/02/2018
			Acronym = "fl",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {1959, 2104, 1974},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2102, 1966, 1960, 1965, 1963, 1964, 1961, 1962, 1967, 1968, 1969, 1970, 1971, 1972, 1973},
					Composed = {
						[2103] = {1960, 1976}
					}
				},
			},
			QuestID = 6064,
			NodeID = 341,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 129499,
				[ARMORTYPE_MEDIUM] = 129515,
				[ARMORTYPE_HEAVY] = 129483
			},
		},
		[15] = {
			ZoneID = 1010, -- "Scalecaller Peak" 13/02/2018
			Acronym = "sp",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2104, 1975, 1985, 1990},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {1983, 1982, 1976, 1979, 1981, 1980, 1984, 1977, 1978, 1986, 1987, 1988, 1989, 1991},
					Composed = {
						[2103] = {1960, 1976}
					}
				},
			},
			QuestID = 6065,
			NodeID = 363,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 129547,
				[ARMORTYPE_MEDIUM] = 129563,
				[ARMORTYPE_HEAVY] = 129531
			},
		},
		[16] = {
			ZoneID = 1052, -- "Moon Hunter Keep" 08/13/2018
			Acronym = "mhk",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2157, 2152, 2298, 2299, 2307},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2308, 2309, 2159, 2158, 2156, 2297, 2153, 2154, 2300, 2155, 2301, 2151, 2150},
					Composed = {
						[2170] = {2163, 2153}
					}
				},
			},
			QuestID = 6186,
			NodeID = 371,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 141678,
				[ARMORTYPE_MEDIUM] = 141680,
				[ARMORTYPE_HEAVY] = 141676
			},
		},
		[17] = {
			ZoneID = 1055, -- "March of Sacrifices" 08/14/2018
			Acronym = "mos",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2157, 2162, 2302},
					Composed = {}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2167, 2165, 2303, 2168, 2304, 2163, 2305, 2164, 2306, 2166, 2160, 2161, 2310, 2311, 2312},
					Composed = {
						[2170] = {2163, 2153}
					}
				},
			},
			QuestID = 6188,
			NodeID = 370,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 141630,
				[ARMORTYPE_MEDIUM] = 141632,
				[ARMORTYPE_HEAVY] = 141628
			},
		},
		[18] = {
			ZoneID = 1081, -- "Depths of Malatar" 02/25/2019
			Acronym = "dom",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2265, 2270, 2391, 2392},
					Composed = {
						[2471] = {2270, 2260}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2389, 2275, 2276, 2272, 2273, 2274, 2268, 2269, 2388, 2390, 2393, 2394, 2395},
					Composed = {
						[2277] = {2271, 2261}
					}
				},
			},
			QuestID = 6251,
			NodeID = 390,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 147243,
				[ARMORTYPE_MEDIUM] = 147245,
				[ARMORTYPE_HEAVY] = 147241
			},
		},
		[19] = {
			ZoneID = 1080, -- "Frostvault" 02/25/2019
			Acronym = "fv",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2265, 2260, 2380, 2381, 2382, 2383, 2385, 2387},
					Composed = {
						[2471] = {2270, 2260}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2266, 2261, 2267, 2262, 2263, 2264, 2259, 2258, 2384, 2386},
					Composed = {
						[2277] = {2271, 2261}
					}
				},
			},
			QuestID = 6249,
			NodeID = 389,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 146640,
				[ARMORTYPE_MEDIUM] = 146642,
				[ARMORTYPE_HEAVY] = 146638
			},
		},
		[20] = {
			ZoneID = 1122, -- "Moongrave Fane" 08/12/2019
			Acronym = "mf",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2415, 2570, 2420, 2577, 2578},
					Composed = {
						[2590] = {2415, 2425}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2416, 2572, 2421, 2422, 2571, 2417, 2418, 2419, 2413, 2414, 2573, 2574, 2575, 2569},
					Composed = {
						[2432] = {2426, 2416}
					}
				},
			},
			QuestID = 6349,
			NodeID = 391,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 152268,
				[ARMORTYPE_MEDIUM] = 152270,
				[ARMORTYPE_HEAVY] = 152266
			},
		},
		[21] = {
			ZoneID = 1123, -- "Lair of Maarselok" 08/12/2019
			Acronym = "lom",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2425, 2420, 2580, 2576},
					Composed = {
						[2590] = {2415, 2425}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2426, 2430, 2431, 2427, 2428, 2429, 2423, 2424, 2579, 2581, 2582, 2583, 2584},
					Composed = {
						[2432] = {2426, 2416}
					}
				},
			},
			QuestID = 6351,
			NodeID = 398,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 152316,
				[ARMORTYPE_MEDIUM] = 152318,
				[ARMORTYPE_HEAVY] = 152314
			},
		},
		[22] = {
			ZoneID = 1152, -- "Icereach" 02/24/2020
			Acronym = "ir",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2544, 2539, 2676, 2671},
					Composed = {
						[2660] = {2549, 2539}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2545, 2546, 2541, 2542, 2543, 2537, 2538, 2670, 2672, 2673, 2674, 2675, 2677},
					Composed = {
						[2556] = {2550, 2540}
					}
				},
			},
			QuestID = 6414,
			NodeID = 424,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 158177,
				[ARMORTYPE_MEDIUM] = 158171,
				[ARMORTYPE_HEAVY] = 158165
			},
		},
		[23] = {
			ZoneID = 1153, -- "Unhallowed Grave" 02/24/2020
			Acronym = "ug",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2544, 2549, 2678, 2680, 2681, 2682, 2685},
					Composed = {
						[2660] = {2549, 2539}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2554, 2555, 2551, 2552, 2553, 2547, 2548, 2679, 2683, 2684},
					Composed = {
						[2556] = {2550, 2540}
					}
				},
			},
			QuestID = 6416,
			NodeID = 425,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 158239,
				[ARMORTYPE_MEDIUM] = 158233,
				[ARMORTYPE_HEAVY] = 158227
			},
		},
		[24] = {
			ZoneID = 1197, -- "Stone Garden" 08/24/2020
			Acronym = "sg",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2699, 2694, 2825, 2810, 2826},
					Composed = {
						[2862] = {2704, 2694}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2697, 2753, 2698, 2754, 2700, 2695, 2693, 2692, 2755, 2701, 2823, 2824, 2809, 2808},
					Composed = {
						[2711] = {2705,2695}
					}
				},
			},
			QuestID = 6505,
			NodeID = 435,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 167052,
				[ARMORTYPE_MEDIUM] = 167046,
				[ARMORTYPE_HEAVY] = 167040
			},
		},
		[25] = {
			ZoneID = 1201, -- "Castle Thorn" 08/24/2020
			Acronym = "ct",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2699, 2704, 2814},
					Composed = {
						[2862] = {2704, 2694}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2702, 2710, 2709, 2705, 2707, 2708, 2703, 2706, 2813, 2828, 2811, 2815, 2827},
					Composed = {
						[2711] = {2705,2695}
					}
				},
			},
			QuestID = 6507,
			NodeID = 436,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 167128,
				[ARMORTYPE_MEDIUM] = 167122,
				[ARMORTYPE_HEAVY] = 167116
			},
		},
		[26] = {
			ZoneID = 1228, -- "Black Drake Villa" 03/08/2021
			Acronym = "bdv",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2836, 2831, 2884},
					Composed = {
						[2864] = {2841, 2831}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2837, 2832, 2833, 2835, 2834, 2838, 2830, 2829, 2881, 2880, 2879, 2882, 2883},
					Composed = {
						[2848] = {2842, 2832}
					}
				},
			},
			QuestID = 6576,
			NodeID = 437,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 171619,
				[ARMORTYPE_MEDIUM] = 171613,
				[ARMORTYPE_HEAVY] = 171607
			},
		},
		[27] = {
			ZoneID = 1229, -- "The Cauldron" 03/08/2021
			Acronym = "tc",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {2836, 2841, 2889},
					Composed = {
						[2864] = {2841, 2831}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {2846, 2842, 2843, 2845, 2844, 2847, 2839, 2840, 2890, 2887, 2886, 2885, 2888},
					Composed = {
						[2848] = {2842, 2832}
					}
				},
			},
			QuestID = 6578,
			NodeID = 454,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 171675,
				[ARMORTYPE_MEDIUM] = 171669,
				[ARMORTYPE_HEAVY] = 171663
			},
		},
		[28] = {
			ZoneID = 1267, --- "Red Petal Bastion" 08/23/2021
			Acronym = "rpb",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3021, 3016, 3038, 3039, 3040},
					Composed = {
						[3034] = {3026, 3016},
						[3093] = {3038, 3039, 3040, 3090, 3091, 3092},
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3023, 3017, 3022, 3014, 3015, 3086, 3087, 3018, 3019, 3020, 3035, 3036, 3037},
					Composed = {
						[3033] = {3027, 3017}
					}
				},
			},
			QuestID = 6683,
			NodeID = 470,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 178588,
				[ARMORTYPE_MEDIUM] = 178582,
				[ARMORTYPE_HEAVY] = 178576
			},
		},
		[29] = {
			ZoneID = 1268, --- "The Dread Cellar" 08/23/2021
			Acronym = "tdc",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3021, 3026, 3044, 3090, 3091, 3092},
					Composed = {
						[3034] = {3026, 3016},
						[3093] = {3038, 3039, 3040, 3090, 3091, 3092},
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3027, 3031, 3024, 3025, 3088, 3089, 3028, 3029, 3030, 3032, 3041, 3042, 3043, 3045, 3046},
					Composed = {
						[3033] = {3027, 3017}
					}
				},
			},
			QuestID = 6685,
			NodeID = 469,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 178644,
				[ARMORTYPE_MEDIUM] = 178638,
				[ARMORTYPE_HEAVY] = 178632
			},
		},
		[0] = {
			ZoneID = 1301, --- "Coral Aerie" 03/14/2022
			Acronym = "ca",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3104, 3109, 3124},
					Composed = {
						[3122] = {3104, 3114},
						[3222] = {3134, 3230}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3102, 3103, 3105, 3106, 3107, 3108, 3110, 3111, 3123, 3125, 3126, 3127, 3128, 3153, 3225, 3226, 3231},
					Composed = {
						[3121] = {3115, 3105}
					}
				},
			},
			QuestID = 6740,
			NodeID = 497,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 183756,
				[ARMORTYPE_MEDIUM] = 183750,
				[ARMORTYPE_HEAVY] = 183744
			},
		},
		[1] = {
			ZoneID = 1302, --- "Shipwright's Regret" 03/14/2022
			Acronym = "sr",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3114, 3109, 3134},
					Composed = {
						[3122] = {3104, 3114},
						[3222] = {3134, 3230}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3117, 3112, 3113, 3115, 3116, 3118, 3119, 3120, 3129, 3130, 3131, 3154, 3223, 3224},
					Composed = {
						[3121] = {3115, 3105}
					}
				},
			},
			QuestID = 6742,
			NodeID = 498,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 183812,
				[ARMORTYPE_MEDIUM] = 183806,
				[ARMORTYPE_HEAVY] = 183800
			},
		},
		[2] = {
			ZoneID = 1360, --- "Earthen Root Enclave" 08/22/2022
			Acronym = "ere",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3375, 3411, 3390, 3385, 3525},
					Composed = {
						[3413] = {3394, 3375},
						[3414] = {3390, 3409}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3376, 3373, 3374, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3386, 3388, 3389, 3391},
					Composed = {
						[3412] = {3395, 3376}
					}
				},
			},
			QuestID = 6835,
			NodeID = 520,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 189368,
				[ARMORTYPE_MEDIUM] = 189362,
				[ARMORTYPE_HEAVY] = 189356
			},
		},
		[3] = {
			ZoneID = 1361, --- "Graven Deep" 08/22/2022
			Acronym = "gd",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3394, 3411, 3409, 3406, 3526, 3403},
					Composed = {
						[3413] = {3394, 3375},
						[3414] = {3390, 3409}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3395, 3392, 3393, 3396, 3397, 3398, 3399, 3400, 3401, 3404, 3405, 3407, 3408, 3410, 3425},
					Composed = {
						[3412] = {3395, 3376}
					}
				},
			},
			QuestID = 6837,
			NodeID = 521,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 189424,
				[ARMORTYPE_MEDIUM] = 189418,
				[ARMORTYPE_HEAVY] = 189412
			},
		},
		[4] = {
			ZoneID = 1389, --- "Bal Sunnar" 03/13/2023
			Acronym = "bs",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3479, 3480, 3617, 3619},
					Composed = {
						[3487] = {3529, 3468},
						[3488] = {3544, 3483}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3466, 3467, 3470, 3471, 3472, 3473, 3474, 3475, 3476, 3477, 3478, 3481, 3482, 3484},
					Composed = {
						[3486] = {3530, 3469}
					}
				},
			},
			QuestID = 6896,
			NodeID = 531,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 193136,
				[ARMORTYPE_MEDIUM] = 193130,
				[ARMORTYPE_HEAVY] = 193124
			},
		},
		[5] = {
			ZoneID = 1390, --- "Scrivener's Hall" 03/13/2023
			Acronym = "sh",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3618},
					Composed = {
						[3487] = {3529, 3468},
						[3488] = {3544, 3483}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3527, 3528, 3531, 3532, 3533, 3534, 3535, 3536, 3537, 3538, 3539, 3540, 3541, 3542, 3543, 3545},
					Composed = {
						[3486] = {3530, 3469}
					}
				},
			},
			QuestID = 7027,
			NodeID = 532,
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 193695,
				[ARMORTYPE_MEDIUM] = 193689,
				[ARMORTYPE_HEAVY] = 193683
			},
		},
		[6] = {
			ZoneID = 1471, --- "Bedlam Veil" 03/11/2024
			Acronym = "bv",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3860, 3861, 3922, 4010, 4029},
					Composed = {
						[3829] = {3851, 3810},
						[4029] = {3866, 3825}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3849, 3850, 3853, 3854, 3855, 3856, 3857, 3858, 3859, 3862, 3863, 3864, 3865, 3867},
					Composed = {
						[3828] = {3852, 3811}
					}
				},
			},
			QuestID = 7155,
			NodeID = -1, --TODO: still not available through Baertram's data (updated 04/01/2024). Once it's present in its files, launch d(UPU.UpdateAddonData(1471)) and paste here the updated nodeID
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 203051,
				[ARMORTYPE_MEDIUM] = 203045,
				[ARMORTYPE_HEAVY] = 203039
			},
		},
		[7] = {
			ZoneID = 1470, --- "Oathsworn Pit" 03/11/2024
			Acronym = "op",
			Achievements = {
				[DUNGEON_DIFFICULTY_NORMAL] = {
					Single = {3820, 3825, 3921, 4009, 4029},
					Composed = {
						[3829] = {3851, 3810},
						[4029] = {3866, 3825}
					}
				},
				[DUNGEON_DIFFICULTY_VETERAN] = {
					Single = {3808, 3809, 3812, 3813, 3814, 3815, 3816, 3817, 3818, 3819, 3821, 3822, 3823, 3824, 3826, 3828},
					Composed = {
						[3828] = {3852, 3811}
					}
				},
			},
			QuestID = 7105,
			NodeID = -1, --TODO: still not available through Baertram's data (updated 04/01/2024). Once it's present in its files, launch d(UPU.UpdateAddonData(1470)) and paste here the updated nodeID
			HelmetsItemIDS = {
				[ARMORTYPE_LIGHT] = 202492,
				[ARMORTYPE_MEDIUM] = 202486,
				[ARMORTYPE_HEAVY] = 202480
			},
		},
	}
}

------------------------------------------------------- GETTERS -------------------------------------------------------
function UPU.GetPledgesData()
	return pledgesData
end

function UPU.GetCommonAchievements()
	return commonAchievements
end
