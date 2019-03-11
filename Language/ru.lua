----------------------------------------------------------------------------------------------------------
-- Russian localization for UndauntedPledgesUtilities (Translated by @Savaoth and @Wolf-F_low, thanks!) --
----------------------------------------------------------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"Аддон может содержать орешки!\nРусская локализация: @Savaoth и @Wolf-F_low")	
	Add("UPU_MENU_AUTO_ABANDON",		"Авто-отмена незавершенных обетов: ")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Автоматически отменять все НЕЗАВЕРШЕННЫЕ обеты при обновлении ежедневных заданий.")
	Add("UPU_MENU_CHEST_HELPER",		"Помощник по сундукам Неустрашимых: ")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Отображать в подсказках к сундукам Неустрашимых список доступных в сундуке сетов.")
	Add("UPU_MENU_DISPLAY_WS",			"Показывать экран приветствия")	
	Add("UPU_MENU_DISPLAY_WS_TT",		"Показывать экран приветствия")	
	Add("UPU_MENU_GENERAL",				"ОБЩЕЕ") -- menu category
	Add("UPU_MENU_DAILIES",				"ДЕЙЛИКИ") -- menu category
	Add("UPU_MENU_COLOR",				"Цвет в чате:")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Показывать обеты в чате:")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Выводить список сегодняшних обетов в чат при входе в игру.")
	Add("UPU_MENU_QUICK_DIALOGS",		"Авто-диалоги:")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Автоматически принимать и сдавать обеты при разговоре с Неустрашимыми.")
	Add("UPU_MENU_SHOW_LOOT",			"Отображать шлемы")
	Add("UPU_MENU_SHOW_LOOT_TT",		"Отображать монстр-сет шлемы данжа.")
	Add("UPU_MENU_DAILY_DELVE",			"Ежедневный Delve-квест Болгрула")
	Add("UPU_MENU_DAILY_DELVE_TT",		"Отображать ежедневный Delve-квест Болгрула в отдельной категории в журнале в списке заданий (Категория по умолчанию: Гильдия)") 
	Add("UPU_MENU_COMMON_ACH",			"Общие достижения")
	Add("UPU_MENU_COMMON_ACH_TT",		"Отображать общие достижения для всех подземелий на обеих сложностях (то есть достижения  категории 'Общее')") 
	Add("UPU_MENU_COMPOSED_ACH",		"Составные достижения")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Отображать составные достижения, которые можно получить, выполняя прохождение на скорость, без смерти, в усложненном режиме)") 
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Мгновенно обновлять список достижений")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Обновлять список оставшихся достижений подземелья в чат, после выполнения какого-либо достижения этого подземелья") 
	Add("UPU_MENU_CMDS",				"Список команд")
	Add("UPU_MENU_CMD_DESCRIPTION",		"|cFFD300/pledges|r отображает сегодняшние ежедневные Обеты. Чтобы узнать какие Обеты будут в будущем, добавьте значение, на какой день после сегодняшнего Вы интересуетесь. Например /pledges 1 на завтра /pledges 5 через 5 дней. Максимальное значение - 30 дней\n |cFFD300/upuday|r Узнать дату Обета интересующего Вас подземелья. Вводить необходимо сокращенными названиям. Например |cFFD300/upuday rom|r отобразит следующий Обет для Руин Маззатуна \n |cFFD300/upudayhelp|r Отобразить список сокращений для подземелий")
	
	
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
	Add("UPU_CHEST_URGARLAG",			"Domihaus, Earthgore, Lord Warden, Mighty Chudan, Molag Kena, Thurvokun, Velidreth, Zaan, Vykosa, Balorgh, Symphony of Blades, Stonekeeper.")
	Add("UPU_BUTTON_TT",				"<Список обетов в чат>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Отобразить обеты неустрашимых")
	Add("UPU_TEST_CMD_DESCRIPTION",		"Print dungeon nodes (only on debug mode)")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Узнать дату Обета подземелья по сокращенному названию")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Получить список сокращений названий подземелий") 
	Add("UPU_NEXT_DAY_FOR",				"Следующая возможность выполнить Обет для ") 
	
	--achievements
	Add("UPU_NO_MISSING_ACH",			"Нет невыполненных достижений для ") 
	Add("UPU_MISSING_ACH",				"Невыполненные достижения ") 
	Add("UPU_MIDDLE_CLICK",				"Щелчок средней кнопкой мыши, для отображения в журнале достижений") 
	Add("UPU_NORMAL_MODE",				"Нормальный режим") 
	Add("UPU_VETERAN_MODE",				"Ветеранский режим") 
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 ВЫПОЛНЕНО!|r") 
	Add("UPU_COMMON_ACH",				"Недостающие общие достижения: ") 
	Add("UPU_COMPOSED_ACH",				"Недостающие составные достижения: ") 
	Add("UPU_ACH_TRACKER",				"Достижения") 
	Add("UPU_ACH_ENABLE",				"Отобразить пропущенные") 
	Add("UPU_ACH_ENABLE_TT",			"Отображать информацию о пропущенных достижениях в чат при входе в подземелье") 
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Отказаться от обета") 
	Add("UPU_POST_TO_CHAT",				"Отправить в чат")	
	Add("UPU_PLEDGES_ABANDONED",		"Отказаться от всех обетов") 
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Задана не правильная дата") 
	Add("UPU_WRONG_ACRONYM",			"Неправильное сокращение! Введите в чат /upudayhelp чтобы увидить список сокращений названий подземелий") 
	
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
			Quest = "Обет: Священное Горнило",
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
			Quest = "Обет: Пещеры Глубокая тень II",
			Node = 264,
		},
		["UPU_PLEDGE_13"] ={
			Regular = "Крепость Лютых Морозов",
			Quest = "Обет: Крепость Лютых Морозов",
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
			Quest = "Обет: Тюрьма Имперского Города",
			Node = 236,
		},
		["UPU_PLEDGE_19"] ={
			Regular = "Руины Маззатуна",
			Quest = "Обет: Руины Маззатуна",
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
			Quest = "Обет: Остров Бурь",
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
			Quest = "Обет: Канализация Вэйреста I",
			Node = 189,
		},
		["UPU_PLEDGE_27"] ={
			Regular = "Канализация Вэйреста II",
			Quest = "Обет: Канализация Вэйреста II",
			Node = 263,
		},
		["UPU_PLEDGE_28"] ={
			Regular = "Башня Белого Золота",
			Quest = "Обет: Башня Белого Золота",
			Node = 247,
		},
		["UPU_PLEDGE_29"] ={
			Regular = "Кузница Кровавого корня",
			Quest = "Обет: Кузница Кровавого корня",
			Node = 326,
		},
		["UPU_PLEDGE_30"] ={
			Regular = "Владение Фолкрит",
			Quest = "Обет: Владение Фолкрит",
			Node = 332,
		},
		
		["UPU_PLEDGE_31"] ={
			Regular = "Логово Клыка",
			Quest = "Обет: Логово Клыка",
			Node = 341,
		},
		["UPU_PLEDGE_32"] ={
			Regular = "Пик Призывательницы Чешуи",
			Quest = "Обет: Пик Призывательницы Чешуи",
			Node = 363,
		},
		["UPU_PLEDGE_33"] ={
			Regular = "Крепость Лунного Охотника",
			Quest = "Обет: Крепость Лунного Охотника",
			Node = 371,
		},
		["UPU_PLEDGE_34"] ={
			Regular = "Путь Жертвоприношений",
			Quest = "Обет:  Путь Жертвоприношений",
			Node = 370,
		},		
		["UPU_PLEDGE_35"] ={
			Regular = "Глубины Малатара",
			Quest = "Обет: Глубины Малатара",
			Node = 390,
		},
		["UPU_PLEDGE_36"] ={
			Regular = "Морозное хранилище",
			Quest = "Обет: Морозное хранилище",
			Node = 389,
		},
	}
	
end
