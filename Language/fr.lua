------------------------------------------------------------------------------------------
-- French localization for UndauntedPledgesUtilities								    --
------------------------------------------------------------------------------------------

do
   local Add = ZO_CreateStringId

    --Settings
	Add("UPU_MENU_DESCRIPTION",			"Cet addon peut contenir des traces de noix!\nLocalisation française: @SirRemi")
	Add("UPU_MENU_AUTO_ABANDON",		"Auto Abandon")	
	Add("UPU_MENU_AUTO_ABANDON_TT",		"Abandonne silencieusement tous les serments indomptables NON COMPLÉTÉS")	
	Add("UPU_MENU_CHEST_HELPER",		"Assistant Coffre")	
	Add("UPU_MENU_CHEST_HELPER_TT",		"Affiche la liste des différents Sets du coffre")
	Add("UPU_MENU_GENERAL",				"GENERAL")
	Add("UPU_MENU_DAILIES",				"Quêtes journalières")
	Add("UPU_MENU_COLOR",				"Couleur principale")
	Add("UPU_MENU_DISPLAY_DAILIES",		"Affiche les Quêtes journalières")
	Add("UPU_MENU_DISPLAY_DAILIES_TT",	"Affiche ou non les quêtes journalières au démarrage")
	Add("UPU_MENU_QUICK_DIALOGS",		"Dialogues Rapide")
	Add("UPU_MENU_QUICK_DIALOGS_TT",	"Accepte et rend automatiquement les quêtes dans les dialogues")
	Add("UPU_MENU_SHOW_LOOT",			"Affiche les casques")
	Add("UPU_MENU_SHOW_LOOT_TT",		"Affiche les casques obtenus lors de quêtes journalières")
	Add("UPU_MENU_SHOW_LOOT_INFO",		"Show collected helmets info")
	Add("UPU_MENU_SHOW_LOOT_INFO_TT",	"Displays the info about the collection of the helmets (L=Light, M=Medium, H=Heavy - Green=collected, Red=Not collected)") --TO TRANSLATE
    Add("UPU_DUNGEON_QUEST_INFO",		"Affiche les informations sur l'achèvement de la quête")
	Add("UPU_DUNGEON_QUEST_INFO_TT",    "Affiche les informations sur l'achèvement de la quête du donjon (utile pour voir si vous pouvez toujours y obtenir le point de compétence)")
	Add("UPU_MENU_COMMON_ACH",			"Succès communs")
	Add("UPU_MENU_COMMON_ACH_TT",		"Inclure les succès pour les donjons de toutes difficultés (c.à.d les succès de donjons dans l'onglet de succès Général)")
	Add("UPU_MENU_COMPOSED_ACH",		"Succès composés")
	Add("UPU_MENU_COMPOSED_ACH_TT",		"Inclure les succès obtenus via différentes tâches dans un donjon (exemple: Succès Conquérant du Creuset Béni)")
	Add("UPU_MENU_SHOW_ACH_ON_AW",		"Afficher les succès obtenus")
	Add("UPU_MENU_SHOW_ACH_ON_AW_TT",	"Afficher les succès restant à obtenir")
	Add("UPU_MENU_CMDS",				"INFORMATION SUR LES COMMANDES") 
	Add("UPU_MENU_CMD_DESCRIPTION",
			"|cFFD300/upupledges|r ou |cFFD300/pledges|r: poste les serments du jour. Utilisation:"..
					"\n/pledges x:  obtenir les serments du x ieme jour en partant d’aujourd’hui (e.g.: /pledges -1 pour les serments d’hier, /pledges 1 pour les serments de demain, /pledges 5 pour les serments dans 5 jours, etc). Note: fonctionne pour un max de 30 jours."..
			"\n|cFFD300/pledges week|r ou |cFFD300/upupledges week|r: obtenir les serments de la semaine"..
			"\n|cFFD300/day|r ou |cFFD300/upuday|r: obtenir le prochain jour d’apparition d’un donjon en serment via son acronyme (e.g.: /upuday rom pour obtenir le prochain jour pour les Ruines de Mazzatun)."..
			"\n|cFFD300/whereis|r or |cFFD300/upuwhereis|r: get the info about the location of a dungeon giving its acronym".. --TO TRANSLATE
			"\n|cFFD300/dayhelp|r ou |cFFD300/upudayhelp|r: obtenir la liste des acronymes utilisés par /upuday et /upuwhereis")
	
	--Chat
	Add("UPU_PLEDGE",            		"SERMENT")
	Add("UPU_UNDAUNTED_DAILY_CATEGORY",	"Serments des Indomptables")
	Add("UPU_UNDAUNTED_DAILES", 		"Quêtes journalières des Indomptables")
	Add("UPU_FROM_MAJ",         		"Serment de Maj: ")
	Add("UPU_FROM_GLIRION",      		"Serment de Glirion: ")
	Add("UPU_FROM_URGARLAG",     		"Serment de Urgarlag (DLC): ")
	Add("UPU_QUEST_COMPLETE_1",  		"Retournez")
	Add("UPU_QUEST_COMPLETE_2", 		"Parlez")
	Add("UPU_ABANDONNED",       		"Abandonnée")
	Add("UPU_TELEPORT",					"Téléporter dans l'instance")
	Add("UPU_TELEPORT_TO",		 		"Téléportation vers <<1>>")
	Add("UPU_TELEPORT_ALERT",	 		"Votre groupe n'est |ccc0a00PAS en mode VETERAN|r!")
	Add("UPU_TELEPORT_ANYWAY",	 		"Téléporter quand même")
	Add("UPU_TELEPORTING_TO",			"Vous téléporter vers ")
	Add("UPU_HAS_COST_YOU",				" vous a coûté ")
	Add("UPU_GOLD",						" po")
	Add("UPU_NEW_DAILIES",				"De nouveaux Serments des Indomptables sont disponibles!")
	Add("UPU_MAJ",						"Maj")
	Add("UPU_GLIRION",					"Glirion")
	Add("UPU_URGARLAG",					"Urgarlag")
	Add("UPU_BUTTON_TT",				"<Clique pour créer un lien des quêtes quotidiennes>")
	
	--commands
	Add("UPU_PLEDGE_CMD_DESCRIPTION",	"Montrer les Serments Indomptables")
	Add("UPU_GET_DAY_CMD_DESCRIPTION",	"Obtenir le prochain jour de Serment via l'acronyme du donjon")
	Add("UPU_GET_ACR_CMD_DESCRIPTION",	"Obtenir la liste des acronymes de donjons")
	Add("UPU_NEXT_DAY_FOR",				"Prochain serment le ")
    Add("UPU_STORE",                    "Magasin")
	Add("UPU_WHERE_IS_A",				"The dungeon") --TO TRANSLATE
	Add("UPU_WHERE_IS_B",				"is located in") --TO TRANSLATE
	Add("UPU_WHERE_IS_CMD_DESCRIPTION",	"Get the location of a dungeon giving its acronym") --TO TRANSLATE

	--achievements
	Add("UPU_NO_MISSING_ACH",			"Pas de succès manquants pour ")
	Add("UPU_MISSING_ACH",				"Succès manquants ")
	Add("UPU_MIDDLE_CLICK",				"Clic molette sur lien pour l'afficher dans l'onglet Succès")
	Add("UPU_GENERAL_ACH",				"Général")
	Add("UPU_VETERAN_ACH",				"Vétéran")
	Add("UPU_ACH_AWARDED",				"|cF0F0F0 OBTNEU!|r")
	Add("UPU_COMMON_ACH",				"Succès communs manquant: ")
	Add("UPU_COMPOSED_ACH",				"Succès composés manquant: ")
	Add("UPU_ACH_TRACKER",				"Succès")
	Add("UPU_ACH_ENABLE",				"Activer")
	Add("UPU_ACH_ENABLE_TT",			"Activer infos sur succès manquant à l'entrée d'un donjon")
	Add("UPU_DAY",				        "Jour")

	--keybinds
	Add("UPU_ABANDON_PLEDGES",			"Abandonner les Serments")
	Add("UPU_POST_TO_CHAT",				"Poster dans le chat")
	Add("UPU_PLEDGES_ABANDONED",		"Serments INCOMPLETS déjà abandonnés")
	
	--errors
	Add("UPU_WRONG_OFFSET",				"Mauvais offset")
	Add("UPU_WRONG_ACRONYM",			"Mauvais acronyme! Tape /upudayhelp ou /dayhelp pour la liste des acronymes de donjons")
	
	--pledges prefix
	Add("UPU_PLEDGE_PREFIX",			"Serment : ")
end
