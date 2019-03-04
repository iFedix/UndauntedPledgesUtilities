--------------------------------------------------------------------------------------------
-- Russian localization for UndauntedPledgesUtilities (Translated partially by @Savaoth ) --
--------------------------------------------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"ARK_Undaunted: Обеты Неустрашимых.\nРусская локализация: @Savaoth")	
	Add("UPU_MENU_AUTO_ABANDON",		"Авто-отмена незавершенных обетов: ")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Автоматически отменять все НЕЗАВЕРШЕННЫЕ обеты при обновлении ежедневных заданий.")
	Add("UPU_MENU_CHEST_HELPER",		"Помощник по сундукам: ")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Отображать в подсказках к сундукам Неустрашимых список доступных в сундуке сетов.")
	Add("UPU_MENU_DISPLAY_WS",			"Показывать экран приветствия")	
	Add("UPU_MENU_DISPLAY_WS_TT",		"Показывать экран приветствия")	
	Add("UPU_MENU_GENERAL",				"GENERAL") -- menu category
	Add("UPU_MENU_DAILIES",				"DAILIES") -- menu category
	Add("UPU_MENU_COLOR",				"Цвет в чате:")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Показывать обеты в чате:")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Выводить список сегодняшних обетов в чат при входе в игру.")
	Add("UPU_MENU_QUICK_DIALOGS",		"Авто-диалоги:")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Автоматически принимать и сдавать обеты при разговоре с Неустрашимыми.")
	Add("UPU_MENU_SHOW_LOOT",			"Show Helmets")	--TO TRANSLATE
	Add("UPU_MENU_SHOW_LOOT_TT",		"Displays the lootable helmets in the dungeons.") --TO TRANSLATE
	Add("UPU_MENU_DAILY_DELVE",			"Daily Delve") --TO TRANSLATE
	Add("UPU_MENU_DAILY_DELVE_TT",		"Shows the daily delve quest in Undaunted Dailies category (default: Guild category)") --TO TRANSLATE
	Add("UPU_MENU_COMMON_ACH",			"Common Achievements") --TO TRANSLATE
	Add("UPU_MENU_COMMON_ACH_TT",		"Include common achievements to all the dungeons on both difficulties (i.e. the achievements in dungeons general category)") --TO TRANSLATE
	Add("UPU_MENU_COMPOSED_ACH",		"Composed Achievements") --TO TRANSLATE
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Include achievements gainable by doing different tasks in different dungeons (e.g. Complete All Speed Challenges achiev or Vanquisher of the Covenant achiev)") --TO TRANSLATE
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Show on Achiev Awarded") --TO TRANSLATE
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Show remaining achievements on achievement awarded") --TO TRANSLATE
	
	--Chat
	Add("UPU_PLEDGE",            		"ОБЕТ")
	Add("UPU_UNDAUNTED_DAILY_CATEGORY", "НЕУСТРАШИМЫХ")
	Add("UPU_MAIN_STORY_CATEGORY",		"СЮЖЕТНОЕ ЗАДАНИЕ")
	Add("UPU_UNDAUNTED_DAILES",  		"Обеты неустрашимых: ")
	Add("UPU_FROM_MAJ",          		"Обет от Мадж: ")
	Add("UPU_FROM_GLIRION",      		"Обет от Глириона: ")
	Add("UPU_FROM_URGARLAG",     		"Обет от Ургарлаг (DLC): ")
	Add("UPU_QUEST_COMPLETE_1",		  	"Вернуться ")
	Add("UPU_QUEST_COMPLETE_2",  		"Поговорить ")
	Add("UPU_ABANDONNED",        		"отменено")
	Add("UPU_TELEPORT",			 		"Телепорт к инстансу")
	Add("UPU_TELEPORT_TO",		 		"Телепорт к  <<1>>")
	Add("UPU_TELEPORT_ALERT",	 		"Ваша группа |ccc0a00НЕ в ВЕТЕРАНСКОМ|r режиме!")
	Add("UPU_TELEPORT_ANYWAY",	 		"всё равно телепортироваться")
	Add("UPU_TELEPORTING_TO",			"телепортация к ")
	Add("UPU_HAS_COST_YOU",				" будет стоить ")
	Add("UPU_GOLD",						" золотых.")
	Add("UPU_REWARD_CHEST",				"Сундук с наградой")
	Add("UPU_NEW_DAILIES",				"Доступны новые обеты Неустрашимых!")
	Add("UPU_MAY_CONTAIN",				"Может содержать: ")
	Add("UPU_MAJ",						"Мадж")
	Add("UPU_GLIRION",					"Глирион")
	Add("UPU_URGARLAG",					"Ургарлаг")
	Add("UPU_CHEST_MAJ",				"Blood Spawn, Chokethorn, Shadowren, Engine Guardian, Kra'gh, Maw of the Infernal, Nightflame, Scourge Harvester, Sentinel of Rkugamz, Slimecraw, Spawn of Mephala, Swarm Mother.") 
	Add("UPU_CHEST_GLIRION",			"Grothdarr, Iceheart, Ilambris, Infernal Guardian, Sellistrix, Nerien'eth, Pirate Skeleton, Selene, Stormfist, Tremorscale, Troll King, Valkyn Skoria.") 
	Add("UPU_CHEST_URGARLAG",			"Domihaus, Earthgore, Lord Warden, Mighty Chudan, Molag Kena, Thurvokun, Velidreth, Zaan, Vykosa, Balorgh, Symphony of Blades, Stonekeeper.") --TO TRANSLATE
	Add("UPU_BUTTON_TT",				"<Список обетов в чат>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Shows the undaunted pledges")	--TO TRANSLATE
	Add("UPU_TEST_CMD_DESCRIPTION",		"Print dungeon nodes (only on debug mode)") --TO TRANSLATE
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Get next pledge day based on a dung acronym") --TO TRANSLATE
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Get a list of dungeon acronyms") --TO TRANSLATE
	Add("UPU_NEXT_DAY_FOR",				"Next pledge day for ") --TO TRANSLATE
	
	--achievements
	Add("UPU_NO_MISSING_ACH",			"No missing achievements for ") --TO TRANSLATE
	Add("UPU_MISSING_ACH",				"Missing achievements ") --TO TRANSLATE
	Add("UPU_MIDDLE_CLICK",				"Middle click on links to show them in Achievements") --TO TRANSLATE
	Add("UPU_NORMAL_MODE",				"Normal mode") --TO TRANSLATE
	Add("UPU_VETERAN_MODE",				"Veteran mode") --TO TRANSLATE
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 AWARDED!|r") --TO TRANSLATE
	Add("UPU_COMMON_ACH",				"Missing common achievements: ") --TO TRANSLATE
	Add("UPU_COMPOSED_ACH",				"Missing composed achievements: ") --TO TRANSLATE
	Add("UPU_ACH_TRACKER",				"Achievements") --TO TRANSLATE
	Add("UPU_ACH_ENABLE",				"Enable") --TO TRANSLATE
	Add("UPU_ACH_ENABLE_TT",			"Enable missing achievements info in chat when you enter a dungeon") --TO TRANSLATE
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Abandon Pledges") --TO TRANSLATE
	Add("UPU_POST_TO_CHAT",				"Post to chat")	--TO TRANSLATE
	Add("UPU_PLEDGES_ABANDONED",		"All pledge quests are abandoned") --TO TRANSLATE
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Wrong offset") --TO TRANSLATE
	Add("UPU_WRONG_ACRONYM",			"Wrong acronym! Type /upudayhelp for a list of dungeon acronyms") --TO TRANSLATE
	
	--undaunted daily delves
	localizedDailyUndauntedDelves = {"Обереги предков в Дешаане","Древнее оружие Бангкорая","Айлейдские безделушки в Гратвуде","Кулинарное правосудие в Гриншейде","Проклятые безделушки Стормхейвена",
									 "Расцвет тьмы в Ривенспайре","Двемерские реликвии Стоунфолза","Обмен в Шедоуфене","Ледяная интрига в Истмарке","Зажженные погребальные огни в Рифте","Талисман вора в Марке Смерти",
									 "Расплавленный жемчуг в пустыне Алик'р","Ограбление Красных Грачей в Гленумбре","The Spirit Trap in Malabal Tor","Скрытая тьма на Ауридоне"}
	
	--Dailies (some quest have a different name than the regular dungeon name)
	localizedPledges={
		["UPU_PLEDGE_01"] ={
			Regular = "Аркс Кориниум",
			Quest = "Обет: Аркс Кориниум",
			Node = 192,
		},
		["UPU_PLEDGE_02"] ={
			Regular = "Темницы изгнанников I",
			Quest = "Обет: темницы изгнанников I",
			Node = 194,
		},
		["UPU_PLEDGE_03"] ={
			Regular = "Темницы изгнанников II",
			Quest = "Обет: темницы изгнанников II",
			Node = 262,
		},
		["UPU_PLEDGE_04"] ={
			Regular = "Гавань Черное Сердце",
			Quest = "Обет: гавань Черное Сердце",
			Node = 186,
		},
		["UPU_PLEDGE_05"] ={
			Regular = "Священное Горнило",
			Quest = "Обет: Священное горнило",
			Node = 187,
		},
		["UPU_PLEDGE_06"] ={
			Regular = "Город Пепла I",
			Quest = "Обет: Город Пепла I",
			Node = 197,
		},
		["UPU_PLEDGE_07"] ={
			Regular = "Город Пепла II",	
			Quest = "Обет: Город Пепла II",
			Node = 268,
		},
		["UPU_PLEDGE_08"] ={
			Regular = "Колыбель Теней",	
			Quest = "Обет: Колыбель Теней",
			Node = 261,
		},
		["UPU_PLEDGE_09"] ={
			Regular = "Крипта Сердец I",	
			Quest = "Обет: Крипта Сердец I",
			Node = 190,
		},
		["UPU_PLEDGE_10"] ={
			Regular = "Крипта Сердец II",	
			Quest = "Обет: Крипта Сердец II",
			Node = 269,
		},
		["UPU_PLEDGE_11"] ={
			Regular = "Пещеры Глубокая тень I",
			Quest = "Обет: пещеры Глубокая тень I",
			Node = 198,
		},
		["UPU_PLEDGE_12"] ={
			Regular = "Пещеры Глубокая тень II",
			Quest = "Обет: пещеры Глубокая тень II",
			Node = 264,
		},
		["UPU_PLEDGE_13"] ={
			Regular = "Крепость Лютых Морозов",
			Quest = "Обет: крепость Лютых Морозов I",
			Node = 195,
		},
		["UPU_PLEDGE_14"] ={
			Regular = "Элденская лощина I",	
			Quest = "Обет: Элденская лощина I",
			Node = 191,
		},
		["UPU_PLEDGE_15"] ={
			Regular = "Элденская лощина II",	
			Quest = "Обет: Элденская лощина II",
			Node = 265,
		},
		["UPU_PLEDGE_16"] ={
			Regular = "Грибной грот I",	
			Quest = "Обет: Грибной грот I",
			Node = 98,
		},
		["UPU_PLEDGE_17"] ={
			Regular = "Грибной грот II",
			Quest = "Обет: Грибной грот II",
			Node = 266,
		},
		["UPU_PLEDGE_18"] ={
			Regular = "Тюрьма Имперского Города",	
			Quest = "Обет: тюрьма Имперского Города",
			Node = 236,
		},
		["UPU_PLEDGE_19"] ={
			Regular = "Руины Маззатуна",
			Quest = "Обет: руины Маззатуна",
			Node = 260,
		},
		["UPU_PLEDGE_20"] ={
			Regular = "Паутина Селены",
			Quest = "Обет: Паутина Селены",
			Node = 185,
		},
		["UPU_PLEDGE_21"] ={
			Regular = "Спиндлклатч I",
			Quest = "Обет: Спиндлклатч I",
			Node = 193,
		},
		["UPU_PLEDGE_22"] ={
			Regular = "Спиндлклатч II",
			Quest = "Обет: Спиндлклатч II",
			Node = 267,
		},
		["UPU_PLEDGE_23"] ={
			Regular = "Остров Бурь",
			Quest = "Обет: остров Бурь",
			Node = 188,
		},
		["UPU_PLEDGE_24"] ={
			Regular = "Своды Безумия",	
			Quest = "Обет: Своды Безумия",
			Node = 184,
		},
		["UPU_PLEDGE_25"] ={
			Regular = "Воленфел",
			Quest = "Обет: Воленфел",
			Node = 196,
		},
		["UPU_PLEDGE_26"] ={
			Regular = "Канализация Вэйреста I",
			Quest = "Обет: канализация Вэйреста I",
			Node = 189,
		},
		["UPU_PLEDGE_27"] ={
			Regular = "Канализация Вэйреста II",
			Quest = "Обет: канализация Вэйреста II",
			Node = 263,
		},
		["UPU_PLEDGE_28"] ={
			Regular = "Башня Белого Золота",
			Quest = "Обет: Башня Белого Золота",
			Node = 247,
		},
		["UPU_PLEDGE_29"] ={
			Regular = "Кузница Кровавого корня",
			Quest = "Обет: кузница Кровавого корня",
			Node = 326,
		},
		["UPU_PLEDGE_30"] ={
			Regular = "Владение Фолкрит",
			Quest = "Обет: владение Фолкрит",
			Node = 332,
		},
		--TO TRANSLATE
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
