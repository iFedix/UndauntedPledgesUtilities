--------------------------------------------------------
-- French localization for UndauntedPledgesUtilities  --
--------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"Cet Addon peut contenir des traces de noix!")
	Add("UPU_MENU_AUTO_ABANDON",		"Auto Abandon")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Abandonne silencieusement tous les serments indomptables NON COMPLÉTÉS")	
	Add("UPU_MENU_CHEST_HELPER",		"Assistant Coffre")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Affiche la liste des différents Sets du coffre.")
	Add("UPU_MENU_GENERAL",				"GENERAL")
	Add("UPU_MENU_DAILIES",				"QUOTIs")
	Add("UPU_MENU_COLOR",				"Couleur principale")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Affiche les Quotis")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Affiche ou non les quotis au démarrage")
	Add("UPU_MENU_QUICK_DIALOGS",		"Dialogues Rapide")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Accepte et rend automatiquement les quêtes dans les dialogues")
	Add("UPU_MENU_SHOW_LOOT",			"Affiche les casques")
	Add("UPU_MENU_SHOW_LOOT_TT",		"Affiche les casques trouvé en faisant les Quotis.")
	Add("UPU_MENU_DAILY_DELVE",			"Daily Delve") --TO TRANSLATE
	Add("UPU_MENU_DAILY_DELVE_TT",		"Shows the daily delve quest in Undaunted Dailies category (default: Guild category)") --TO TRANSLATE
	Add("UPU_MENU_COMMON_ACH",			"Common Achievements") --TO TRANSLATE
	Add("UPU_MENU_COMMON_ACH_TT",		"Include common achievements to all the dungeons on both difficulties (i.e. the achievements in dungeons general category)") --TO TRANSLATE
	Add("UPU_MENU_COMPOSED_ACH",		"Composed Achievements") --TO TRANSLATE
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Include achievements gainable by doing different tasks in different dungeons (e.g. Complete All Speed Challenges achiev or Vanquisher of the Covenant achiev)") --TO TRANSLATE
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Show on Achiev Awarded") --TO TRANSLATE
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Show remaining achievements on achievement awarded") --TO TRANSLATE
	
	--Chat
	Add("UPU_PLEDGE",            		"SERMENT")
	Add("UPU_UNDAUNTED_DAILY_CATEGORY",	"Serments Indomptables")
	Add("UPU_UNDAUNTED_DAILES", 		"Quêtes journalière des Indomptables")
	Add("UPU_FROM_MAJ",         		"Serment de Maj: ")
	Add("UPU_FROM_GLIRION",      		"Serment de Glirion: ")
	Add("UPU_FROM_URGARLAG",     		"Serment de Urgarlag (DLC): ")
	Add("UPU_QUEST_COMPLETE_1",  		"Retournez")
	Add("UPU_QUEST_COMPLETE_2", 		"Parlez")
	Add("UPU_ABANDONNED",       		"abandonnée")
	Add("UPU_TELEPORT",					"Téléporter dans l'instance")
	Add("UPU_TELEPORT_TO",		 		"Téléportation vers <<1>>")
	Add("UPU_TELEPORT_ALERT",	 		"Votre groupe n'est |ccc0a00PAS en mode VETERAN|r !")
	Add("UPU_TELEPORT_ANYWAY",	 		"Téléporter quand même")
	Add("UPU_TELEPORTING_TO",			"Vous téléporter vers ")
	Add("UPU_HAS_COST_YOU",				" vous a coùté ")
	Add("UPU_GOLD",						" po.")
	Add("UPU_REWARD_CHEST",				"Coffre de récompense")	
	Add("UPU_NEW_DAILIES",				"De nouveaux Serments Indomptables sont disponibles !")
	Add("UPU_MAY_CONTAIN",				"Peut contenir :")
	Add("UPU_CHEST_MAJ",				"Engeance de Méphala, Engeance de Sang, Gardien Moteur, Gueule de l'Infernal, Kra'gh, Malubeth le Faucheur, Mère de la Nuée, Nocteflamme, Rampefange, Ronce Étouffeuse, Sentinelle de Rkugamz, Taillombre.") 
	Add("UPU_CHEST_GLIRION",			"Cœeur-de-Glace, Gardien Infernal, Sélène, Grothdarr, Ilambris, Nerien'eth, Pirate Squelettique, Poigne Tempête, Roi des Trolls, Sellistrix, Tremblécaille, Valkyn Skoria.") 
	Add("UPU_CHEST_URGARLAG",			"Domihaus, Gros Chudan, Molag Kena, Seigneur Gardien, Sangreterre, Thurvokun, Velidreth, Zaan, Vykosa, Balorgh, Symphony of Blades, Stonekeeper.") --TO TRANSLATE
	Add("UPU_MAJ",						"Maj")
	Add("UPU_GLIRION",					"Glirion")
	Add("UPU_URGARLAG",					"Urgarlag")
	Add("UPU_BUTTON_TT",				"<Click pour linker les quoti dans le chat.>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Montrer les Serments Indomptables")
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
	localizedDailyUndauntedDelves = {"Protection des ancêtres à Deshaan","Anciens armements de Bangkoraï","Babioles ayléides au bois de Graht","Justice culinaire à Prasin","Babioles maudites d'Havre-tempête",
									 "Les ténèbres éclatent à Fendretour","Reliques dwemers des Éboulis","Donnant, donnant à Fangeombre","Intrigue glacée en Estemarche","Brasiers enflammés de la Brèche","Vol de mascotte à la Marche de la camarde",
									 "Perles fondues du désert d'Alik'r","Sac des Freux écarlates en Glénumbrie","Le piège aux esprits de Malabal Tor","Ténèbres voilées à Auridias"}
	
	--Dailies (some quest have a different name than the regular dungeon name)
	localizedPledges={
		["UPU_PLEDGE_01"] ={
			Regular = "Arx Corinium",
			Quest = "Serment : Arx Corinium",
			Node = 192,
		},
		["UPU_PLEDGE_02"] ={
			Regular = "Le Cachot Interdit I",
			Quest = "Serment : Cachot interdit I",
			Node = 194,
		},
		["UPU_PLEDGE_03"] ={
			Regular = "Le Cachot Interdit II",
			Quest = "Serment : Cachot interdit II",
			Node = 262,
		},
		["UPU_PLEDGE_04"] ={
			Regular = "Le Havre de Cœurnoir",
			Quest = "Serment : Havre de Cœurnoir",
			Node = 186,
		},
		["UPU_PLEDGE_05"] ={
			Regular = "Le Creuset Béni",
			Quest = "Serment : Creuset béni I",
			Node = 187,
		},
		["UPU_PLEDGE_06"] ={
			Regular = "La Cité des Cendres I",
			Quest = "Serment : Cité des cendres I",
			Node = 197,
		},
		["UPU_PLEDGE_07"] ={
			Regular = "La Cité des Cendres II",	
			Quest = "Serment : Cité des cendres II",
			Node = 268,
		},
		["UPU_PLEDGE_08"] ={
			Regular = "Le Berceau des Ombres",	
			Quest = "Serment : Berceau des ombres",
			Node = 261,
		},
		["UPU_PLEDGE_09"] ={
			Regular = "La Crypte des Cœurs I",	
			Quest = "Serment : Crypte des cœurs I",
			Node = 190,
		},
		["UPU_PLEDGE_10"] ={
			Regular = "La Crypte des Cœurs II",	
			Quest = "Serment : Crypte des cœurs II",
			Node = 269,
		},
		["UPU_PLEDGE_11"] ={
			Regular = "Les Cavernes d'Ombre-Noire I",
			Quest = "Serment : Cavernes d'Ombre-noire I",
			Node = 198,
		},
		["UPU_PLEDGE_12"] ={
			Regular = "Les Cavernes d'Ombre-Noire II",
			Quest = "Serment : Cavernes d'Ombre-noire II",
			Node = 264,
		},
		["UPU_PLEDGE_13"] ={
			Regular = "Le Donjon d'Affregivre",
			Quest = "Serment : Donjon d'Affregivre I",
			Node = 195,
		},
		["UPU_PLEDGE_14"] ={
			Regular = "Le Creuset des Aînés I",	
			Quest = "Serment : Creuset des aînés I",
			Node = 191,
		},
		["UPU_PLEDGE_15"] ={
			Regular = "Le Creuset des Aînés II",	
			Quest = "Serment : Creuset des aînés II",
			Node = 265,
		},
		["UPU_PLEDGE_16"] ={
			Regular = "La Champignonnière I",	
			Quest = "Serment : Champignonnière I",
			Node = 98,
		},
		["UPU_PLEDGE_17"] ={
			Regular = "La Champignonnière II",
			Quest = "Serment : Champignonnière II",
			Node = 266,
		},
		["UPU_PLEDGE_18"] ={
			Regular = "La Prison de la Cité Impériale",	
			Quest = "Serment : Prison de la cité impériale",
			Node = 236,
		},
		["UPU_PLEDGE_19"] ={
			Regular = "Les Ruines de Mazzatun",
			Quest = "Serment : Ruines de Mazzatun",
			Node = 260,
		},
		["UPU_PLEDGE_20"] ={
			Regular = "La Toile de Sélène",
			Quest = "Serment : Toile de Sélène",
			Node = 185,
		},
		["UPU_PLEDGE_21"] ={
			Regular = "Tressefuseau I",
			Quest = "Serment : Tressefuseau I",
			Node = 193,
		},
		["UPU_PLEDGE_22"] ={
			Regular = "Tressefuseau II",
			Quest = "Serment : Tressefuseau II",
			Node = 267,
		},
		["UPU_PLEDGE_23"] ={
			Regular = "L'Île des Tempêtes",
			Quest = "Serment : Île des Tempêtes",
			Node = 188,
		},
		["UPU_PLEDGE_24"] ={
			Regular = "Les Chambres de la Folie",	
			Quest = "Serment : Chambres de la folie",
			Node = 184,
		},
		["UPU_PLEDGE_25"] ={
			Regular = "Volenfell",
			Quest = "Serment : Volenfell",
			Node = 196,
		},
		["UPU_PLEDGE_26"] ={
			Regular = "Les Égouts d'Haltevoie I",
			Quest = "Serment : Égouts d'Haltevoie I",
			Node = 189,
		},
		["UPU_PLEDGE_27"] ={
			Regular = "Les Égouts d'Haltevoie II",
			Quest = "Serment : Égouts d'Haltevoie II",
			Node = 263,
		},
		["UPU_PLEDGE_28"] ={
			Regular = "La Tour d'Or-Blanc",
			Quest = "Serment : Tour d'or blanc",
			Node = 247,
		},
		["UPU_PLEDGE_29"] ={
			Regular = "La Forge de Sangracine",
			Quest = "Serment : Forge de Sangracine",
			Node = 326,
		},
		["UPU_PLEDGE_30"] ={
			Regular = "La Forteresse d'Épervine",
			Quest = "Serment : Forteresse d'Épervine",
			Node = 332,
		},
		["UPU_PLEDGE_31"] ={
			Regular = "Le Repaire du croc",
			Quest = "Serment : Repaire du croc",
			Node = 341,
		},
		["UPU_PLEDGE_32"] ={
			Regular = "Le Pic de la Mandécailles",
			Quest = "Serment : Pic de la Mandécailles",
			Node = 363,
		},
		--TO TRANSLATE
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
