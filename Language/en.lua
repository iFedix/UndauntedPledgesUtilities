---------------------------------------------------------
-- English localization for UndauntedPledgesUtilities  --
---------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"This addon may contain nuts!")
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
	Add("UPU_MENU_SHOW_LOOT_INFO",		"Show collected helmets info")
	Add("UPU_MENU_SHOW_LOOT_INFO_TT",	"Displays the info about the collection of the helmets (L=Light, M=Medium, H=Heavy - Green=collected, Red=Not collected)")
    Add("UPU_DUNGEON_QUEST_INFO",		"Show Quest Completion Info")
	Add("UPU_DUNGEON_QUEST_INFO_TT",    "Show the info about the dungeon quest completion (useful to see if you still miss the skillpoint there)")
	Add("UPU_MENU_COMMON_ACH",			"Common Achievements")
	Add("UPU_MENU_COMMON_ACH_TT",		"Include common achievements to all the dungeons on both difficulties (i.e. the achievements in dungeons general category)")
	Add("UPU_MENU_COMPOSED_ACH",		"Composed Achievements")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Include achievements gainable by doing different tasks in different dungeons (e.g. Complete All Speed Challenges achiev or Vanquisher of the Covenant achiev)")
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Show on Achiev Awarded")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Show remaining achievements on achievement awarded")
	Add("UPU_MENU_CMDS",				"COMMANDS INFO")
	Add("UPU_MENU_CMD_DESCRIPTION",
			"|cFFD300/upupledges|r or |cFFD300/pledges|r: post dailies. Usage:"..
					"\n/pledges x: get the dailies on the x day starting from today (e.g.: /pledges -1 for yesteday pledges, /pledges 1 for tomorrow pledges, /pledges 5 for pledges in 5 days). Note: max 30 days allowed"..
			"\n|cFFD300/pledges week|r or |cFFD300/upupledges week|r: get pledges for the week"..
			"\n|cFFD300/day|r or |cFFD300/upuday|r: get the next pledge day of a specific dungeon given an acronym (e.g.: /upuday rom to get next pledge day for Ruins of Mazzatun)"..
			"\n|cFFD300/whereis|r or |cFFD300/upuwhereis|r: get the info about the location of a dungeon giving its acronym"..
			"\n|cFFD300/dayhelp|r or |cFFD300/upudayhelp|r: get a list of used acronyms by /upuday and /upuwhereis")

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
	Add("UPU_TELEPORT_ALERT",		 	"Your group is |ccc0a00NOT in VETERAN|r mode!")
	Add("UPU_TELEPORT_ANYWAY",	 		"Teleport anyway")
	Add("UPU_TELEPORTING_TO",			"Teleporting to ")
	Add("UPU_HAS_COST_YOU",				" has cost you ")
	Add("UPU_GOLD",						" gold")
	Add("UPU_NEW_DAILIES",				"New Undaunted Pledges are available!")
	Add("UPU_MAJ",						"Maj")
	Add("UPU_GLIRION",					"Glirion")
	Add("UPU_URGARLAG",					"Urgarlag")
	Add("UPU_BUTTON_TT",				"<Click to link dailies in chat>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Shows the undaunted pledges")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Get next pledge day based on a dung acronym")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Get a list of dungeon acronyms")
	Add("UPU_NEXT_DAY_FOR",				"Next pledge day for ")
	Add("UPU_STORE",                    "Store")
	Add("UPU_WHERE_IS_A",				"The dungeon")
	Add("UPU_WHERE_IS_B",				"is located in")
	Add("UPU_WHERE_IS_CMD_DESCRIPTION",	"Get the location of a dungeon giving its acronym")
	
	--achievements
	Add("UPU_NO_MISSING_ACH",			"No missing achievements for ")
	Add("UPU_MISSING_ACH",				"Missing achievements ")
	Add("UPU_MIDDLE_CLICK",				"Middle click on links to show them in Achievements")
	Add("UPU_GENERAL_ACH",				"General")
	Add("UPU_VETERAN_ACH",				"Veteran")
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 AWARDED!|r")
	Add("UPU_COMMON_ACH",				"Missing common achievements: ")
	Add("UPU_COMPOSED_ACH",				"Missing composed achievements: ")
	Add("UPU_ACH_TRACKER",				"Achievements")
	Add("UPU_ACH_ENABLE",				"Enable")
	Add("UPU_ACH_ENABLE_TT",			"Enable missing achievements info in chat when you enter a dungeon")
    Add("UPU_DAY",				        "Day")
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Abandon Pledges")
	Add("UPU_POST_TO_CHAT",				"Post to chat")
	Add("UPU_PLEDGES_ABANDONED",		"All UNFINISHED pledge quests are abandoned")
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Wrong offset")
	Add("UPU_WRONG_ACRONYM",			"Wrong acronym! Type /upudayhelp or /upuday for a list of dungeon acronyms")
	
	--pledges prefix
	Add("UPU_PLEDGE_PREFIX",			"Pledge: ")
end
