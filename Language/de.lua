------------------------------------------------------------------------------------------
-- German localization for UndauntedPledgesUtilities (Translated by @wishna, thanks!)  	--
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
	Add("UPU_MENU_DAILY_DELVE",			"Tägliches Gewölbe")
	Add("UPU_MENU_DAILY_DELVE_TT",		"Zeigt die tägliche Gewölbe-Quest in der Kategorie Tägliche Unerschrockenen Gelöbnisse an (Standard: Kategorie Gilden)")
	Add("UPU_MENU_COMMON_ACH",			"Allgemeine Errungenschaften")
	Add("UPU_MENU_COMMON_ACH_TT",		"Füge allgemeine Errungenschaften allen Verliesen auf beiden Schwierigkeitsstufen hinzu (z.B. die Errungenschaften in der Verlies-Kategorie Allgemein)")
	Add("UPU_MENU_COMPOSED_ACH",		"Zusammengesetzte Errungenschaften")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Füge Errungenschaften hinzu, die das Abschließen mehrerer anderer Errungenschaften erfordern (z.B. die Errungenschaft Bewältigt alle Assassinen-Herausforderungen oder Sieger des Bündnisses)")
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Beim Abschließen von Err. anzeigen")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Zeige übrige Errungenschaften beim Abschließen einer Errungenschaft an.")
	Add("UPU_MENU_CMDS",				"BEFEHLSINFO") 
	Add("UPU_MENU_CMD_DESCRIPTION",		"|cFFD300/pledges|r: Gelöbnisse im Chat ausgeben. Benutzung:\n/pledges x: Zeige die Gelöbnisse von Tag x, startend ab dem heutigen Tag (z.B..: /pledges -1 für die gestrigen Gelöbnisse, /pledges 1 für die morgigen, /pledges 5 für die Gelöbnisse in 5 Tagen). Hinweis: auf max. 30 Tage begrenzt\n/pledges week: Zeige alle Gelöbnisse für die Woche an\n|cFFD300/upuday|r: Zeige den nächsten Tag für ein bestimmtes Verlies an. Zu verwenden mit einem Akronym (z.B.: /upuday rom gibt den nächsten Gelöbnis-Tag für die Ruinen von Mazzatun aus)\n|cFFD300/upudayhelp|r: Zeige eine Liste der mit /upuday verwendbaren Akronyme an")

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
	Add("UPU_TELEPORT_ALERT",		 	"Deine Gruppe ist |ccc0a00NICHT IM VETERANEN|r Modus !")
	Add("UPU_TELEPORT_ANYWAY",	 		"trotzdem reisen")
	Add("UPU_TELEPORTING_TO",			"Die Reise zur Instanz  ")
	Add("UPU_HAS_COST_YOU",				" hat dich ")
	Add("UPU_GOLD",						" Gold gekostet.")
	Add("UPU_REWARD_CHEST",				"Reward Chest")------------------------------------------------------------------
	Add("UPU_NEW_DAILIES",				"Neue Unerschrockenen-Gelöbnisse sind vorhanden !")
	Add("UPU_MAY_CONTAIN",				"Kann enthalten : ")
	Add("UPU_CHEST_MAJ",				"Blutbrut, Würgedorn, Schattenriss, Maschinenwächter, Kra'gh, Schlund des Infernalen, Nachtflamme, Geißelernter, Wachposten von Rkugamz, Schleimkropf, Mephalas Brut, Schwarmmutter.") 
	Add("UPU_CHEST_GLIRION",			"Grothdarr, Eisherz, Ilambris, Infernaler Wächter, Sellistrix, Nerien'eth, Piratenskelett, Selene, Sturmfaust, Bebenschuppe, Trollkönig, Valkyn Skoria.") 
	Add("UPU_CHEST_URGARLAG",			"Domihaus, Erdbluter, Hochwächter, Mächtiger Chudan, Molag Kena, Thurvokun, Velidreth, Zaan, Vykosa, Balorgh, Sinfonie der Klingen, Steinwahrer.") 	
	Add("UPU_MAJ",						"Maj")
	Add("UPU_GLIRION",					"Glirion")
	Add("UPU_URGARLAG",					"Urgarlag")
	Add("UPU_BUTTON_TT",				"<Hier klicken, um die Gelöbnisse im Chat zu verlinken>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Zeigt die Unerschrockenen-Gelöbnisse")
	Add("UPU_TEST_CMD_DESCRIPTION",		"Gib die Verlies-Knoten aus (nur im Debug Modus)")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Gib nächsten Gelöbnis-Tag aus, basierend auf einem Verlies Akronym")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Gib eine Liste der Verlies Akronyme aus")
	Add("UPU_NEXT_DAY_FOR",				"Nächster Gelöbnistag für ")
	
	--achievements
	Add("UPU_NO_MISSING_ACH",			"Keine fehlenden Errungenschaften für ")
	Add("UPU_MISSING_ACH",				"Fehlende Errungenschaften ")
	Add("UPU_MIDDLE_CLICK",				"Mit der mittleren Maustaste auf einen Link klicken, um die Errungenschaft anzuzeigen.")
	Add("UPU_NORMAL_MODE",				"Normaler Modus")
	Add("UPU_VETERAN_MODE",				"Veteranen Modus")
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 ABGESCHLOSSEN!|r")
	Add("UPU_COMMON_ACH",				"Fehlende allgemeine Errungenschaften: ")
	Add("UPU_COMPOSED_ACH",				"Fehlende zusammengesetzte Errungenschaften: ")
	Add("UPU_ACH_TRACKER",				"Errungenschaften")
	Add("UPU_ACH_ENABLE",				"Aktivieren")
	Add("UPU_ACH_ENABLE_TT",			"Aktiviere Info zu fehlenden Errungenschaften im Chat beim Betreten eines Verlieses")
	
	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Gelöbnisse aufgeben")
	Add("UPU_POST_TO_CHAT",				"In den Chat ausgeben")
	Add("UPU_PLEDGES_ABANDONED",		"Alle Gelöbnis-Quests wurden aufgegeben")
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Falscher Versatz (offset)")
	Add("UPU_WRONG_ACRONYM",			"Falsches Akronym! Gib /upudayhelp ein, um eine Liste der Verlies Akronyme zu sehen")
	
	--undaunted daily delves
	localizedDailyUndauntedDelves = {"Ahnenschutzzauber in Deshaan","Alte Rüstungen aus Bangkorai","Ayleïdenschnickschnack in Grahtwald","Kulinarische Gerechtigkeit in Grünschatten","Sturmhafens verfluchter Tand",
									 "Dunkle Blüte in Kluftspitze","Dwemerrelikte aus Steinfälle","Geben und Nehmen in Schattenfenn","Eisige Intrige in Ostmarsch","Die brennenden Feuer von Rift","Maskottchendieb von Schnittermark",
									 "Geschmolzene Perlen der Alik'r-Wüste","Rotkrähen-Plünderung in Glenumbra","Die Geisterfalle in Malabal Tor","Verschleierte Finsternis in Auridon"}
	
	--Dailies
	--NOTE: pls translate quest names with the perfect german translated quests, I need to match them in the code with the specific german translated quest string.
	--Infact, there are odd cases where some quest have a different name than the regular dungeon name. For example in english: Darkshade Caverns II but the quest is Pledge: Darkshade II... 
	localizedPledges={
		["UPU_PLEDGE_01"] ={
			Regular = "Arx Corinium",
			Quest = "Pledge: Arx Corinium",
			Node = 192,
		},
		["UPU_PLEDGE_02"] ={
			Regular = "Verbannungszellen I",
			Quest = "Gelöbnis: Verbannungszellen I", -- wishna: confirmed
			Node = 194,
		},
		["UPU_PLEDGE_03"] ={
			Regular = "Verbannungszellen II",
			Quest = "Gelöbnis: Verbannungszellen II",
			Node = 262,
		},
		["UPU_PLEDGE_04"] ={
			Regular = "Schwarzherz-Unterschlupf",
			Quest = "Gelöbnis: Schwarzherz-Unterschlupf",
			Node = 186,
		},
		["UPU_PLEDGE_05"] ={
			Regular = "Gesegnete Feuerprobe",
			Quest = "Gelöbnis: Gesegnete Feuerprobe",
			Node = 187,
		},
		["UPU_PLEDGE_06"] ={
			Regular = "Stadt der Asche I",
			Quest = "Gelöbnis: Stadt der Asche I",
			Node = 197,
		},
		["UPU_PLEDGE_07"] ={
			Regular = "Stadt der Asche II",	
			Quest = "Gelöbnis: Stadt der Asche II",
			Node = 268,
		},
		["UPU_PLEDGE_08"] ={
			Regular = "Wiege der Schatten",	
			Quest = "Gelöbnis: Wiege der Schatten",
			Node = 261,
		},
		["UPU_PLEDGE_09"] ={
			Regular = "Krypta der Herzen I",	
			Quest = "Gelöbnis: Krypta der Herzen I",
			Node = 190,
		},
		["UPU_PLEDGE_10"] ={
			Regular = "Krypta der Herzen II",	
			Quest = "Gelöbnis: Krypta der Herzen II",
			Node = 269,
		},
		["UPU_PLEDGE_11"] ={
			Regular = "Dunkelschattenkavernen I",
			Quest = "Gelöbnis: Dunkelschattenkavernen I",
			Node = 198,
		},
		["UPU_PLEDGE_12"] ={
			Regular = "Dunkelschattenkavernen II",
			Quest = "Gelöbnis: Dunkelschattenkavernen II",
			Node = 264,
		},
		["UPU_PLEDGE_13"] ={
			Regular = "Burg Grauenfrost",
			Quest = "Gelöbnis: Burg Grauenfrost",
			Node = 195,
		},
		["UPU_PLEDGE_14"] ={
			Regular = "Eldengrund I",	
			Quest = "Gelöbnis: Eldengrund I",
			Node = 191,
		},
		["UPU_PLEDGE_15"] ={
			Regular = "Eldengrund II",	
			Quest = "Gelöbnis: Eldengrund II",
			Node = 265,
		},
		["UPU_PLEDGE_16"] ={
			Regular = "Pilzgrotte I",	
			Quest = "Gelöbnis: Pilzgrotte I",
			Node = 98,
		},
		["UPU_PLEDGE_17"] ={
			Regular = "Pilzgrotte II",
			Quest = "Gelöbnis: Pilzgrotte II",
			Node = 266,
		},
		["UPU_PLEDGE_18"] ={
			Regular = "Gefängnis der Kaiserstadt",	
			Quest = "Gelöbnis: Gefängnis der Kaiserstad",
			Node = 236,
		},
		["UPU_PLEDGE_19"] ={
			Regular = "Die Ruinen von Mazzatun",
			Quest = "Gelöbnis: Die Ruinen von Mazzatun",
			Node = 260,
		},
		["UPU_PLEDGE_20"] ={
			Regular = "Selenes Netz",
			Quest = "Gelöbnis: Selenes Netz",
			Node = 185,
		},
		["UPU_PLEDGE_21"] ={
			Regular = "Spindeltiefen I",
			Quest = "Gelöbnis: Spindeltiefen I",
			Node = 193,
		},
		["UPU_PLEDGE_22"] ={
			Regular = "Spindeltiefen II",
			Quest = "Gelöbnis: Spindeltiefen II",
			Node = 267,
		},
		["UPU_PLEDGE_23"] ={
			Regular = "Orkaninsel",
			Quest = "Gelöbnis: Orkaninsel",
			Node = 188,
		},
		["UPU_PLEDGE_24"] ={
			Regular = "Kammern des Wahnsinns",	
			Quest = "Gelöbnis: Kammern des Wahnsinns", -- wishna: confirmed
			Node = 184,
		},
		["UPU_PLEDGE_25"] ={
			Regular = "Volenfell",
			Quest = "Gelöbnis: Volenfell",
			Node = 196,
		},
		["UPU_PLEDGE_26"] ={
			Regular = "Kanalisation von Wegesruh I",
			Quest = "Gelöbnis: Kanalisation von Wegesruh I",
			Node = 189,
		},
		["UPU_PLEDGE_27"] ={
			Regular = "Kanalisation von Wegesruh II",
			Quest = "Gelöbnis: Kanalisation von Wegesruh II",
			Node = 263,
		},
		["UPU_PLEDGE_28"] ={
			Regular = "Weißgoldturm",
			Quest = "Gelöbnis: Weißgoldturm",
			Node = 247,
		},
		["UPU_PLEDGE_29"] ={
			Regular = "Blutquellschmiede",
			Quest = "Gelöbnis: Blutquellschmiede",
			Node = 326,
		},
		["UPU_PLEDGE_30"] ={
			Regular = "Falkenring",
			Quest = "Gelöbnis: Falkenring",
			Node = 332,
		},
		["UPU_PLEDGE_31"] ={
			Regular = "Krallenhort",
			Quest = "Gelöbnis: Krallenhort",
			Node = 341,
		},
		["UPU_PLEDGE_32"] ={
			Regular = "Gipfel der Schuppenruferin",
			Quest = "Gelöbnis: Gipfel der Schuppenruferin",
			Node = 363,
		},
		["UPU_PLEDGE_33"] ={
			Regular = "Mondjägerfeste",
			Quest = "Gelöbnis: Mondjägerfeste",
			Node = 371,
		},
		["UPU_PLEDGE_34"] ={
			Regular = "Marsch der Aufopferung",
			Quest = "Gelöbnis: Marsch der Aufopferung",
			Node = 370,
		},
		["UPU_PLEDGE_35"] ={
			Regular = "Tiefen von Malatar",
			Quest = "Gelöbnis: Tiefen von Malatar", -- wishna: confirmed
			Node = 390,
		},
		["UPU_PLEDGE_36"] ={
			Regular = "Frostgewölbe",
			Quest = "Gelöbnis: Frostgewölbe",
			Node = 389,
		},
	}
end
