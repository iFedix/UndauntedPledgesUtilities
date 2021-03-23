----------------------------------------------------------------------------------------------------------
-- Russian localization for UndauntedPledgesUtilities 													--
----------------------------------------------------------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"Аддон может содержать орешки!\nРусская локализация: @Savaoth и @Wolf-F_low")
	Add("UPU_MENU_AUTO_ABANDON",		"Авто-отмена незавершенных обетов: ")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Автоматически отменять все НЕЗАВЕРШЕННЫЕ обеты при обновлении ежедневных заданий")
	Add("UPU_MENU_CHEST_HELPER",		"Помощник по сундукам Неустрашимых: ")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Отображать в подсказках к сундукам Неустрашимых список доступных в сундуке сетов")
	Add("UPU_MENU_GENERAL",				"ОБЩЕЕ")
	Add("UPU_MENU_DAILIES",				"ДЕЙЛИКИ")
	Add("UPU_MENU_COLOR",				"Цвет в чате:")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Показывать обеты в чате:")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Выводить список сегодняшних обетов в чат при входе в игру")
	Add("UPU_MENU_QUICK_DIALOGS",		"Авто-диалоги:")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Автоматически принимать и сдавать обеты при разговоре с Неустрашимыми")
	Add("UPU_MENU_SHOW_LOOT",			"Отображать шлемы")
	Add("UPU_MENU_SHOW_LOOT_TT",		"Отображать монстр-сет шлемы данжа")
	Add("UPU_MENU_SHOW_LOOT_INFO",		"Show collected helmets info")
	Add("UPU_MENU_SHOW_LOOT_INFO_TT",	"Displays the info about the collection of the helmets (L=Light, M=Medium, H=Heavy - Green=collected, Red=Not collected)") --TO TRANSLATE
    Add("UPU_DUNGEON_QUEST_INFO",		"Помечать невыполненные квесты")
	Add("UPU_DUNGEON_QUEST_INFO_TT",    "Помечать обеты с невыполненным квестом подземелья(за который полагается 1 очко навыков)")
	Add("UPU_MENU_COMMON_ACH",			"Общие достижения")
	Add("UPU_MENU_COMMON_ACH_TT",		"Отображать общие достижения для всех подземелий на обеих сложностях (то есть достижения  категории 'Общее')") 
	Add("UPU_MENU_COMPOSED_ACH",		"Составные достижения")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Отображать составные достижения, которые можно получить, выполняя прохождение на скорость, без смерти, в усложненном режиме)") 
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Мгновенно обновлять список достижений")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Обновлять список оставшихся достижений подземелья в чат, после выполнения какого-либо достижения этого подземелья") 
	Add("UPU_MENU_CMDS",				"Список команд")
	Add("UPU_MENU_CMD_DESCRIPTION",
			"|cFFD300/upupledges|r или |cFFD300/pledges|r отображает сегодняшние ежедневные Обеты. Чтобы узнать какие Обеты будут в будущем, добавьте значение, на какой день после сегодняшнего Вы интересуетесь."..
					"\nНапример /pledges 1 на завтра /pledges 5 через 5 дней. Максимальное значение - 30 дней"..
			"\n|cFFD300/pledges week|r or |cFFD300/upupledges week|r: get pledges for the week".. --TO TRANSLATE
			"\n|cFFD300/day|r или |cFFD300/upuday|r Узнать дату Обета интересующего Вас подземелья. Вводить необходимо сокращенными названиям. Например /upuday rom отобразит следующий Обет для Руин Маззатуна"..
			"\n|cFFD300/whereis|r or |cFFD300/upuwhereis|r: get the info about the location of a dungeon giving its acronym".. --TO TRANSLATE
			"\n|cFFD300/dayhelp|r или |cFFD300/upudayhelp|r Отобразить список сокращений для подземелий")

	--Chat
	Add("UPU_PLEDGE",            		"ОБЕТ")
	Add("UPU_UNDAUNTED_DAILY_CATEGORY", "НЕУСТРАШИМЫХ")
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
	Add("UPU_GOLD",						" золотых")
	Add("UPU_NEW_DAILIES",				"Доступны новые обеты Неустрашимых!")
	Add("UPU_MAJ",						"Мадж")
	Add("UPU_GLIRION",					"Глирион")
	Add("UPU_URGARLAG",					"Ургарлаг")
	Add("UPU_BUTTON_TT",				"<Список обетов в чат>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Отобразить обеты неустрашимых")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Узнать дату Обета подземелья по сокращенному названию")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Получить список сокращений названий подземелий") 
	Add("UPU_NEXT_DAY_FOR",				"Следующая возможность выполнить Обет для ") 
    Add("UPU_STORE",                    "магазин")
	Add("UPU_WHERE_IS_A",				"The dungeon") --TO TRANSLATE
	Add("UPU_WHERE_IS_B",				"is located in") --TO TRANSLATE
	Add("UPU_WHERE_IS_CMD_DESCRIPTION",	"Get the location of a dungeon giving its acronym") --TO TRANSLATE

	--achievements
	Add("UPU_NO_MISSING_ACH",			"Нет невыполненных достижений для ") 
	Add("UPU_MISSING_ACH",				"Невыполненные достижения ") 
	Add("UPU_MIDDLE_CLICK",				"Щелчок средней кнопкой мыши, для отображения в журнале достижений")
    Add("UPU_GENERAL_ACH",				"General ") --TO TRANSLATE
	Add("UPU_VETERAN_ACH",				"Veteran") --TO TRANSLATE
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 ВЫПОЛНЕНО!|r") 
	Add("UPU_COMMON_ACH",				"Недостающие общие достижения: ") 
	Add("UPU_COMPOSED_ACH",				"Недостающие составные достижения: ") 
	Add("UPU_ACH_TRACKER",				"Достижения") 
	Add("UPU_ACH_ENABLE",				"Отобразить пропущенные") 
	Add("UPU_ACH_ENABLE_TT",			"Отображать информацию о пропущенных достижениях в чат при входе в подземелье")
	Add("UPU_DAY",				        "день")
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Отказаться от обета") 
	Add("UPU_POST_TO_CHAT",				"Отправить в чат")	
	Add("UPU_PLEDGES_ABANDONED",		"Отказаться от всех обетов") 
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Задана не правильная дата") 
	Add("UPU_WRONG_ACRONYM",			"Неправильное сокращение! Введите в чат /upudayhelp чтобы увидить список сокращений названий подземелий") 
	
	--pledges prefix
	Add("UPU_PLEDGE_PREFIX",			"Обет: ")
end
