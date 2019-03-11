---------------------------------------------------------
-- English localization for UndauntedPledgesUtilities  --
---------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"This Addon may contain nuts!")
	Add("UPU_MENU_AUTO_ABANDON",		"Auto Abandon")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Silently abandon all NON COMPLETED undaunted pledges")
	Add("UPU_MENU_CHEST_HELPER",		"Chest Helper")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Displays the list of possible chest Sets")
	Add("UPU_MENU_GENERAL",				"GENERAL")
	Add("UPU_MENU_DAILIES",				"DAILIES")
	Add("UPU_MENU_COLOR",				"Main Color")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Display Dailies")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Whether or not the list of dailies will be displayed at start")
	Add("UPU_MENU_QUICK_DIALOGS",		"Quick Dialogs")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Auto accepts and returns quests in npc dialogs")
	Add("UPU_MENU_SHOW_LOOT",			"Show Helmets")
	Add("UPU_MENU_SHOW_LOOT_TT",		"Displays the lootable helmets in the dungeons")
	Add("UPU_MENU_DAILY_DELVE",			"Daily Delve")
	Add("UPU_MENU_DAILY_DELVE_TT",		"Shows the daily delve quest in Undaunted Dailies category (default: Guild category)")
	Add("UPU_MENU_COMMON_ACH",			"Common Achievements")
	Add("UPU_MENU_COMMON_ACH_TT",		"Include common achievements to all the dungeons on both difficulties (i.e. the achievements in dungeons general category)")
	Add("UPU_MENU_COMPOSED_ACH",		"Composed Achievements")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Include achievements gainable by doing different tasks in different dungeons (e.g. Complete All Speed Challenges achiev or Vanquisher of the Covenant achiev)")
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Show on Achiev Awarded")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Show remaining achievements on achievement awarded")
	Add("UPU_MENU_CMDS",				"COMMANDS INFO")
	Add("UPU_MENU_CMD_DESCRIPTION",		" |cFFD300/pledges|r: post dailies. Usage:\n/pledges x: get the dailies on the x day starting from today (e.g.: /pledges -1 for yesteday pledges, /pledges 1 for tomorrow pledges, /pledges 5 for pledges in 5 days). Note: max 30 days allowed\n/pledges week: get pledges for the week\n|cFFD300/upuday|r: get the next pledge day of a specific dungeon given an acronym (e.g.: /upuday rom to get next pledge day for Ruins of Mazzatun)\n|cFFD300/upudayhelp|r: get a list of used acronyms by /upuday")
	
	--Chat
	Add("UPU_PLEDGE",		       		"PLEDGE")
	Add("UPU_UNDAUNTED_DAILY_CATEGORY", "Undaunted Dailies")	
	Add("UPU_UNDAUNTED_DAILES",  		"Undaunted Daily Pledges:")
	Add("UPU_FROM_MAJ",          		"Pledge from Maj: ")
	Add("UPU_FROM_GLIRION",      		"Pledge from Glirion: ")
	Add("UPU_FROM_URGARLAG",     		"Pledge from Urgarlag (DLC): ")
	Add("UPU_QUEST_COMPLETE_1",  		"Return to")
	Add("UPU_QUEST_COMPLETE_2",  		"Talk to")
	Add("UPU_ABANDONNED",        		"abandonned")
	Add("UPU_TELEPORT",			 		"Teleport to Instance")
	Add("UPU_TELEPORT_TO",		 		"Teleport to <<1>>")
	Add("UPU_TELEPORT_ALERT",		 	"Your group is |ccc0a00NOT in VETERAN|r mode !")
	Add("UPU_TELEPORT_ANYWAY",	 		"teleport anyway")
	Add("UPU_TELEPORTING_TO",			"Teleporting to ")
	Add("UPU_HAS_COST_YOU",				" has cost you ")
	Add("UPU_GOLD",						" gold.")
	Add("UPU_REWARD_CHEST",				"Reward Chest")
	Add("UPU_NEW_DAILIES",				"New Undaunted Pledges are availlable !")
	Add("UPU_MAY_CONTAIN",				"May contain : ")
	Add("UPU_CHEST_MAJ",				"Blood Spawn, Chokethorn, Shadowrend, Engine Guardian, Kra'gh, Maw of the Infernal, Nightflame, Scourge Harvester, Sentinel of Rkugamz, Slimecraw, Spawn of Mephala, Swarm Mother.") 
	Add("UPU_CHEST_GLIRION",			"Grothdarr, Iceheart, Ilambris, Infernal Guardian, Sellistrix, Nerien'eth, Pirate Skeleton, Selene, Stormfist, Tremorscale, Troll King, Valkyn Skoria.") 
	Add("UPU_CHEST_URGARLAG",			"Domihaus, Earthgore, Lord Warden, Mighty Chudan, Molag Kena, Thurvokun, Velidreth, Zaan, Vykosa, Balorgh, Symphony of Blades, Stonekeeper.") 	
	Add("UPU_MAJ",						"Maj")
	Add("UPU_GLIRION",					"Glirion")
	Add("UPU_URGARLAG",					"Urgarlag")
	Add("UPU_BUTTON_TT",				"<Click to link dailies in chat>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Shows the undaunted pledges")
	Add("UPU_TEST_CMD_DESCRIPTION",		"Print dungeon nodes (only on debug mode)")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Get next pledge day based on a dung acronym")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Get a list of dungeon acronyms")
	Add("UPU_NEXT_DAY_FOR",				"Next pledge day for ")
	
	--achievements
	Add("UPU_NO_MISSING_ACH",			"No missing achievements for ")
	Add("UPU_MISSING_ACH",				"Missing achievements ")
	Add("UPU_MIDDLE_CLICK",				"Middle click on links to show them in Achievements")
	Add("UPU_NORMAL_MODE",				"Normal mode")
	Add("UPU_VETERAN_MODE",				"Veteran mode")
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 AWARDED!|r")
	Add("UPU_COMMON_ACH",				"Missing common achievements: ")
	Add("UPU_COMPOSED_ACH",				"Missing composed achievements: ")
	Add("UPU_ACH_TRACKER",				"Achievements")
	Add("UPU_ACH_ENABLE",				"Enable")
	Add("UPU_ACH_ENABLE_TT",			"Enable missing achievements info in chat when you enter a dungeon")
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Abandon Pledges")
	Add("UPU_POST_TO_CHAT",				"Post to chat")
	Add("UPU_PLEDGES_ABANDONED",		"All pledge quests are abandoned")
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Wrong offset")
	Add("UPU_WRONG_ACRONYM",			"Wrong acronym! Type /upudayhelp for a list of dungeon acronyms")
	
	--undaunted daily delves
	localizedDailyUndauntedDelves = {"Ancestor Wards in Deshaan","Ancient Armaments in Bangkorai","Ayleid Trinkets in Grahtwood","Culinary Justice in Greenshade","Cursed Baubles of Stormhaven",
									 "Darkness Blooms in Rivenspire","Dwarven Relics of Stonefalls","Give and Take in Shadowfen","Icy Intrigue in Eastmarch","Inflamed Pyres of the Rift","Mascot Theft in Reaper's March",
									 "Molten Pearls of Alik'r Desert","Red Rook Ransack in Glenumbra","The Spirit Trap in Malabal Tor","Veiled Darkness in Auridon"}
	
	--Dailies (some quest have a different name than the regular dungeon name, ie blessed crucible, darkshade II...)
	localizedPledges={
		["UPU_PLEDGE_01"] ={
			Regular = "Arx Corinium",
			Quest = "Pledge: Arx Corinium",
			Node = 192,
		},
		["UPU_PLEDGE_02"] ={
			Regular = "The Banished Cells I",
			Quest = "Pledge: Banished Cells I",
			Node = 194,
		},
		["UPU_PLEDGE_03"] ={
			Regular = "The Banished Cells II",
			Quest = "Pledge: Banished Cells II",
			Node = 262,
		},
		["UPU_PLEDGE_04"] ={
			Regular = "Blackheart Haven",
			Quest = "Pledge: Blackheart Haven",
			Node = 186,
		},
		["UPU_PLEDGE_05"] ={
			Regular = "Blessed Crucible",
			Quest = "Pledge: Blessed Crucible I",
			Node = 187,
		},
		["UPU_PLEDGE_06"] ={
			Regular = "City of Ash I",
			Quest = "Pledge: City of Ash I",
			Node = 197,
		},
		["UPU_PLEDGE_07"] ={
			Regular = "City of Ash II",	
			Quest = "Pledge: City of Ash II",
			Node = 268,
		},
		["UPU_PLEDGE_08"] ={
			Regular = "Cradle of Shadows",	
			Quest = "Pledge: Cradle of Shadows",
			Node = 261,
		},
		["UPU_PLEDGE_09"] ={
			Regular = "Crypt of Hearts I",	
			Quest = "Pledge: Crypt of Hearts I",
			Node = 190,
		},
		["UPU_PLEDGE_10"] ={
			Regular = "Crypt of Hearts II",	
			Quest = "Pledge: Crypt of Hearts II",
			Node = 269,
		},
		["UPU_PLEDGE_11"] ={
			Regular = "Darkshade Caverns I",
			Quest = "Pledge: Darkshade Caverns I",
			Node = 198,
		},
		["UPU_PLEDGE_12"] ={
			Regular = "Darkshade Caverns II",
			Quest = "Pledge: Darkshade II",
			Node = 264,
		},
		["UPU_PLEDGE_13"] ={
			Regular = "Direfrost Keep",
			Quest = "Pledge: Direfrost Keep I",
			Node = 195,
		},
		["UPU_PLEDGE_14"] ={
			Regular = "Elden Hollow I",	
			Quest = "Pledge: Elden Hollow I",
			Node = 191,
		},
		["UPU_PLEDGE_15"] ={
			Regular = "Elden Hollow II",	
			Quest = "Pledge: Elden Hollow II",
			Node = 265,
		},
		["UPU_PLEDGE_16"] ={
			Regular = "Fungal Grotto I",	
			Quest = "Pledge: Fungal Grotto I",
			Node = 98,
		},
		["UPU_PLEDGE_17"] ={
			Regular = "Fungal Grotto II",
			Quest = "Pledge: Fungal Grotto II",
			Node = 266,
		},
		["UPU_PLEDGE_18"] ={
			Regular = "Imperial City Prison",	
			Quest = "Pledge: Imperial City Prison",
			Node = 236,
		},
		["UPU_PLEDGE_19"] ={
			Regular = "Ruins of Mazzatun",
			Quest = "Pledge: Ruins of Mazzatun",
			Node = 260,
		},
		["UPU_PLEDGE_20"] ={
			Regular = "Selene's Web",
			Quest = "Pledge: Selene's Web",
			Node = 185,
		},
		["UPU_PLEDGE_21"] ={
			Regular = "Spindleclutch I",
			Quest = "Pledge: Spindleclutch I",
			Node = 193,
		},
		["UPU_PLEDGE_22"] ={
			Regular = "Spindleclutch II",
			Quest = "Pledge: Spindleclutch II",
			Node = 267,
		},
		["UPU_PLEDGE_23"] ={
			Regular = "Tempest Island",
			Quest = "Pledge: Tempest Island",
			Node = 188,
		},
		["UPU_PLEDGE_24"] ={
			Regular = "Vaults of Madness",	
			Quest = "Pledge: Vaults of Madness",
			Node = 184,
		},
		["UPU_PLEDGE_25"] ={
			Regular = "Volenfell",
			Quest = "Pledge: Volenfell",
			Node = 196,
		},
		["UPU_PLEDGE_26"] ={
			Regular = "Wayrest Sewers I",
			Quest = "Pledge: Wayrest Sewers I",
			Node = 189,
		},
		["UPU_PLEDGE_27"] ={
			Regular = "Wayrest Sewers II",
			Quest = "Pledge: Wayrest Sewers II",
			Node = 263,
		},
		["UPU_PLEDGE_28"] ={
			Regular = "White-Gold Tower",
			Quest = "Pledge: White-Gold Tower",
			Node = 247,
		},
		["UPU_PLEDGE_29"] ={
			Regular = "Bloodroot Forge",
			Quest = "Pledge: Bloodroot Forge",
			Node = 326,
		},
		["UPU_PLEDGE_30"] ={
			Regular = "Falkreath Hold",
			Quest = "Pledge: Falkreath Hold",
			Node = 332,
		},
		["UPU_PLEDGE_31"] ={
			Regular = "Fang Lair",
			Quest = "Pledge: Fang Lair",
			Node = 341,
		},
		["UPU_PLEDGE_32"] ={
			Regular = "Scalecaller Peak",
			Quest = "Pledge: Scalecaller Peak",
			Node = 363,
		},
		["UPU_PLEDGE_33"] ={
			Regular = "Moon Hunter Keep",
			Quest = "Pledge: Moon Hunter Keep",
			Node = 371,
		},
		["UPU_PLEDGE_34"] ={
			Regular = "March of Sacrifices",
			Quest = "Pledge: March of Sacrifices",
			Node = 370,
		},
		["UPU_PLEDGE_35"] ={
			Regular = "Depths of Malatar",
			Quest = "Pledge: Depths of Malatar",
			Node = 390,
		},
		["UPU_PLEDGE_36"] ={
			Regular = "Frostvault",
			Quest = "Pledge: Frostvault",
			Node = 389,
		},
	}
end
