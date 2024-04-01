----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities main file  	   				    																--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
UPU = UndauntedPledgesUtilities

UPU.AddonName        	= "UndauntedPledgesUtilities"
UPU.DisplayName			= "Undaunted Pledges Utilities"
UPU.AddonVersion    	= "2.5"
UPU.Author 				= "iFedix"
UPU.WebSite 		    = "https://www.esoui.com/downloads/info2267-UndauntedPledgesUtilities.html"
UPU.Donations 			= "https://www.esoui.com/downloads/info2267-UndauntedPledgesUtilities.html#donate"

UPU.defaults  = {-- default settings for saved variables

	--general
	bEnableStartMessage = false,
		
	MainTextColor		={
		r 				= 254, --256
		g 				= 254, --256
		b 				= 254,
		a 				= 255, --256
		hex 			= "FFFFFF",
	},

	--dailies
	bAdvertizeDailies = true,
	bDisplayLootLink = true,
	bDisplayLootLinkCollectionInfo = true,
	bDisplayQuestInfo = true,
	bAutoDelete    = false,
	bQuickDialog = true,
	 
	--achievements
	bEnableAch = true,
	bShowCommonAchievs = true,
	bShowComposedAchievs = true,
	bShowOnAchievAwarded = false,
	 
	bDebugMode = false,

}
UPU.sVars = {}

--pledge cycles: needs to be changed once a new dungeon dlc is released
UPU.MAJ_AND_GLIRION_CYCLE = 12
UPU.URGARLAG_CYCLE = 30

--Daily pledges data
UPU.DailyData = {}
--variable used for interaction with pledge givers
UPU.JustInteracted = false
UPU.AtStartup = true


---------------------------------------------------------------- PLEDGE GIVERS INTERACTION -------------------------------------------------------------------

--event : triggered when discussion begins (with item or npc)
--start of quick dialog functions
--Quest offering dialog has 3 prompts
--first one is dealt with slect chatter option in 'chatter begin"
--second one, is dealt with Accept offered quest in "pseudoConversationUpdated" (should be a select chatter option in a conversation updated event)
--Last one is dealt with a AcceptOfferedQuest in OnQuestOffered

function UPU.OnChatterBegin(eventCode, optionCount)

    if UPU.JustInteracted == true then UPU.JustInteracted=false EndInteraction(INTERACTION_CONVERSATION) end
	local optionString, _ = ZO_CachedStrFormat("<<C:1>>", GetChatterOption(1) )

	--only executes if "interact" is an undaunted quest giver
	local unitName = ZO_CachedStrFormat("<<C:1>>", GetRawUnitName('interact') )

	if string.upper(unitName)== string.upper(GetString(UPU_URGARLAG))
			or string.upper(unitName) == string.upper(GetString(UPU_GLIRION))
			or string.upper(unitName) == string.upper(GetString(UPU_MAJ)) then
        if string.find(optionString, GetString(UPU_STORE)) then return end --quest already taken
		if string.find(string.upper(optionString), string.upper(GetString(UPU_PLEDGE))) then
			--dialog is daily pledge offering
			EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_QUEST_OFFERED, UPU.PseudoOnConversationUpdated) -- event should be onconvupdated but strangely is quest offered
            SelectChatterOption(1)
		else
			--dialog is daily pledge return
			EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_CONVERSATION_UPDATED, UPU.OnConversationUpdated)
			SelectChatterOption(1)
		end
	end
end

-- event: should be conversation updated but is in fact quest_offered event
function UPU.PseudoOnConversationUpdated(eventCode)
	EVENT_MANAGER:UnregisterForEvent(UPU.AddonName, EVENT_QUEST_OFFERED)
	EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_QUEST_OFFERED, UPU.OnQuestOffered)
	AcceptOfferedQuest()

end

-- event: last line of dialog => accepts quest
function UPU.OnQuestOffered(eventCode)
	EVENT_MANAGER:UnregisterForEvent(UPU.AddonName, EVENT_QUEST_OFFERED)
	AcceptOfferedQuest()
    UPU.JustInteracted=true

end

-- event: last line of dialog before actually returning the quest
function UPU.OnConversationUpdated(eventCode, conversationBodyText, conversationOptionCount)
	EVENT_MANAGER:UnregisterForEvent(UPU.AddonName, EVENT_CONVERSATION_UPDATED)
	EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_QUEST_COMPLETE_DIALOG, UPU.OnQuestCompleteDialog)
	SelectChatterOption(1)
end

-- event: complete the quests and get the loots. (no error management if inventory is full)
function UPU.OnQuestCompleteDialog(eventCode)
	EVENT_MANAGER:UnregisterForEvent(UPU.AddonName, EVENT_QUEST_COMPLETE_DIALOG)
	CompleteQuest()
    UPU.JustInteracted=true
end

-- event: remove pledge quest
local function OnRemoveQuest(eventCode, isCompleted, journalIndex, questName, zoneIndex, poiIndex, questID)
    --if GetJournalQuestType(questIndex) == QUEST_TYPE_UNDAUNTED_PLEDGE then return true else return false end
	if UPU == nil or UPU.AbandonQuestEventName == nil then return false end
	--d("[OnRemoveQuest] isCompleted: " .. tostring(isCompleted) .. ", journalIndex: " .. tostring(journalIndex) .. ", questName: " .. tostring(questName) .. ", questID: " .. tostring(questID))

    if string.find(string.upper(questName), string.upper(GetString(UPU_PLEDGE))) then

        UPU.Msg2Chat(UPU.Colorize(questName.." "..GetString(UPU_ABANDONNED)))

        --If pledges quest got abandoned we need to go on with the next possible pledges quest
        if not isCompleted then
            --UnRegister event callback function to realize if quest gets abandoned
            EVENT_MANAGER:UnregisterForEvent(UPU.AbandonQuestEventName, EVENT_QUEST_REMOVED)
            zo_callLater(function() UPU.AbandonPledges() end, 200)
        end
    end
end


---------------------------------------------------------------- UNDAUNTED JOURNAL MENU MOD -------------------------------------------------------------------

--prehook for ZO_QuestJournalNavigationEntry_OnMouseUp
--adds multiple entries in the context menu for undaunted quests
function UPU.QuestContextMenu(label, button, upInside) --ZO_QuestJournalNavigationEntry_OnMouseUp(label, button, upInside)
    if(button == MOUSE_BUTTON_INDEX_RIGHT and upInside) then
		local node = label.node
        local questIndex = node.data.questIndex
        if UPU.IsPledge(questIndex) then
            ClearMenu()
			--add teleport option
			AddMenuItem(GetString(UPU_TELEPORT), function() UPU.Teleport(questIndex) end)
			--todo, add join queue

            AddMenuItem(GetString(SI_QUEST_JOURNAL_SHOW_ON_MAP), function() ZO_WorldMap_ShowQuestOnMap(questIndex) end)
            if GetIsQuestSharable(questIndex) and IsUnitGrouped("player") then
                AddMenuItem(GetString(SI_QUEST_JOURNAL_SHARE), function() QUEST_JOURNAL_MANAGER:ShareQuest(questIndex) end)
            end
            if(node.data.questType ~= QUEST_TYPE_MAIN_STORY) then
                AddMenuItem(GetString(SI_QUEST_JOURNAL_ABANDON), function() QUEST_JOURNAL_MANAGER:ConfirmAbandonQuest(questIndex) end)
            end

            AddMenuItem(GetString(SI_QUEST_JOURNAL_REPORT_QUEST), function()
																	HELP_CUSTOMER_SUPPORT_KEYBOARD:OpenScreen(HELP_CUSTOMER_SERVICE_ASK_FOR_HELP_KEYBOARD_FRAGMENT)
																	HELP_CUSTOMER_SERVICE_ASK_FOR_HELP_KEYBOARD:SetDetailsFromQuestName(node.data.name)
																end)

            ShowMenu(label)
			return true
        else
			return false
		end
	else
		return false
	end
end

--teleports player to quest node (defined in localisation file)
function UPU.Teleport(questIndex)
	--todo : auto teleport for free if group member already in the instance

	local originalQuestName = GetJournalQuestName(questIndex)

	local nodeID = 0
	local dungeonName = ""

	for _, pledgeGiverData in pairs(UPU.GetPledgesData()) do
		for _,indexData in pairs(pledgeGiverData) do
			local foundDungeonName=UPU.GetZoneName(indexData.ZoneID)
			if UPU.ComparePledgeQuestNames(originalQuestName, foundDungeonName) then
				nodeID=indexData.NodeID
				dungeonName=foundDungeonName
				break
			end
		end
	end

	if GetCurrentZoneDungeonDifficulty() == DUNGEON_DIFFICULTY_NORMAL then
		--warns player if group is not in vet mode
		ZO_Dialogs_ShowDialog("UPU_TELEPORT", {nodeID,dungeonName,}, {titleParams={dungeonName},}, false)
	else
		FastTravelToNode(nodeID)
		UPU.Msg2Chat(UPU.Colorize(GetString(UPU_TELEPORTING_TO)..dungeonName..GetString(UPU_HAS_COST_YOU), "WHITE")..UPU.Colorize(GetRecallCost(194), "RED")..UPU.Colorize(GetString(UPU_GOLD), "WHITE"))
	end

end

---------------------------------------------------------------- CORE -------------------------------------------------------------------

--get the day number corresponding to today pledges
function UPU.GetDaysSinceCycleStart()

	local daysElapsed, _ = UPU.GetDaysFromOriginTimestamp()

	local _, cycleFractionMG = math.modf(daysElapsed/UPU.MAJ_AND_GLIRION_CYCLE)
	local daysSinceCycleStartMajAndGlirion = UPU.Round(cycleFractionMG*UPU.MAJ_AND_GLIRION_CYCLE)

	local _, cycleFractionU = math.modf(daysElapsed/UPU.URGARLAG_CYCLE)
	local daysSinceCycleStartUrgarlag = UPU.Round(cycleFractionU*UPU.URGARLAG_CYCLE)

	return daysSinceCycleStartMajAndGlirion, daysSinceCycleStartUrgarlag
end

--function to build pledges data
function UPU.BuildDailyData(daysSinceCycleStartMajAndGlirion, daysSinceCycleStartUrgarlag)
	return {['Maj']=UPU.GetPledgesData()['Maj'][daysSinceCycleStartMajAndGlirion],
			['Glirion']=UPU.GetPledgesData()['Glirion'][daysSinceCycleStartMajAndGlirion],
			['Urgarlag']=UPU.GetPledgesData()['Urgarlag'][daysSinceCycleStartUrgarlag]}
end

--populates the dailies data
function UPU.PopulateDailies()
	UPU.DailyData = UPU.BuildDailyData(UPU.GetDaysSinceCycleStart())
	--UPU.PrintTable(TodaysData)

	--Data = UPU.BuildFullData()
	--UPU.PrintTable(Data)
end


--advertizes dailies in chat
function UPU.GetDailies(data)
	return UPU.Colorize(GetString(UPU_FROM_MAJ), "WHITE")..UPU.GetDaily(data['Maj']).."\n"..
			UPU.Colorize(GetString(UPU_FROM_GLIRION), "WHITE")..UPU.GetDaily(data['Glirion']).."\n"..
			UPU.Colorize(GetString(UPU_FROM_URGARLAG), "WHITE")..UPU.GetDaily(data['Urgarlag'])
end

--creates text for a specific daily based on options
function UPU.GetDaily(dataForPledgeGiver)

    local helmet=""
    local questInfo=""

	local dash = UPU.Colorize(" - ")

    if UPU.sVars.bDisplayLootLink then
		local helmets = dataForPledgeGiver.HelmetsItemIDS

        helmet=dash..UPU.BuildItemLink(helmets[math.random(#helmets)],369)

		if UPU.sVars.bDisplayLootLinkCollectionInfo then

			--ternary operator: x = a ? b : c -> x = a and b or c
			local collectedInfoForHelmets = (UPU.IsCollected(helmets[ARMORTYPE_LIGHT]) and UPU.Colorize("L","GREEN") or UPU.Colorize("L","RED"))..
					(UPU.IsCollected(helmets[ARMORTYPE_MEDIUM]) and UPU.Colorize("M","GREEN") or UPU.Colorize("M","RED"))..
					(UPU.IsCollected(helmets[ARMORTYPE_HEAVY]) and UPU.Colorize("H","GREEN") or UPU.Colorize("H","RED"))
			helmet=helmet..UPU.Colorize(" (")..collectedInfoForHelmets..UPU.Colorize(")")
		end
    end

    if UPU.sVars.bDisplayQuestInfo then
        if not (string.len(GetCompletedQuestInfo(dataForPledgeGiver.QuestID)) <= 1) then
			questInfo=dash.." |t14:14:UndauntedPledgesUtilities/Media/ok.dds|t"
		else
			questInfo=dash.." |t14:14:UndauntedPledgesUtilities/Media/no.dds|t"
		end
    end

	return "\n|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"..UPU.Colorize(UPU.GetZoneName(dataForPledgeGiver.ZoneID))..helmet..questInfo
end


---------------------------------------------------------------- ABANDON PLEDGES -------------------------------------------------------------------

--only way to know if a daily has been completed is to check in the text for "return to..." or "talk to..."
--since player might have completed dailies before installing the addon
function UPU.ManualCompletionCheck(questIndex)
	local _, _, _, _, activeStepTrackerOverrideText, _, _, _, _,_ = GetJournalQuestInfo(questIndex)
	if activeStepTrackerOverrideText == "" then return false end
	if string.find(activeStepTrackerOverrideText, GetString("UPU_QUEST_COMPLETE_1")) then
		return true
	elseif string.find(activeStepTrackerOverrideText, GetString("UPU_QUEST_COMPLETE_2")) then
		return true
	end
	return false
end

--check for questname in the dailies array
function UPU.IsTodaysQuest(questIndex)

	--useless tests below: there is no way right now to get the zoneID info starting from the journalQuestIndex,
	--local zoneName, objectiveName, zoneIndex, poiIndex = GetJournalQuestLocationInfo(questIndex)
	--UPU.Msg2Chat("LocationInfo: zoneName->".. zoneName.." objectiveName->"..objectiveName
	--		.." zoneIndex->" ..tostring(zoneIndex).." poiIndex->"..tostring(poiIndex))
	--UPU.Msg2Chat("GetJournalQuestZoneStoryZoneId: zoneId->".. tostring(GetJournalQuestZoneStoryZoneId(questIndex)))

	local originalQuestName = GetJournalQuestName(questIndex)
	for _, pledgeGiverData in pairs(UPU.DailyData) do
		if UPU.ComparePledgeQuestNames(originalQuestName, UPU.GetZoneName(pledgeGiverData.ZoneID)) then
			if UPU.sVars.bDebugMode then
				UPU.Msg2Chat(GetJournalQuestName(questIndex).." is pledge!")
			end
			return true
		end
	end
	if UPU.sVars.bDebugMode then
		UPU.Msg2Chat(GetJournalQuestName(questIndex).. " is NOT pledge!")
	end
	return false
end

--function to compare two questNames: the one stored in data and the one given by the eso function GetJournalQuestName(questIndex)
--it's a bit more complicated than I thought because in other languages some differences must be considered
function UPU.ComparePledgeQuestNames(originalQuestName, questNameFromData)

	local modOriginal = string.upper(string.sub(originalQuestName, string.len(GetString(UPU_PLEDGE_PREFIX))+1))
	local builtQuestName  = string.upper(questNameFromData)

	--to find a word in string and avoid issues with some characters the following solution is used:
	--https://stackoverflow.com/questions/32291353/lua-string-findx-a-b-c-gives-nil-value
	local firstCheck=false
	if string.find(modOriginal,builtQuestName, 1, true) then
		if UPU.CheckPledgeQuestNames(builtQuestName,modOriginal) then firstCheck=true end
	end

	local secondCheck=false
	if string.find(builtQuestName, modOriginal,1, true) then
		if UPU.CheckPledgeQuestNames(modOriginal,builtQuestName) then secondCheck=true end
	end

	if UPU.sVars.bDebugMode then
		UPU.Msg2Chat("ORIGINAL: "..originalQuestName.."/FROM_DATA: "..questNameFromData..
				" -> first check: "..tostring(firstCheck).." - second check: ".. tostring(secondCheck))
	end

	return secondCheck or firstCheck
end

--only abandon a quest if it's not complete AND not todays quest
--returns true if any quest has been abandonned
function UPU.DeleteNonCompletedDailies()
	local bAbandonned
	for questIndex = 1, MAX_JOURNAL_QUESTS do
		if UPU.IsPledge(questIndex) then
			if not UPU.IsTodaysQuest(questIndex) and not UPU.ManualCompletionCheck(questIndex) then
				bAbandonned = true
				UPU.Msg2Chat(UPU.Colorize(GetJournalQuestName(questIndex).." "..GetString(UPU_ABANDONNED)))
				AbandonQuest(questIndex)
			end
		end
	end
	return bAbandonned
end


---------------------------------------------------------------- COMMANDS -------------------------------------------------------------------

--get next pledges
function UPU.GetNextPledges(dayOffset, filterAcronym)
	if dayOffset== nil or dayOffset=="" then
		return UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES), "BLUE").."\n"..UPU.GetDailies(UPU.DailyData)
	elseif dayOffset=="week" then
		for i = 0,6,1 do UPU.Msg2Chat(UPU.GetNextPledges(i).."\n") end
		return " "
	elseif tonumber(dayOffset) == nil then
		return GetString(UPU_WRONG_OFFSET)
	elseif tonumber(dayOffset)>30 then
		return GetString(UPU_WRONG_OFFSET)
	else
		local daysSinceCycleStartMajAndGlirion, daysSinceCycleStartUrgarlag = UPU.GetDaysSinceCycleStart()
		local nextDaysData = UPU.BuildDailyData((daysSinceCycleStartMajAndGlirion+dayOffset)%UPU.MAJ_AND_GLIRION_CYCLE,
				(daysSinceCycleStartUrgarlag+dayOffset)%UPU.URGARLAG_CYCLE)
		local foundDay = os.date("%d-%m-%Y", os.time()+dayOffset*86400)

		--If this function is called from GetPledgeDay, only the info about the pledges in a specific day is needed
		if filterAcronym then
			return {date=foundDay, zoneIDS={nextDaysData['Maj'].ZoneID,nextDaysData['Glirion'].ZoneID,nextDaysData['Urgarlag'].ZoneID}}
		else
			return UPU.Colorize(GetString(UPU_DAY).." "..foundDay..":", "BLUE").."\n"..UPU.GetDailies(nextDaysData)
		end
	end
	return
end

--get pledge day
function UPU.GetPledgeDay(acronym)

	local zoneID = 0
	local offset = 0
	for _, pledgeGiverData in pairs(UPU.GetPledgesData()) do
		for _,indexData in pairs(pledgeGiverData) do
			if indexData.Acronym==acronym then zoneID=indexData.ZoneID end
		end
	end

	if zoneID == 0 then
		return GetString(UPU_WRONG_ACRONYM)
	else
		while true do
			local nextPledges = UPU.GetNextPledges(offset, true)
			if nextPledges.zoneIDS[1]==zoneID or nextPledges.zoneIDS[2]==zoneID or nextPledges.zoneIDS[3]==zoneID then
				return UPU.Colorize(GetString(UPU_NEXT_DAY_FOR)..UPU.GetZoneName(zoneID)..": "..nextPledges.date)
			else
				offset = offset + 1
			end
		end
	end
end

--get info about the location of a dungeon giving its acronym
function UPU.GetZoneByAcronym(acronym)

	local zoneID = 0
	for _, pledgeGiverData in pairs(UPU.GetPledgesData()) do
		for _,indexData in pairs(pledgeGiverData) do
			if indexData.Acronym==acronym then zoneID=indexData.ZoneID end
		end
	end

	if zoneID == 0 then
		UPU.Msg2Chat(GetString(UPU_WRONG_ACRONYM))
	else
		local dungeonName = UPU.Colorize(UPU.GetZoneName(zoneID),"BLUE")
		local locationName = UPU.Colorize(UPU.GetZoneName(GetParentZoneId(zoneID)),"BLUE")
		UPU.Msg2Chat(UPU.Colorize(GetString(UPU_WHERE_IS_A),"WHITE").." "..dungeonName.." "..UPU.Colorize(GetString(UPU_WHERE_IS_B),"WHITE").." "..locationName)
	end
end


--get a list of dungeon acronyms
function UPU.GetDungeonAcronyms()
	for _, pledgeGiverData in pairs(UPU.GetPledgesData()) do
		for _,indexData in pairs(pledgeGiverData) do
			UPU.Msg2Chat(UPU.Colorize(UPU.GetZoneName(indexData.ZoneID)..": "..indexData.Acronym))
		end
	end
end


---------------------------------------------------------------- ADDON INIT -------------------------------------------------------------------

--called if player is still online when the new dailies are up
function UPU.RefreshDailies()
	UPU.PopulateDailies()
	UPU.Msg2Chat(UPU.Colorize(GetString(UPU_NEW_DAILIES), "WHITE"))
	UPU.InitDailiesManagement()
end

--populates dailies array
function UPU.InitDailiesManagement()

	--Get today data
	UPU.PopulateDailies()

	if UPU.sVars.bAutoDelete then
		UPU.DeleteNonCompletedDailies()
	end
	if UPU.sVars.bAdvertizeDailies then
		UPU.Msg2Chat(UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES), "BLUE").."\n"..UPU.GetDailies(UPU.DailyData))
	end

	--function called at 3:00 AM UTC (EU)/10:00 AM UTC (NA) (daily pledge reset time)
	local _, dayFraction = UPU.GetDaysFromOriginTimestamp()
	local secondsTillNextDailies = 86400 - (dayFraction * 86400)
	zo_callLater(function() UPU.RefreshDailies() end, secondsTillNextDailies*1000)
end

--get text for the tooltip  of the custom button added in the journal
function UPU.GetDailiesTooltipText()

	local arrow = "|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"
	local ttText = UPU.Colorize(GetString(UPU_BUTTON_TT)).."\r\n"..UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES)).."\r\n"

	ttText=ttText..arrow..UPU.Colorize(UPU.GetZoneName(UPU.DailyData['Maj'].ZoneID)).."\n"
	ttText=ttText..arrow..UPU.Colorize(UPU.GetZoneName(UPU.DailyData['Glirion'].ZoneID)).."\n"
	ttText=ttText..arrow..UPU.Colorize(UPU.GetZoneName(UPU.DailyData['Urgarlag'].ZoneID))

	return ttText
end

--init ui
function UPU.InitUI()
    local button = WINDOW_MANAGER:GetControlByName("UPU_Button_Button")
	button:SetHandler("OnClicked", function(self) UPU.Msg2Chat(UPU.GetNextPledges()) end)
	button:SetHandler("OnMouseEnter", function(self) ZO_Tooltips_ShowTextTooltip(self, TOP, UPU.GetDailiesTooltipText()) end)
    button:SetHandler("OnMouseExit", function(self) ZO_Tooltips_HideTextTooltip() end)

	local tlc =  WINDOW_MANAGER:GetControlByName("UPU_Button")
	local fragment = ZO_SimpleSceneFragment:New(tlc)
	QUEST_JOURNAL_SCENE:AddFragment(fragment)
 end

--main event handler
function UPU.OnPlayerActivated()
	--this part should fire only one time, after the login
	if UPU.AtStartup then
		if UPU.sVars.bDebugMode then
			UPU.Msg2Chat(UPU.Colorize("EVENT: EVENT_PLAYER_ACTIVATED, MSG: code called just once to initialize daily data for pledges! -> atStartup="..tostring(not UPU.AtStartup),"GREEN"))
		end
		zo_callLater(function() UPU.InitDailiesManagement() end, 500)
		UPU.AtStartup=false
	end

	--this part fires whenever you enter a new dungeon, to print achievements in chat if enabled
	zo_callLater(function() UPU.OnDungeonEnter() end, 1000)
end


function UPU.onAddOnLoaded(eventCode, name)
	if name ~= UPU.AddonName then return end

	EVENT_MANAGER:UnregisterForEvent(UPU.AddonName, EVENT_ADD_ON_LOADED)

	--Loads saved variables from file or default
	UPU.sVars = ZO_SavedVars:NewCharacterIdSettings("UndauntedPledgesUtilities_SavedVariables", 1, nil, UPU.defaults )
	UPU.AbandonQuestEventName = "AbandonPledge"

	-- Init UI
	UPU.InitUI()

	--Settings Module
	UPU.CreateSettingsMenu()

	--Register for events:
	--Quick dialog
	if UPU.sVars.bQuickDialog then
		EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_CHATTER_BEGIN, UPU.OnChatterBegin)
	end
	--Main event
	EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_PLAYER_ACTIVATED, UPU.OnPlayerActivated)
	--Journal custom hook
	ZO_PreHook(_G, "ZO_QuestJournalNavigationEntry_OnMouseUp", UPU.QuestContextMenu)
	--Achievement tracker
	EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_PREPARE_FOR_JUMP, UPU.OnPrepareForJump)
	EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_ACHIEVEMENT_AWARDED , UPU.OnAchievementAwarded)

	--Slash commands
	local LSC = LibSlashCommander
	LSC:Register({"/upupledges", "/pledges"}, function(dayOffset)
		UPU.Msg2Chat(UPU.GetNextPledges(dayOffset))
	end, GetString(UPU_PLEDGE_CMD_DESCRIPTION))

	LSC:Register({"/upuday", "/day"}, function(acronym)
		UPU.Msg2Chat(UPU.GetPledgeDay(acronym))
	end, GetString(UPU_GET_DAY_CMD_DESCRIPTION))

	LSC:Register({"/upudayhelp", "/dayhelp"}, function()
		UPU.GetDungeonAcronyms()
	end, GetString(UPU_GET_ACR_CMD_DESCRIPTION))

	LSC:Register({"/upuwhereis", "/whereis"}, function(acronym)
		UPU.GetZoneByAcronym(acronym)
	end, GetString(UPU_WHERE_IS_CMD_DESCRIPTION))

	--useful function active in debug mode to list all the dungeon nodes (to fill the corresponding node info in lang.lua files)
	if UPU.sVars.bDebugMode
		then LSC:Register("/upuupdate", function(zoneID)
		UPU.UpdateAddonData(zoneID)
	end, "Print data for addon update") end
end

EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_ADD_ON_LOADED, UPU.onAddOnLoaded)
Original_ZO_LinkHandler_OnLinkMouseUp = ZO_LinkHandler_OnLinkMouseUp
ZO_LinkHandler_OnLinkMouseUp = function(itemLink, button, control) UPU.ZO_LinkHandler_OnLinkMouseUp(itemLink, button, control) end


---------------------------------------------------------------- KEYBINDS -------------------------------------------------------------------

--abandon pledges
function UPU.AbandonPledges()
	local foundAnyPledgeQuests = false
	for questIndex = 1, MAX_JOURNAL_QUESTS do
		if UPU.IsPledge(questIndex) and not UPU.ManualCompletionCheck(questIndex) then
			foundAnyPledgeQuests = true
			EVENT_MANAGER:RegisterForEvent(UPU.AbandonQuestEventName, EVENT_QUEST_REMOVED, OnRemoveQuest)
			QUEST_JOURNAL_MANAGER:ConfirmAbandonQuest(questIndex)
		end
	end

	if not foundAnyPledgeQuests then
		ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, GetString(UPU_PLEDGES_ABANDONED))
		EVENT_MANAGER:UnregisterForEvent(UPU.AbandonQuestEventName, EVENT_QUEST_REMOVED)
	end
end

--post to chat
function UPU.PostToChat()

	toChat = GetString(UPU_UNDAUNTED_DAILES).." "

	for _, pledgeGiverData in pairs(UPU.DailyData) do
		toChat=toChat..UPU.GetZoneName(pledgeGiverData.ZoneID)..
				" ("..zo_strformat(UPU.BuildItemLink(pledgeGiverData.HelmetsItemIDS[math.random(#pledgeGiverData.HelmetsItemIDS)],369)).."), "
	end

	CHAT_SYSTEM:StartTextEntry(string.sub(toChat,1,-3).." - by Undaunted Pledges Utilities addon")
end

ZO_CreateStringId("SI_BINDING_NAME_ABANDON_PLEDGES", GetString(UPU_ABANDON_PLEDGES))
ZO_CreateStringId("SI_BINDING_NAME_POST_TO_CHAT", GetString(UPU_POST_TO_CHAT))