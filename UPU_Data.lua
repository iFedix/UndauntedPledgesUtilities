
----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities data file  	   				    																--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
local UPU = UndauntedPledgesUtilities

local MAJ      = 1
local GLIRION  = 2
local URGARLAG = 3

--populate tables using custom values
do

local commonAchievements = {709, 753, 754, 710, 711, 749, 750, 751, 752, 691}

local PledgesFromMaj={
	[0] = {
		PledgeID = "UPU_PLEDGE_16", -- "Fungal Grotto I"
		Link = "|H1:item:95013:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "fg1",
		Achievements = {
			[1] = {Single = {294}, Composed = {1073}}, --PACT
			[2] = {Single = {294, 1559, 1556, 1558, 1557, 1560, 1561}, Composed = {}},
		},
	},
	[1] = {
		PledgeID =       "UPU_PLEDGE_03", -- "Banished Cells II"
		Link = "|H1:item:59673:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "bc2",
		Achievements = {
			[1] = {Single = {1555}, Composed = {1075}}, --DOMINION
			[2] = {Single = {1555, 545, 852, 853, 451, 449, 1564}, Composed = {1071, 1072}},
		},
	},
	[2] = {
		PledgeID =       "UPU_PLEDGE_11", -- "Darkshade Caverns I"
		Link = "|H1:item:94757:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "dc1",
		Achievements = {
			[1] = {Single = {78}, Composed = {1073}}, --PACT
			[2] = {Single = {78, 1581, 1582, 1583, 1584, 1585, 1586}, Composed = {}},
		},
	},
	[3] = {
		PledgeID =       "UPU_PLEDGE_15", -- "Elden Hollow II"
		Link = "|H1:item:59565:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "eh2",
		Achievements = {
			[1] = {Single = {1579}, Composed = {1075}}, --DOMINION
			[2] = {Single = {1579, 858, 859, 461, 463, 459, 1580}, Composed = {1071, 1072}},
		},
	},
	[4] = {
		PledgeID =      "UPU_PLEDGE_26", -- "Wayrest Sewers I"
		Link = "|H1:item:94500:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "ws1",
		Achievements = {
			[1] = {Single = {79}, Composed = {1074}}, --COVENANT
			[2] = {Single = {79, 1589, 1590, 1591, 1592, 1593, 1594}, Composed = {}},
		},
	},
	[5] = {
		PledgeID =      "UPU_PLEDGE_22", -- "Spindleclutch II"
		Link = "|H1:item:59427:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "s2",
		Achievements = {
			[1] = {Single = {1571}, Composed = {1074}}, --COVENANT
			[2] = {Single = {1571, 854, 855, 448, 446, 421, 1572}, Composed = {1071, 1072}},
		},		
	},
	[6] = {
		PledgeID =       "UPU_PLEDGE_02", -- "Banished Cells I"
		Link = "|H1:item:94732:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "bc1",
		Achievements = {
			[1] = {Single = {325}, Composed = {1075}}, --DOMINION
			[2] = {Single = {325, 1549, 1550, 1551, 1552, 1553, 1554}, Composed = {}},
		},
	},
	[7] = {
		PledgeID =       "UPU_PLEDGE_17", -- "Fungal Grotto II"
		Link = "|H1:item:59393:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "fg2",
		Achievements = {
			[1] = {Single = {294}, Composed = {1073}}, --PACT
			[2] = {Single = {294, 850, 851, 343, 342, 340, 1563}, Composed = {1071, 1072}},
		},
	},
	[8] = {
		PledgeID =       "UPU_PLEDGE_21", -- "Spindleclutch I"
		Link = "|H1:item:94476:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "s1",
		Achievements = {
			[1] = {Single = {301}, Composed = {1074}}, --COVENANT
			[2] = {Single = {301, 1565, 1566, 1567, 1568, 1569, 1570}, Composed = {}},
		},
	},
	[9] = {
		PledgeID =       "UPU_PLEDGE_12", -- "Darkshade Caverns II"
		Link = "|H1:item:59529:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "dc2",
		Achievements = {
			[1] = {Single = {1587}, Composed = {1073}}, --PACT
			[2] = {Single = {1587, 857, 856, 465, 467, 464, 1588}, Composed = {1071,1072}},
		},
	},
	[10] = {
		PledgeID =       "UPU_PLEDGE_14", -- "Elden Hollow I"
		Link = "|H1:item:94764:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "eh1",
		Achievements = {
			[1] = {Single = {11}, Composed = {1075}}, --DOMINION
			[2] = {Single = {11, 1573, 1574, 1575, 1576, 1577, 1578}, Composed = {}},
		},
	},
	[11] = {
		PledgeID =       "UPU_PLEDGE_27", -- "Wayrest Sewers II"
		Link = "|H1:item:59505:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "ws2",
		Achievements = {
			[1] = {Single = {1595}, Composed = {1074}}, --COVENANT
			[2] = {Single = {1595, 860, 861, 679, 681, 678, 1596}, Composed = {1071,1072}},
		},
	},
}
	
	
local PledgesFromGlirion={
	[0] = {
		PledgeID =       "UPU_PLEDGE_20", -- "Selene's Web"
		Link = "|H1:item:95116:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "sw",
		Achievements = {
			[1] = {Single = {417}, Composed = {1075}}, --DOMINION
			[2] = {Single = {417, 1635, 1636, 1637, 1638, 1639, 1640}, Composed = {}},
		},
	},
	[1] = {
		PledgeID =       "UPU_PLEDGE_07", -- "City of Ash II"
		Link = "|H1:item:59637:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "coa2",
		Achievements = {
			[1] = {Single = {1603, 1111, 1082}, Composed = {1159, 1075}}, --DOMINION
			[2] = {Single = {1603, 1111, 1082, 878, 1114, 1108, 1107, 1105, 1106}, Composed = {1159}},
		},
	},
	[2] = {
		PledgeID =       "UPU_PLEDGE_09", -- "Crypt Of Hearts I"
		Link = "|H1:item:94796:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "coh1",
		Achievements = {
			[1] = {Single = {80}, Composed = {1074}}, --COVENANT
			[2] = {Single = {80, 1614, 1613, 1610, 1612, 1611, 1615}, Composed = {}},
		},
	},
	[3] = {
		PledgeID =       "UPU_PLEDGE_25", -- "Volenfell"
		Link = "|H1:item:94548:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "v",
		Achievements = {
			[1] = {Single = {391}, Composed = {1074}}, --COVENANT
			[2] = {Single = {391, 1629, 1630, 1631, 1632, 1633, 1634}, Composed = {}},
		},
	},
	[4] = {
		PledgeID =      "UPU_PLEDGE_05", -- "Blessed Crucible"
		Link = "|H1:item:94836:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "bc",
		Achievements = {
			[1] = {Single = {393}, Composed = {1073}}, --PACT
			[2] = {Single = {393, 1641, 1642, 1643, 1644, 1645, 1646}, Composed = {}},
		},
	},
	[5] = {
		PledgeID =      "UPU_PLEDGE_13", -- "Direfrost Keep"
		Link = "|H1:item:94804:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "dk",
		Achievements = {
			[1] = {Single = {357}, Composed = {1073}}, --PACT
			[2] = {Single = {357, 1623, 1624, 1625, 1626, 1627, 1628}, Composed = {}},
		},
	},
	[6] = {
		PledgeID =       "UPU_PLEDGE_24", -- "Vaults of Madness"
		Link = "|H1:item:94852:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "vom",
		Achievements = {
			[1] = {Single = {570}, Composed = {}},
			[2] = {Single = {570, 1653, 1654, 1655, 1656, 1657, 1658}, Composed = {}},
		},
	},
	[7] = {
		PledgeID =       "UPU_PLEDGE_10", -- "Crypt of Hearts II"
		Link = "|H1:item:59601:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "coh2",
		Achievements = {
			[1] = {Single = {1616}, Composed = {1074}}, --COVENANT
			[2] = {Single = {1616, 1084, 939, 940, 941, 942, 876}, Composed = {1071,1072}},
		},
	},
	[8] = {
		PledgeID =       "UPU_PLEDGE_06", -- "City of Ash I"
		Link = "|H1:item:94788:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "coa1",
		Achievements = {
			[1] = {Single = {551}, Composed = {1075}}, --DOMINION
			[2] = {Single = {551, 1597, 1598, 1599, 1600, 1601, 1602}, Composed = {}},
		},
	},
	[9] = {
		PledgeID =       "UPU_PLEDGE_23", -- "Tempest Island"
		Link = "|H1:item:95084:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "ti",
		Achievements = {
			[1] = {Single = {81}, Composed = {1075}}, --DOMINION
			[2] = {Single = {81, 1617, 1618, 1619, 1620, 1621, 1622}, Composed = {}},
		},
	},
	[10] = {
		PledgeID =       "UPU_PLEDGE_04", -- "Blackheart Haven"
		Link = "|H1:item:94556:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "bh",
		Achievements = {
			[1] = {Single = {410}, Composed = {1074}}, --COVENANT
			[2] = {Single = {410, 1647, 1648, 1649, 1650, 1651, 1652}, Composed = {}},
		},
	},
	[11] = {
		PledgeID =       "UPU_PLEDGE_01", -- "Arx Corinium"
		Link = "|H1:item:95052:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "ac",
		Achievements = {
			[1] = {Single = {272}, Composed = {1073}}, --PACT
			[2] = {Single = {272, 1604, 1605, 1606, 1607, 1608, 1609}, Composed = {}},
		},
	},
}


local PledgesFromUrgarlag={
	[0] = {
		PledgeID =  	"UPU_PLEDGE_29", -- "Bloodroot Forge" 08/14/2017
		Link = "|H1:item:127722:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "bf",
		Achievements = {
			[1] = {Single = {1940, 1690, 1697}, Composed = {}},
			[2] = {Single = {1940, 1690, 1697, 1941, 1691, 1696, 1694, 1695, 1692, 1693, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823}, Composed = {1937}},
		},		
	},
	[1] = {
		PledgeID =  	"UPU_PLEDGE_30", -- "Falkreath Hold" 08/15/2017
		Link = "|H1:item:128309:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "fh",
		Achievements = {
			[1] = {Single = {1940, 1698, 1705, 1945, 1949}, Composed = {}},
			[2] = {Single = {1940, 1698, 1705, 1945, 1949, 1942, 1704, 1702, 1703, 1700, 1701, 1946, 1947, 1948, 1950, 1951}, Composed = {1937}},
		},	
	},
	[2] = {
		PledgeID =       "UPU_PLEDGE_31", -- "Fang Lair" 12/02/2018
		Link = "|H1:item:129484:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "fl",
		Achievements = {
			[1] = {Single = {1959, 2104, 1974}, Composed = {}},
			[2] = {Single = {1959, 2104, 1974, 2102, 1966, 1960, 1965, 1963, 1964, 1961, 1962, 1967, 1968, 1969, 1970, 1971, 1972, 1973}, Composed = {2103}},
		},	
	},
	[3] = {
		PledgeID =       "UPU_PLEDGE_32", -- "Scalecaller Peak" 13/02/2018
		Link = "|H1:item:129535:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "sp",
		Achievements = {
			[1] = {Single = {2104, 1975, 1985, 1990}, Composed = {}},
			[2] = {Single = {2104, 1975, 1985, 1990, 1983, 1982, 1976, 1979, 1981, 1980, 1984, 1977, 1978, 1986, 1987, 1988, 1989, 1991}, Composed = {2103}},
		},	
	},	
	[4] = {
		PledgeID =       "UPU_PLEDGE_33", -- "Moon Hunter Keep" 08/13/2018
		Link = "|H1:item:141698:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "mhk",
		Achievements = {
			[1] = {Single = {2157, 2152, 2298, 2299, 2307}, Composed = {}},
			[2] = {Single = {2307, 2308, 2309, 2157, 2152, 2298, 2299, 2159, 2158, 2156, 2297, 2153, 2154, 2300, 2155, 2301, 2151, 2150}, Composed = {2170}},
		},	
	},
	[5] = {
		PledgeID =       "UPU_PLEDGE_34", -- "March of Sacrifices" 08/14/2018
		Link = "|H1:item:141650:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "mos",
		Achievements = {
			[1] = {Single = {2157, 2162, 2302}, Composed = {}},
			[2] = {Single = {2157, 2162, 2302, 2167, 2165, 2303, 2168, 2304, 2163, 2305, 2164, 2306, 2166, 2160, 2161, 2310, 2311, 2312}, Composed = {2170}},
		},	
	},
	[6] = {
		PledgeID =       "UPU_PLEDGE_35", -- "Depths of Malatar" 02/25/2019
		Link = "|H1:item:147235:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "dom",
		Achievements = {
			[1] = {Single = {2265, 2270, 2389, 2391, 2392}, Composed = {2471}},
			[2] = {Single = {2265, 2270, 2389, 2391, 2392, 2275, 2276, 2272, 2273, 2274, 2268, 2269, 2388, 2390, 2393, 2394, 2395}, Composed = {2471, 2277}},
		},	
	},
	[7] = {
		PledgeID =       "UPU_PLEDGE_36", -- "Frostvault" 02/25/2019
		Link = "|H1:item:146668:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "fv",
		Achievements = {
			[1] = {Single = {2265, 2260, 2380, 2381, 2382, 2383, 2385, 2387}, Composed = {2471}},
			[2] = {Single = {2265, 2260, 2380, 2381, 2382, 2383, 2385, 2387, 2266, 2261, 2267, 2262, 2263, 2264, 2259, 2258, 2384, 2386}, Composed = {2471, 2277}},
		},	
	},
	[8] = {
		PledgeID =       "UPU_PLEDGE_18", -- "Imperial City Prison" 08/16/2017
		Link = "|H1:item:59459:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "icp",
		Achievements = {
			[1] = {Single = {1122, 1345}, Composed = {}},
			[2] = {Single = {1122, 880, 1345, 1129, 1303, 1131, 1130, 1128, 1133, 1142}, Composed = {1132}},
		},	
	},
	[9] = {
		PledgeID =       "UPU_PLEDGE_19", -- "Ruins of Mazzatun"
		Link = "|H1:item:82188:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "rom",
		Achievements = {
			[1] = {Single = {1520, 1504, 1512, 1514}, Composed = {}},
			[2] = {Single = {1520, 1504, 1512, 1514, 1511, 1505, 1506, 1507, 1508, 1509, 1510, 1513, 1515, 1516, 1517, 1518, 1519}, Composed = {1538}},
		},	
	},
	[10] = {
		PledgeID =       "UPU_PLEDGE_28", -- "White-Gold Tower"
		Link = "|H1:item:68112:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "wgt",
		Achievements = {
			[1] = {Single = {1281, 1346}, Composed = {}},
			[2] = {Single = {1278, 1277, 1280, 1275, 1281, 1279, 1306, 1276, 1120, 1346}, Composed = {1132}},
		},	
	},
	[11] = {
		PledgeID =       "UPU_PLEDGE_08", -- "Cradle of Shadows"
		Link = "|H1:item:82142:363:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:10000:0|h|h",
		Acronym = "cos",
		Achievements = {
			[1] = {Single = {1520, 1522, 1536}, Composed = {}},
			[2] = {Single = {1520, 1522, 1536, 1529, 1523, 1524, 1525, 1526, 1527, 1528, 1530, 1531, 1532, 1533, 1534, 1535}, Composed = {1538}},
		},	
	},
}

---------------------------------------------------------
--	/upuday & /upudayhelp commands					   --
--------------------------------------------------------- 

--get localized dungeon name from an acronym
function UPU.GetDungeon(acronym) 
	for i=0,UPU.MAJ_AND_GLIRION_CYCLE-1 do 
		if PledgesFromMaj[i].Acronym==acronym then
			return localizedPledges[PledgesFromMaj[i].PledgeID].Regular 
		end
	end
	for i=0,UPU.MAJ_AND_GLIRION_CYCLE-1 do 
		if PledgesFromGlirion[i].Acronym==acronym then
			return localizedPledges[PledgesFromGlirion[i].PledgeID].Regular 
		end
	end
	for i=0,UPU.URGARLAG_CYCLE-1 do 
		if PledgesFromUrgarlag[i].Acronym==acronym then
			return localizedPledges[PledgesFromUrgarlag[i].PledgeID].Regular 
		end
	end 
	return ""
end

--return true if location is a dungeon name
function UPU.isDungeon(location) 
	for k, v in pairs(localizedPledges) do
		if v.Regular==location then
			return k
		end
	end
	return ""
end

--get a list of dungeon acronyms
function UPU.GetDungeonAcronyms() 
	for i=0,UPU.MAJ_AND_GLIRION_CYCLE-1 do 
		UPU.Msg2Chat(UPU.Colorize(localizedPledges[PledgesFromMaj[i].PledgeID].Regular..": "..PledgesFromMaj[i].Acronym))
	end
	for i=0,UPU.MAJ_AND_GLIRION_CYCLE-1 do 
		UPU.Msg2Chat(UPU.Colorize(localizedPledges[PledgesFromGlirion[i].PledgeID].Regular..": "..PledgesFromGlirion[i].Acronym))
	end
	for i=0,UPU.URGARLAG_CYCLE-1 do 
		UPU.Msg2Chat(UPU.Colorize(localizedPledges[PledgesFromUrgarlag[i].PledgeID].Regular..": "..PledgesFromUrgarlag[i].Acronym))
	end 
end

---------------------------------------------------------
--	Achievements									   --
--------------------------------------------------------- 

--get dungeon achievs given the difficulty and the type of achiev
function UPU.GetAchievements(difficulty, pledgeID, achType)
	for i=0,UPU.MAJ_AND_GLIRION_CYCLE-1 do
		if PledgesFromMaj[i].PledgeID == pledgeID then
			return PledgesFromMaj[i].Achievements[difficulty][achType],achType
		end
	end
	for i=0,UPU.MAJ_AND_GLIRION_CYCLE-1 do 
		if PledgesFromGlirion[i].PledgeID == pledgeID then
			return PledgesFromGlirion[i].Achievements[difficulty][achType],achType
		end
	end
	for i=0,UPU.URGARLAG_CYCLE-1 do 
		if PledgesFromUrgarlag[i].PledgeID == pledgeID then
			return PledgesFromUrgarlag[i].Achievements[difficulty][achType],achType
		end
	end 
end

--get uncompleted achievs starting from an array (normal or difficult achievs) and achType(single or composed)
function UPU.GetUncompletedAchievements(achievements, achType)
	local res =  {}
	local j=1
	for i=1,#achievements do
		local id = achievements[i]
		if achType=="Composed" then composed=UPU.CheckComposed(id) else composed=true end
		local _,_,_,_,completed,_,_,_ = GetAchievementInfo(id)
		--d(name, completed)
		--d(GetAchievementInfo(achievements[i]))
		if not completed and composed and UPU.DeadlandsSavvyAchiev(id) then 
			res[j]=id
			j=j+1
		end
	end
	return res
end

--get uncompleted common achievs
function UPU.GetUncompletedCommonAchievements()
	return UPU.GetUncompletedAchievements(commonAchievements)
end

--print achievs (table as input)
function UPU.PrintAchievements(achievements)
	for i=1,#achievements do
		CHAT_SYSTEM:AddMessage( "|cF0F0F0-|r "..GetAchievementLink(achievements[i],1))
	end
end

--deadlandsSavvy achiev
function UPU.DeadlandsSavvyAchiev(id)
	if id==1159 then 
		if GetCurrentZoneDungeonDifficulty()==DUNGEON_DIFFICULTY_NORMAL then
			local _,_,_,_,c1,_,_,_ = GetAchievementInfo(1111)
			local _,_,_,_,c2,_,_,_ = GetAchievementInfo(1082)
			return not (c1 and c2)
		end
	end
	return true
end

--check when achiev is awarded
function UPU.isValidAchiev(id,pledgeID,difficulty)
	local achievements = UPU.GetAchievements(difficulty, pledgeID, "Single");
	--check in specific dungeon achievements
	for i=1,#achievements do
		if achievements[i]==id then return true end
	end
	--check in common dungeon achievements
	if UPU.sVars.bShowCommonAchievs then
		for i=1,#commonAchievements do
			if commonAchievements[i]==id then return true end
		end	
	end
	--check in composed dungeon achievements
	if UPU.sVars.bShowComposedAchievs then
		local composedAchievements = UPU.GetAchievements(difficulty, pledgeID, "Composed")
		for i=1,#composedAchievements do
			if composedAchievements[i]==id then return true end
		end	
	end
	return false
end

--check if the achiev is composed
function UPU.CheckComposed(id)
	return UPU.VanquisherOfTheAllianceAchiev(id) and UPU.AllSpeedAchiev(id) and UPU.AllDeathAchiev(id) and UPU.DLCDelverAchiev(id) and UPU.ICChallenger(id)
end

--composed Achievements:
function UPU.ICChallenger(id)
	local numCriteria = 6;
	local c1,c2,c3
	if id==1132 then
		local zone = GetUnitZone("player")
		if localizedPledges["UPU_PLEDGE_18"].Regular==zone then
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(1128)
			_,_,_,_,c2,_,_,_ = GetAchievementInfo(1129)
			_,_,_,_,c3,_,_,_ = GetAchievementInfo(1303)		
		else
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(1275)
			_,_,_,_,c2,_,_,_ = GetAchievementInfo(1276)
			_,_,_,_,c3,_,_,_ = GetAchievementInfo(1279)
		end
		return not (c1 and c2 and c3)	
	end
	return true
end

function UPU.DLCDelverAchiev(id)
	local numCriteria = 2;
	if id==1937 or id==2103 or id==2170 or id==2471 or id==2277 or id==1538 then
		for i=1,numCriteria do
			local dungeonName,numCompleted,numRequired = GetAchievementCriterion(id, i)
			if string.find(dungeonName, GetUnitZone("player")) then
				if numCompleted==numRequired then
					return false
				end
			end
		end
	end
	return true
end

function UPU.VanquisherOfTheAllianceAchiev(id)
	local numCriteria = 5;
	if id==1073 or id==1074 or id==1075 then
		for i=1,numCriteria do
			local dungeonName,numCompleted, numRequired = GetAchievementCriterion(id, i)
			if string.find(GetUnitZone("player"),dungeonName) then
				if numCompleted==numRequired then
					return false
				end
			end
		end
	end
	return true
end

function UPU.AllSpeedAchiev(id)
	local numCriteria = 7;
	if id==1071 then
		for i=1,numCriteria do
			local dungeonSpeed,numCompleted, numRequired = GetAchievementCriterion(id, i)
			if string.find(dungeonSpeed, GetUnitZone("player")) then
				if numCompleted==numRequired then
					return false
				end
			end
		end
	end
	return true
end

function UPU.AllDeathAchiev(id)
	local c1,c2 = true, true
	if id==1072 then
		if localizedPledges["UPU_PLEDGE_15"].Regular==zone then --Elden Hollow II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(463)	
		end
		if localizedPledges["UPU_PLEDGE_22"].Regular==zone then --Spindleclutch II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(448)	
		end
		if localizedPledges["UPU_PLEDGE_02"].Regular==zone then --The Banished Cells II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(451)
		end			
		if localizedPledges["UPU_PLEDGE_10"].Regular==zone then --Crypt of Hearts II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(942)	
			_,_,_,_,c2,_,_,_ = GetAchievementInfo(1114)		
		end
		if localizedPledges["UPU_PLEDGE_12"].Regular==zone then --Darkshade Caverns II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(467)	
		end
		if localizedPledges["UPU_PLEDGE_17"].Regular==zone then --Fungal Grotto II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(342)	
		end
		if localizedPledges["UPU_PLEDGE_27"].Regular==zone then --Wayrest Sewers II
			_,_,_,_,c1,_,_,_ = GetAchievementInfo(681)
		end			
		return not (c1 and c2)	
	end
	return true
end

---------------------------------------------------------
--	Pledges											   --
--------------------------------------------------------- 

--get the localized pledge info
function UPU.GetLocalizedPledge(internalIndex,questGiver)
	local pledgeID
	if questGiver == MAJ then
		pledgeID = PledgesFromMaj[internalIndex].PledgeID 
	elseif questGiver == GLIRION then
		pledgeID = PledgesFromGlirion[internalIndex].PledgeID
	elseif questGiver == URGARLAG then
		pledgeID = PledgesFromUrgarlag[internalIndex].PledgeID
	end
	return localizedPledges[pledgeID]	
end

--returns a item link specific to the quest (monster set)
function UPU.GetPledgeLink(internalIndex,questGiver)
	local pledgeLink
	if questGiver == MAJ then
		pledgeLink = PledgesFromMaj[internalIndex].Link 
	elseif questGiver == GLIRION then
		pledgeLink = PledgesFromGlirion[internalIndex].Link
	elseif questGiver == URGARLAG then
		pledgeLink = PledgesFromUrgarlag[internalIndex].Link
	end
	return pledgeLink	
end

ESO_Dialogs["UPU_TELEPORT"] = {
    title ={
        text = GetString(UPU_TELEPORT_TO), -- "Teleport to <<1>>",
    },
    mainText ={
        text = GetString(UPU_TELEPORT_ALERT), -- "Your group is not in veteran mode",
    },
    buttons ={
        [1] ={
            text =      GetString(UPU_TELEPORT_ANYWAY), --"teleport anyway",
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

end
