------------------------------------------------------------------------------------------
-- German localization for UndauntedPledgesUtilities 									--
------------------------------------------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"Dieses Addon könnte Nüssen enthalten!\nDeutsche Lokalisierung: @wishna")	
	Add("UPU_MENU_AUTO_ABANDON",		"Automatisch aufgeben")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Alle NICHT ABGESCHLOSSENEN Unterschrockenen-Gelöbnisse im Hintergrund aufgeben")
	Add("UPU_MENU_CHEST_HELPER",		"Kisten Helfer")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Zeigt die Liste möglicher Kisten-Sets an")
	Add("UPU_MENU_GENERAL",				"ALLGEMEIN")
	Add("UPU_MENU_DAILIES",				"TÄGLICHE QUESTS")
	Add("UPU_MENU_COLOR",				"Hauptfarbe")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Zeige tägliche Quests an")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Liste der täglichen Gelöbnisse beim Start anzeigen oder nicht")
	Add("UPU_MENU_QUICK_DIALOGS",		"Schnelle Dialoge")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Automatisches Annehmen und Abgeben der Gelöbnisse im NPC-Dialog")
	Add("UPU_MENU_SHOW_LOOT",			"Zeige Helme")
	Add("UPU_MENU_SHOW_LOOT_TT",		"Zeigt die zu erhaltenden Helme der Verliese an")
	Add("UPU_MENU_SHOW_LOOT_INFO",		"Show collected helmets info")
	Add("UPU_MENU_SHOW_LOOT_INFO_TT",	"Displays the info about the collection of the helmets (L=Light, M=Medium, H=Heavy - Green=collected, Red=Not collected)") --TO TRANSLATE
    Add("UPU_DUNGEON_QUEST_INFO",		"Quest Abschluss Info")
	Add("UPU_DUNGEON_QUEST_INFO_TT",    "Zeige Die Info für das Dungeon Verlies  Beendigung (hilfreich zu sehen wenn du einen Fähigkeitspunkt erhalten kannst)")
	Add("UPU_MENU_COMMON_ACH",			"Allgemeine Errungenschaften")
	Add("UPU_MENU_COMMON_ACH_TT",		"Füge allgemeine Errungenschaften allen Verliesen auf beiden Schwierigkeitsstufen hinzu (z.B. die Errungenschaften in der Verlies-Kategorie Allgemein)")
	Add("UPU_MENU_COMPOSED_ACH",		"Zusammengesetzte Errungenschaften")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Füge Errungenschaften hinzu, die das Abschließen mehrerer anderer Errungenschaften erfordern (z.B. die Errungenschaft Bewältigt alle Assassinen-Herausforderungen oder Sieger des Bündnisses)")
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Beim Abschließen von Err. anzeigen")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Zeige übrige Errungenschaften beim Abschließen einer Errungenschaft an")
	Add("UPU_MENU_CMDS",				"BEFEHLSINFO") 
	Add("UPU_MENU_CMD_DESCRIPTION",
			"|cFFD300/upupledges|r oder |cFFD300/pledges|r: Gelöbnisse im Chat ausgeben. Benutzung:"..
					"\n/pledges x: Zeige die Gelöbnisse von Tag x, startend ab dem heutigen Tag (z.B..: /pledges -1 für die gestrigen Gelöbnisse, /pledges 1 für die morgigen, /pledges 5 für die Gelöbnisse in 5 Tagen). Hinweis: auf max. 30 Tage begrenzt"..
			"\n|cFFD300/pledges week|r oder |cFFD300/upupledges week|r: Zeige alle Gelöbnisse für die Woche an"..
			"\n|cFFD300/day|r oder |cFFD300/upuday|r: Zeige den nächsten Tag für ein bestimmtes Verlies an. Zu verwenden mit einem Akronym (z.B.: /upuday rom gibt den nächsten Gelöbnis-Tag für die Ruinen von Mazzatun aus)"..
			"\n|cFFD300/whereis|r or |cFFD300/upuwhereis|r: get the info about the location of a dungeon giving its acronym".. --TO TRANSLATE
			"\n|cFFD300/dayhelp|r oder |cFFD300/upudayhelp|r: Zeige eine Liste der mit /upuday oder /upuwhereis verwendbaren Akronyme an")

	--Chat
	Add("UPU_PLEDGE",		       		"Gelöbnis")
	Add("UPU_UNDAUNTED_DAILY_CATEGORY", "Die Unerschrockenen")	-- wishna: this only means: The undaunted, I tested it and "Unerschrockenen Gelöbnisse" was cut and it didn't look good.
	Add("UPU_UNDAUNTED_DAILES",  		"Tägliche Gelöbnisse der Unerschrockenen")
	Add("UPU_FROM_MAJ",          		"Gelöbnis von Maj: ")
	Add("UPU_FROM_GLIRION",      		"Gelöbnis von Glirion: ")
	Add("UPU_FROM_URGARLAG",     		"Gelöbnis von Urgarlag (DLC): ")
	Add("UPU_QUEST_COMPLETE_1",  		"Kehrt zu") -- wishna: technically the string is something like "Kehrt zu Maj al-Ragath zurück"
	Add("UPU_QUEST_COMPLETE_2",  		"Sprecht mit")
	Add("UPU_ABANDONNED",        		"aufgegeben")
	Add("UPU_TELEPORT",			 		"Zur Instanz reisen")
	Add("UPU_TELEPORT_TO",		 		"Zu <<1>> reisen")
	Add("UPU_TELEPORT_ALERT",		 	"Deine Gruppe ist |ccc0a00NICHT IM VETERANEN|r Modus!")
	Add("UPU_TELEPORT_ANYWAY",	 		"Trotzdem reisen")
	Add("UPU_TELEPORTING_TO",			"Die Reise zur Instanz  ")
	Add("UPU_HAS_COST_YOU",				" hat dich ")
	Add("UPU_GOLD",						" Gold gekostet")
	Add("UPU_NEW_DAILIES",				"Neue Unerschrockenen-Gelöbnisse sind vorhanden!")
	Add("UPU_MAJ",						"Maj")
	Add("UPU_GLIRION",					"Glirion")
	Add("UPU_URGARLAG",					"Urgarlag")
	Add("UPU_BUTTON_TT",				"<Hier klicken, um die Gelöbnisse im Chat zu verlinken>")

	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Zeigt die Unerschrockenen-Gelöbnisse")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Gib nächsten Gelöbnis-Tag aus, basierend auf einem Verlies Akronym")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Gib eine Liste der Verlies Akronyme aus")
	Add("UPU_NEXT_DAY_FOR",				"Nächster Gelöbnistag für ")
    Add("UPU_STORE",                    "anzubieten")
	Add("UPU_WHERE_IS_A",				"The dungeon") --TO TRANSLATE
	Add("UPU_WHERE_IS_B",				"is located in") --TO TRANSLATE
	Add("UPU_WHERE_IS_CMD_DESCRIPTION",	"Get the location of a dungeon giving its acronym") --TO TRANSLATE

	--achievements
	Add("UPU_NO_MISSING_ACH",			"Keine fehlenden Errungenschaften für ")
	Add("UPU_MISSING_ACH",				"Fehlende Errungenschaften ")
	Add("UPU_MIDDLE_CLICK",				"Mit der mittleren Maustaste auf einen Link klicken, um die Errungenschaft anzuzeigen")
    Add("UPU_GENERAL_ACH",				"Allgemein ")
	Add("UPU_VETERAN_ACH",				"Veteranen")
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 ABGESCHLOSSEN!|r")
	Add("UPU_COMMON_ACH",				"Fehlende allgemeine Errungenschaften: ")
	Add("UPU_COMPOSED_ACH",				"Fehlende zusammengesetzte Errungenschaften: ")
	Add("UPU_ACH_TRACKER",				"Errungenschaften")
	Add("UPU_ACH_ENABLE",				"Aktivieren")
	Add("UPU_ACH_ENABLE_TT",			"Aktiviere Info zu fehlenden Errungenschaften im Chat beim Betreten eines Verlieses")
	Add("UPU_DAY",				        "Tag")
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Gelöbnisse aufgeben")
	Add("UPU_POST_TO_CHAT",				"In den Chat ausgeben")
	Add("UPU_PLEDGES_ABANDONED",		"Alle unvollständige Gelöbnis-Quests wurden aufgegeben")
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Falscher Versatz (offset)")
	Add("UPU_WRONG_ACRONYM",			"Falsches Akronym! Gib /upudayhelp oder /dayhelp ein, um eine Liste der Verlies Akronyme zu sehen")
	
	--pledges prefix
	Add("UPU_PLEDGE_PREFIX",			"") --in german, no prefix for pledges quests (why lol)
end
