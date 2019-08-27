
----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities main file  	   				    																--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------
--	LOCALS & DEFAULTS		   	   					   --
--------------------------------------------------------- 

UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
UPU = UndauntedPledgesUtilities

UPU.AddonName        	= "UndauntedPledgesUtilities"
UPU.AddonNameSpaces 	= "Undaunted Pledges Utilities"
UPU.AddonVersion    	= "1.5"
UPU.Author 				= "iFedix"
UPU.WebSite 		    = "https://www.esoui.com/downloads/info2267-UndauntedPledgesUtilities.html"

UPU.DebugMode 			= false

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
	 bIncludeDelves = true,
	 bAdvertizeDailies = true, 
	 bDisplayLootLink = true,
	 bAutoDelete    = false,
	 bQuickDialog = true,
	 
	 --achievements
	 bEnableAch = true,
	 bShowCommonAchievs = true,
	 bShowComposedAchievs = true,
	 bShowOnAchievAwarded = false,

--TODO (maybe)	 
--	bEnableLFG = false,
-- 	pledgePreferedMode = PLEDGE_MODE_HM,
-- 	lfgText = "{Level} {Role} lfg {Quest Name} {Mode}", --{Level} {Role} lfg pledges (no DLC) {Mode}
}

UPU.MAJ_AND_GLIRION_CYCLE = 12
UPU.URGARLAG_CYCLE = 14

local WM = WINDOW_MANAGER

local ORIGIN_TIMESTAMP = 1502690400 --08/14/2017 @ 6:00am (UTC)
local UNDAUNTED_KEY_ITEM_INDEX = 55448 -- eso item index for an undaunted key 

local MAJ      = 1
local GLIRION  = 2
local URGARLAG = 3

local QUEST_CAT_ZONE  = 1  
local QUEST_CAT_OTHER = 2
local QUEST_CAT_MISC  = 3
local QUEST_CAT_UNDAUNTED_DAILY = 4 --Added this quest category

--to do
local PLEDGE_MODE_NORMAL = 1
local PLEDGE_MODE_VET = 2
local PLEDGE_MODE_HM = 3
local pledgeModes = {
	[PLEDGE_MODE_NORMAL] = "Normal Mode",
	[PLEDGE_MODE_VET] = "Veteran Mode",
	[PLEDGE_MODE_HM] = "Vet HM",
}


local actualZone = ""
local actualDifficulty = ""
local currentDFStatus = ""

UPU.sVars={}
local UPU_UI
local TodaysDailies = {}
local TodaysHelmets = {}
-- colors
local BLUE, RED, WHITE, GREEN = 1,2,3,4

---------------------------------------------------------
--	EVENT HANDLERS			   	   					   --
--------------------------------------------------------- 

function UPU.OnAddOnLoaded( eventCode, name )

	if name ~= UPU.AddonName then return end
	
	--loads saved variables from file or default
	UPU.sVars = ZO_SavedVars:New( "UndauntedPledgesUtilities_SavedVariables", 1, nil, UPU.defaults )	
	
	EVENT_MANAGER:UnregisterForEvent( UPU.AddonName, EVENT_ADD_ON_LOADED )
	--initialize, only, once the player is activated
	EVENT_MANAGER:RegisterForEvent( UPU.AddonName, EVENT_PLAYER_ACTIVATED , UPU.Initialize )
	
	--events to handle achievement tracker
	EVENT_MANAGER:RegisterForEvent( UPU.AddonName, EVENT_ACHIEVEMENT_AWARDED , UPU.OnAchievementAwarded ) 
	EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_ACTIVITY_FINDER_STATUS_UPDATE, UPU.onStatusUpdate)
	CALLBACK_MANAGER:RegisterCallback("OnWorldMapChanged", UPU.onZoneChanged)
end

function UPU.onStatusUpdate(eventCode, newStatus)
	if newStatus==ACTIVITY_FINDER_STATUS_FORMING_GROUP then currentDFStatus=ACTIVITY_FINDER_STATUS_FORMING_GROUP end
end

function UPU.isNewInstance()
	if currentDFStatus==ACTIVITY_FINDER_STATUS_FORMING_GROUP and GetActivityFinderStatus()==ACTIVITY_FINDER_STATUS_IN_PROGRESS then
		currentDFStatus=ACTIVITY_FINDER_STATUS_IN_PROGRESS
		return true
	end
	return false
end

function UPU.onZoneChanged()
	if UPU.sVars.bEnableAch==false then return end
	local zone = GetUnitZone("player")	
	local difficulty = GetCurrentZoneDungeonDifficulty()
	local pledgeID = UPU.isDungeon(zone)
	local newInstance = UPU.isNewInstance()
	
	local debugString = "DEBUG - Zone: "..zone.." Previous Zone: "..actualZone.." Difficulty: "..difficulty.." Previous Difficulty: "..actualDifficulty.." PledgeID: "..pledgeID.. " IsNewInstance: "..tostring(newInstance)
	
	--Still need some tuning...
	if UPU.DebugMode then UPU.Msg2Chat(UPU.Colorize(debugString, RED)) end
	
	if zone ~= actualZone or difficulty ~= actualDifficulty or newInstance then
		if pledgeID ~= "" then
		
			if UPU.DebugMode then UPU.Msg2Chat(UPU.Colorize(debugString, GREEN)) end
			
			UPU.Msg2Chat(UPU.Colorize(zone, BLUE))
			UPU.HandleAchievements(difficulty, pledgeID)		
		end
	end
	actualZone=zone
	actualDifficulty=difficulty
end

function UPU.HandleAchievements(difficulty, pledgeID)
	
	if difficulty == DUNGEON_DIFFICULTY_NORMAL then mode = GetString(UPU_NORMAL_MODE) else mode = GetString(UPU_VETERAN_MODE) end		
	
		local v1,v2,v3 = false,false,false
		
		--Standard achievements
		local achievements = UPU.GetUncompletedAchievements(UPU.GetAchievements(difficulty, pledgeID,"Single"))
		if next(achievements)==nil then
			UPU.Msg2Chat(UPU.Colorize(GetString(UPU_NO_MISSING_ACH)..GetUnitZone("player").." ("..mode..")", WHITE))
		else
			UPU.Msg2Chat(UPU.Colorize(GetString(UPU_MISSING_ACH).."("..mode.."):", WHITE))
			UPU.PrintAchievements(achievements)
			v1=true
		end
		
		--Common achievements
		if UPU.sVars.bShowCommonAchievs then
			local commonAchievements = UPU.GetUncompletedCommonAchievements()
			if next(commonAchievements)~=nil then
				UPU.Msg2Chat(UPU.Colorize(GetString(UPU_COMMON_ACH), WHITE))
				UPU.PrintAchievements(commonAchievements)
				v2=true
			end	
		end
		
		--Composed achievements
		if UPU.sVars.bShowComposedAchievs then
			local composedAchievements = UPU.GetUncompletedAchievements(UPU.GetAchievements(difficulty, pledgeID,"Composed"))
			if next(composedAchievements)~=nil then
				UPU.Msg2Chat(UPU.Colorize(GetString(UPU_COMPOSED_ACH), WHITE))
				UPU.PrintAchievements(composedAchievements)
				v3=true
			end	
		end
		
		if v1 or v2 or v3 then
			UPU.Msg2Chat(UPU.Colorize(GetString(UPU_MIDDLE_CLICK), WHITE))
		end
end

function UPU.OnAchievementAwarded(eventCode, name, points, id, link)
	if UPU.sVars.bEnableAch==false then return end
	local zone = GetUnitZone("player")	
	local pledgeID = UPU.isDungeon(zone)
	local difficulty = GetCurrentZoneDungeonDifficulty()
	if pledgeID ~="" and UPU.isValidAchiev(id,pledgeID,difficulty) then
		CHAT_SYSTEM:AddMessage(GetAchievementLink(id,1)..GetString(UPU_ACH_AWARDED))
		if UPU.sVars.bShowOnAchievAwarded then
			UPU.HandleAchievements(difficulty, pledgeID)
		end
	end
end

--called once, the first time the player finsishes loading an area (new zone or reloadui or tp in same zone)
function UPU.Initialize() -- == player activated
	
	UPU.AbandonQuestEventName = "AbandonPledge"

	--loads saved variables from file or default
	UPU.sVars = ZO_SavedVars:New( "UndauntedPledgesUtilities_SavedVariables", 1, nil, UPU.defaults )	
	
	EVENT_MANAGER:UnregisterForEvent( UPU.AddonName, EVENT_PLAYER_ACTIVATED )
	
	--init-- 
    ZO_PreHook(_G, "ZO_QuestJournalNavigationEntry_OnMouseUp", UPU.QuestContextMenu)
	if UPU.sVars.bQuickDialog then
		EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_CHATTER_BEGIN, UPU.OnChatterBegin)
	end
	
	UPU.InitUI()		
	zo_callLater(function() UPU.InitDailesManagement() end, 3000)
	
  	-- Settings Module
	UPU.CreateSettingsMenu()
	
	-- Slash commands
	local LSC = LibStub("LibSlashCommander")
    LSC:Register({"/undaunted", "/pledges", "/dungeons"}, function(dayOffset)
        UPU.Msg2Chat(UPU.GetNextPledges(dayOffset))
    end, GetString(UPU_PLEDGE_CMD_DESCRIPTION))	
		
	LSC:Register("/upuday", function(acronym) 
		UPU.Msg2Chat(UPU.GetPledgeDay(acronym)) 
	end, GetString(UPU_GET_DAY_CMD_DESCRIPTION))
	
	LSC:Register("/upudayhelp", function() 
		UPU.GetDungeonAcronyms() 
	end, GetString(UPU_GET_ACR_CMD_DESCRIPTION))
	
	--debug mode only for iFedix
--	if string.find(GetDisplayName("player"), UPU.Author) then 
--		UPU.DebugMode=true 
--		UPU.Msg2Chat(UPU.Colorize("UPU: DUBUG MODE ACTIVE", RED))
--	end
	
	--useful function active in debug mode to list all the dungeon nodes (to fill the corresponding node info in lang.lua files)
	if UPU.DebugMode then LSC:Register("/upulistnodes", function() UPU.ShowNodesIndexes() end, GetString(UPU_TEST_CMD_DESCRIPTION)) end
	
end

--event : triggered when discussion begins (with item or npc)
--start of quick dialog functions
--Quest offering dialog has 3 prompts
--first one is dealt with slect chatter option in 'chatter begin"
--second one, is dealt with Accept offered quest in "pseudoConversationUpdated" (should be a select chatter option in a conversation updated event)
--Last one is dealt with a AcceptOfferedQuest in OnQuestOffered
justInteracted = false
function UPU.OnChatterBegin(eventCode, optionCount)
    if justInteracted == true then justInteracted=false EndInteraction(INTERACTION_CONVERSATION) end
	local optionString, _ = GetChatterOption(1)
        
	--only executes if "interact" is an undaunted quest giver
	local unitName = GetRawUnitName('interact')
	if unitName=="Ansei Maja" then return end
	
	if string.find(unitName, GetString(UPU_URGARLAG)) or string.find(unitName, GetString(UPU_GLIRION)) or string.find(unitName, GetString(UPU_MAJ)) then		
        if string.find(optionString, GetString(UPU_STORE)) then return end --quest already taken
		if string.find(string.upper(optionString), GetString(UPU_PLEDGE)) then
			--dialog is daily pledge offering
			EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_QUEST_OFFERED, UPU.PseudoOnConversationUpdated) -- event should be onconvupdated but strangely is quest offered 
            SelectChatterOption(1)
		else
			--dialog is daily pledge return
			EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_CONVERSATION_UPDATED, UPU.OnConversationUpdated)
			SelectChatterOption(1)
		end
	end
end

-- event : should be conversation updated but is in fact quest_offered event
function UPU.PseudoOnConversationUpdated(eventCode) 
	EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_QUEST_OFFERED)
	EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_QUEST_OFFERED, UPU.OnQuestOffered)
	AcceptOfferedQuest()

end

-- event : last line of dialog => accepts quest
function UPU.OnQuestOffered(eventCode)
	EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_QUEST_OFFERED)	
	AcceptOfferedQuest()
    justInteracted=true

end

-- event, last line of dialog before actually returning the quest
function UPU.OnConversationUpdated(eventCode, conversationBodyText, conversationOptionCount)	
	EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_CONVERSATION_UPDATED)
	EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_QUEST_COMPLETE_DIALOG, UPU.OnQuestCompleteDialog)
	SelectChatterOption(1)
end

-- event : complete the quests and get the loots. (no error management if inventory is full)
function UPU.OnQuestCompleteDialog(eventCode)
	EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_QUEST_COMPLETE_DIALOG)
	CompleteQuest()
    justInteracted=true
end

-- event: remove pledge quest
local function OnRemoveQuest(eventCode, isCompleted, journalIndex, questName, zoneIndex, poiIndex, questID)
	if UPU == nil or UPU.AbandonQuestEventName == nil then return false end
	--d("[OnRemoveQuest] isCompleted: " .. tostring(isCompleted) .. ", journalIndex: " .. tostring(journalIndex) .. ", questName: " .. tostring(questName) .. ", questID: " .. tostring(questID))
	if string.find(questName, "Pledge") then
		UPU.Msg2Chat(UPU.Colorize(string.sub(questName,9).." "..GetString(UPU_ABANDONNED)))
	end
	--If pledges quest got abandoned we need to go on with the next possible pledges quest
	if not isCompleted and string.find(string.upper(questName), GetString(UPU_PLEDGE)) then
		--UnRegister event callback function to realize if quest get's abandoned
		EVENT_MANAGER:UnregisterForEvent(UPU.AbandonQuestEventName, EVENT_QUEST_REMOVED)
		
		--UPU.AbandonPledges()
		zo_callLater(function() UPU.AbandonPledges() end, 200)
	end
end

function UPU.FoundAnyPledgeQuests()
	for questIndex = 1, MAX_JOURNAL_QUESTS do
		if UPU.isPledge(questIndex) then
			return true
		end
	end	
    return false
end

function UPU.ZO_LinkHandler_OnLinkMouseUp(link, button, control)
    if type(link) == 'string' and #link > 0 then
		local handled = LINK_HANDLER:FireCallbacks(LINK_HANDLER.LINK_MOUSE_UP_EVENT, link, button, ZO_LinkHandler_ParseLink(link))
		if (not handled) then
            Original_ZO_LinkHandler_OnLinkMouseUp(link, button, control)
            if button == 3 and GetAchievementIdFromLink(link) > 0 then		
				UPU.ShowAchieve(link)
            end
        end
    end
end

function UPU.ShowAchieve(link)
	local aid = GetAchievementIdFromLink(link)
	if select(1,GetCategoryInfoFromAchievementId(aid)) ~= nil then
		SCENE_MANAGER:ShowBaseScene()
		ACHIEVEMENTS:ShowAchievement(aid)
	end	
end


---------------------------------------------------------
--	HOOKS & OVERRIDES		   	   					   --
--------------------------------------------------------- 

--prehook for ZO_QuestJournalNavigationEntry_OnMouseUp
--adds multiple entries in the context menu for undaunted quests
function UPU.QuestContextMenu(label, button, upInside) --ZO_QuestJournalNavigationEntry_OnMouseUp(label, button, upInside)
    if(button == MOUSE_BUTTON_INDEX_RIGHT and upInside) then
		local node = label.node
        local questIndex = node.data.questIndex
        if UPU.isPledge(questIndex) then
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
		return false --
	end
end

--override 
--adds new category for undaunted quests in journal
function ZO_QuestJournal_Manager:GetQuestListData()
	local seenCategories = {}
    local categories = {}
    local quests = {}
    -- Create a table for categories and one for quests
    for i = 1, MAX_JOURNAL_QUESTS do
        if IsValidQuestIndex(i) then  
            local zone = GetJournalQuestLocationInfo(i)
            local questType = GetJournalQuestType(i)
            local name = GetJournalQuestName(i)
            local level = GetJournalQuestLevel(i)
            local instanceDisplayType = GetJournalQuestInstanceDisplayType(i)
            local categoryName
            local type
            if questType == QUEST_TYPE_MAIN_STORY then
                categoryName = GetString("SI_QUESTTYPE", QUEST_TYPE_MAIN_STORY)
                type = QUEST_CAT_OTHER
            elseif questType == QUEST_TYPE_GUILD then
				--looking for a undaunted delve quest daily
				if UPU.isUndauntedDelveQuest(i) and UPU.sVars.bIncludeDelves then
					--quest is undaunted delve daily quest => add it in new category 
				    categoryName = GetString(UPU_UNDAUNTED_DAILY_CATEGORY)
					type = QUEST_CAT_UNDAUNTED_DAILY				
				else
				    categoryName = GetString("SI_QUESTTYPE", QUEST_TYPE_GUILD)
					type = QUEST_CAT_OTHER
				end	                
            elseif questType == QUEST_TYPE_CRAFTING then
                categoryName = GetString("SI_QUESTTYPE", QUEST_TYPE_CRAFTING)
                type = QUEST_CAT_OTHER
            elseif questType == QUEST_TYPE_HOLIDAY_EVENT then
                categoryName = GetString("SI_QUESTTYPE", QUEST_TYPE_HOLIDAY_EVENT)
                type= QUEST_CAT_OTHER
            elseif questType == QUEST_TYPE_BATTLEGROUND then
                categoryName = GetString("SI_QUESTTYPE", QUEST_TYPE_BATTLEGROUND)
                type = QUEST_CAT_OTHER
            elseif zone ~= "" then
				--quest should be in "zone" category
				if UPU.isPledge(i) then
					--quest is undaunted pledge => add it in new category 
				    categoryName = GetString(UPU_UNDAUNTED_DAILY_CATEGORY)
					type = QUEST_CAT_UNDAUNTED_DAILY				
				else
				    categoryName = zo_strformat(SI_QUEST_JOURNAL_ZONE_FORMAT, zone)
					type = QUEST_CAT_ZONE
				end				
            else
                categoryName = GetString(SI_QUEST_JOURNAL_GENERAL_CATEGORY)
                type = QUEST_CAT_MISC
            end
            if not seenCategories[categoryName] then
                table.insert(categories, {name = categoryName, type = type})
                seenCategories[categoryName] = true
            end
            if name == "" then
                name = GetString(SI_QUEST_JOURNAL_UNKNOWN_QUEST_NAME)
            end
            table.insert(quests,
                {
                    name = name,
                    questIndex = i,
                    level = level,
                    questType = questType,
                    categoryName = categoryName,
                    categoryType = type,
                    questType = questType,
                    displayType = instanceDisplayType
                }
            )
        end
    end
    -- Sort the tables
    table.sort(categories, UPU.SortQuestCategories)
    table.sort(quests, UPU.SortQuestEntries)
    return quests, categories, seenCategories
end

---------------------------------------------------------
--	DAILIES MANAGEMENT		   	   					   --
--------------------------------------------------------- 

-- force the refresh of quest list on init dailies
function UPU.ForceRefreshQuestMasterList()
    local quests, categories, seenCategories = ZO_QuestJournal_Manager:GetQuestListData()
	local questJournalObject = SYSTEMS:GetObject("questJournal")
    questJournalObject.questMasterList = {
        quests = quests,
        categories = categories,
        seenCategories = seenCategories,
    }
	return true
end

-- force the refresh of quest list on init dailies
function UPU.ForceRefreshQuestList()
    local questJournalObject = SYSTEMS:GetObject("questJournal")
    local quests = questJournalObject.questMasterList.quests
    local categories = questJournalObject.questMasterList.categories
    questJournalObject.questIndexToTreeNode = {}
    ClearTooltip(InformationTooltip)	
    -- Add items to the tree
    questJournalObject.navigationTree:Reset()    
	local categoryNodes = {}
    for i = 1, #categories do
        local categoryInfo = categories[i]
        categoryNodes[categoryInfo.name] = questJournalObject.navigationTree:AddNode("ZO_QuestJournalHeader", categoryInfo.name, nil, SOUNDS.QUEST_BLADE_SELECTED)
    end
    local firstNode
    local lastNode
    for i = 1, #quests do
        local questInfo = quests[i]
        local parent = categoryNodes[questInfo.categoryName]
        local questNode = questJournalObject.navigationTree:AddNode("ZO_QuestJournalNavigationEntry", questInfo, parent, SOUNDS.QUEST_SELECTED)
        firstNode = firstNode or questNode
        questJournalObject.questIndexToTreeNode[questInfo.questIndex] = questNode
        if lastNode then
            lastNode.nextNode = questNode
        end
        if i == #quests then
            questNode.nextNode = firstNode
        end
        lastNode = questNode
    end
    questJournalObject.navigationTree:Commit()
    questJournalObject:RefreshDetails()
    questJournalObject.listDirty = false	
	return true
end

--populates dailies array, force the refresh of quest list if no quest have been removed
function UPU.InitDailesManagement()
	
	local secondsTillNextDailies = UPU.GetDaysSinceCycleStart(10) --GetDaysSinceCycleStart actually populates the pledge tables and returns the secondsTillNextDailies if invoked with a number >= 4
	if UPU.sVars.bAutoDelete then
		local bAbandonned = UPU.DeleteNonCompletedDailies() 
		if not bAbandonned then
			UPU.ForceRefreshQuestMasterList()
			UPU.ForceRefreshQuestList()		
		end
	else
		UPU.ForceRefreshQuestMasterList()
		UPU.ForceRefreshQuestList()		
	end
	
	if UPU.sVars.bAdvertizeDailies then
		UPU.DisplayDailies()
	end
	
	zo_callLater(function() UPU.RefreshDailies() end, secondsTillNextDailies*1000)	
end

--questindex is pledge if type dungeon and name contains localized version of the word "PLEDGE" 
function UPU.isPledge(questIndex)
	if GetJournalQuestType(questIndex) ~= QUEST_TYPE_DUNGEON then return false end
	if string.find(string.upper(GetJournalQuestName(questIndex)), GetString(UPU_PLEDGE)) then return true end
	return false
end

--questindex is undaunted delve quest if type guild and name contains one of the possibile (localized) delve quests 
function UPU.isUndauntedDelveQuest(questIndex)
	if GetJournalQuestType(questIndex) ~= QUEST_TYPE_GUILD then return false end
	name = GetJournalQuestName(questIndex)
	for i=1, 15 do 
		if string.find(localizedDailyUndauntedDelves[i],name) then return true end
	end
	return false
end

--get the day number corresponding to today pledges
function UPU.GetDaysSinceCycleStart(pledgeGiver)
	local secondsSinceStart = GetTimeStamp() - ORIGIN_TIMESTAMP
	local daysElapsed, dayFraction = math.modf((secondsSinceStart)/86400)
	local secondsTillNextDailies = 86400 - (dayFraction * 86400)
	local cyclesCount, cycleFraction 
	
	if pledgeGiver == MAJ then
		-- Maj and Glirion cycle through 12 dailies
		cyclesCount, cycleFraction = math.modf(daysElapsed/UPU.MAJ_AND_GLIRION_CYCLE)
		return UPU.Round(cycleFraction*UPU.MAJ_AND_GLIRION_CYCLE)--rounds the value to nearest integer
	elseif pledgeGiver == URGARLAG then
		--Urgarlag cycles through 14 pleges
		cyclesCount, cycleFraction = math.modf(daysElapsed/UPU.URGARLAG_CYCLE)
		return UPU.Round(cycleFraction*UPU.URGARLAG_CYCLE)--rounds the value to nearest integer	
	else 
		UPU.PopulateDailies()
		return secondsTillNextDailies --returns second till next dailies cycle (6am utc) 
	end
end

--populates the dailies array given the current timestamp, the origin timestamp and the tables in undaunted_data
function UPU.PopulateDailies()
	local daysSinceCycleStartMajAndGlirion = UPU.GetDaysSinceCycleStart(MAJ)
	local daysSinceCycleStartUrgarlag = UPU.GetDaysSinceCycleStart(URGARLAG)
	
	TodaysDailies[MAJ] = UPU.GetLocalizedPledge(daysSinceCycleStartMajAndGlirion,MAJ)
	TodaysHelmets[MAJ] = UPU.GetPledgeLink(daysSinceCycleStartMajAndGlirion,MAJ)
	TodaysDailies[GLIRION] = UPU.GetLocalizedPledge(daysSinceCycleStartMajAndGlirion,GLIRION)
	TodaysHelmets[GLIRION] = UPU.GetPledgeLink(daysSinceCycleStartMajAndGlirion,GLIRION)
	TodaysDailies[URGARLAG] = UPU.GetLocalizedPledge(daysSinceCycleStartUrgarlag,URGARLAG)
	TodaysHelmets[URGARLAG] = UPU.GetPledgeLink(daysSinceCycleStartUrgarlag,URGARLAG)
end

--get next pledges command
function UPU.GetNextPledges(dayOffset)
	local maj, glirion, urgarlag, majHelmet, glirionHelmet, urgarlagHelmet
	local daysSinceCycleStartMajAndGlirion = UPU.GetDaysSinceCycleStart(MAJ)
	local daysSinceCycleStartUrgarlag = UPU.GetDaysSinceCycleStart(URGARLAG)

	if dayOffset== nil or dayOffset=="" then
		if UPU.sVars.bDisplayLootLink then
			return UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES).." "..TodaysDailies[MAJ].Regular.." ("..zo_strformat(TodaysHelmets[MAJ]).."), "..TodaysDailies[GLIRION].Regular.." ("..zo_strformat(TodaysHelmets[GLIRION])..") and "..TodaysDailies[URGARLAG].Regular.." ("..zo_strformat(TodaysHelmets[URGARLAG])..")")	
		else
			return UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES).." "..TodaysDailies[MAJ].Regular..", "..TodaysDailies[GLIRION].Regular.." and "..TodaysDailies[URGARLAG].Regular)	
		end
	elseif dayOffset=="week" then
		local weekPledges=""
		for i = 0,6,1 do 
			weekPledges = weekPledges..UPU.GetNextPledges(i).."\n"
		end 
		return weekPledges
	elseif tonumber(dayOffset) == nil then
		return GetString(UPU_WRONG_OFFSET)
	elseif tonumber(dayOffset)>30 then
		return GetString(UPU_WRONG_OFFSET)
	else	
		maj = UPU.GetLocalizedPledge((tonumber(daysSinceCycleStartMajAndGlirion)+dayOffset)%UPU.MAJ_AND_GLIRION_CYCLE,MAJ)
		majHelmet = UPU.GetPledgeLink((tonumber(daysSinceCycleStartMajAndGlirion)+dayOffset)%UPU.MAJ_AND_GLIRION_CYCLE,MAJ)
		glirion = UPU.GetLocalizedPledge((tonumber(daysSinceCycleStartMajAndGlirion)+dayOffset)%UPU.MAJ_AND_GLIRION_CYCLE,GLIRION)
		glirionHelmet = UPU.GetPledgeLink((tonumber(daysSinceCycleStartMajAndGlirion)+dayOffset)%UPU.MAJ_AND_GLIRION_CYCLE,GLIRION)
		urgarlag = UPU.GetLocalizedPledge((tonumber(daysSinceCycleStartUrgarlag)+dayOffset)%UPU.URGARLAG_CYCLE,URGARLAG)
		--d(daysSinceCycleStartMajAndGlirion.." "..dayOffset)
		--d(daysSinceCycleStartUrgarlag.." "..dayOffset)
		urgarlagHelmet = UPU.GetPledgeLink((tonumber(daysSinceCycleStartUrgarlag)+dayOffset)%UPU.URGARLAG_CYCLE,URGARLAG)		
	
		if UPU.sVars.bDisplayLootLink then
			return UPU.Colorize(os.date("%x", os.time()+dayOffset*86400)..": "..maj.Regular.." ("..zo_strformat(majHelmet).."), "..glirion.Regular.." ("..zo_strformat(glirionHelmet)..") and "..urgarlag.Regular.." ("..zo_strformat(urgarlagHelmet)..")")
		else
			return UPU.Colorize(os.date("%x", os.time()+dayOffset*86400)..": "..maj.Regular..", "..glirion.Regular.." and "..urgarlag.Regular)
		end
	end
	return
end

--get pledge day command
function UPU.GetPledgeDay(acronym)
	local dungeon = UPU.GetDungeon(acronym)
	local offset = 0
	if dungeon =="" then
		return GetString(UPU_WRONG_ACRONYM)
	else
		while true do
			local nextPledges = UPU.GetNextPledges(offset)
			if UPU.isWordFoundInString(dungeon,nextPledges) then
				return UPU.Colorize(GetString(UPU_NEXT_DAY_FOR)..dungeon..": "..string.sub(nextPledges, string.find(nextPledges, "%d*/%d*/%d%d%d%d")))
			else
				offset = offset + 1
			end
		end
	end	
end

function UPU.isWordFoundInString(w,s)
  return select(2,s:gsub('^' .. w .. '%W+','')) +
         select(2,s:gsub('%W+' .. w .. '$','')) +
         select(2,s:gsub('^' .. w .. '$','')) +
         select(2,s:gsub('%W+' .. w .. '%W+','')) > 0
end

--advertizes dailies in chat 
function UPU.DisplayDailies()
	
	UPU.Msg2Chat(UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES), BLUE))
	UPU.DisplayDailie(GetString(UPU_FROM_MAJ), TodaysDailies[MAJ].Regular, zo_strformat(TodaysHelmets[MAJ]))
	UPU.DisplayDailie(GetString(UPU_FROM_GLIRION), TodaysDailies[GLIRION].Regular, zo_strformat(TodaysHelmets[GLIRION]))
	UPU.DisplayDailie(GetString(UPU_FROM_URGARLAG), TodaysDailies[URGARLAG].Regular, zo_strformat(TodaysHelmets[URGARLAG]))

end

--post to chat keybind
function UPU.PostToChat()
	CHAT_SYSTEM:StartTextEntry(string.sub(UPU.GetNextPledges(),9,-3))
end

--creates and displays text for a specific dailie
function UPU.DisplayDailie(fromString, dungeonString, helmet)	
	UPU.Msg2Chat(UPU.Colorize(fromString, WHITE))
	if UPU.sVars.bDisplayLootLink then
		UPU.Msg2Chat("|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"..UPU.Colorize(dungeonString)..UPU.Colorize(" (")..helmet..UPU.Colorize(")"))
	else
		UPU.Msg2Chat("|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"..UPU.Colorize(dungeonString))
	end
end

--called if player is still online when the new dailies are up
function UPU.RefreshDailies()
	--todo, replace with center screen message
	UPU.Msg2Chat(GetString(UPU_NEW_DAILIES), WHITE)
	UPU.InitDailesManagement()
end

--only way to know if a dailie has been completed is to check in the text for "return to..." or "talk to..."
--since player might have completed dailies before installing the addon
function UPU.IsQuestComplete(questIndex)
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
	local questName = string.upper(GetJournalQuestName(questIndex))
	--UPU.Debug("IsTodaysQuest", "Function")
	
	if (questName == string.upper(TodaysDailies[MAJ].Quest)) or (questName == string.upper(TodaysDailies[GLIRION].Quest)) or (questName == string.upper(TodaysDailies[URGARLAG].Quest)) then
		return true
	end
	
	UPU.sVars.testage = GetJournalQuestName(questIndex)	
	return false
end

--only abandon a quest if it's not complete AND not todays quest
--returns true if any quest has been abandonned
function UPU.DeleteNonCompletedDailies()
	local bAbandonned
	for questIndex = 1, MAX_JOURNAL_QUESTS do
		if UPU.isPledge(questIndex) then
			if not UPU.IsTodaysQuest(questIndex) and not UPU.IsQuestComplete(questIndex) then
				bAbandonned = true
				UPU.Msg2Chat(UPU.Colorize(GetJournalQuestName(questIndex).." "..GetString(UPU_ABANDONNED)))
				AbandonQuest(questIndex)
			end
		end
	end	
	return bAbandonned
end

--abandon pledges on keybind
function UPU.AbandonPledges()
	local foundAnyPledgeQuests = false
	for questIndex = 1, MAX_JOURNAL_QUESTS do
		if UPU.isPledge(questIndex) then
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

--override from original local quest categories sorting (no actual changes)
function UPU.SortQuestCategories(entry1, entry2)
    if entry1.type == entry2.type then
        return entry1.name < entry2.name
    else
        return entry1.type < entry2.type
    end
end

--override from original local quest categories sorting (no actual changes)
function UPU.SortQuestEntries(entry1, entry2)
	--todo : always add dlc quest in last position
    if entry1.categoryType == entry2.categoryType then
        if entry1.categoryName == entry2.categoryName then
            return entry1.name < entry2.name
        end

        return entry1.categoryName < entry2.categoryName
    end
    return entry1.categoryType < entry2.categoryType
end

--teleports player to quest node (defined in localisation file)
function UPU.Teleport(questIndex)
	--todo : auto teleport for free if group member already in the instance
	local data ={}
	local questName = GetJournalQuestName(questIndex)
	for _, pledge in pairs(localizedPledges) do
		if questName == pledge.Quest then
			data.node = pledge.Node
			data.pledgeName = pledge.Regular
		end
	end	
	if not IsGroupUsingVeteranDifficulty() then
		--warns player if group is not in vet mode
		ZO_Dialogs_ShowDialog("UPU_TELEPORT", {data.node,data.pledgeName,}, {titleParams={data.pledgeName},}, false)
	else
		FastTravelToNode(data.node)
		UPU.Msg2Chat(UPU.Colorize(GetString(UPU_TELEPORTING_TO)..data.pledgeName..GetString(UPU_HAS_COST_YOU), WHITE)..UPU.Colorize(GetRecallCost(194), RED)..UPU.Colorize(GetString(UPU_GOLD), WHITE))
	end		
	
end

function UPU.GetDailiesTooltipText()
	local ttText = UPU.Colorize(GetString(UPU_BUTTON_TT)).."\r\n"..UPU.Colorize(GetString(UPU_UNDAUNTED_DAILES)).."\r\n"
	ttText = ttText.."|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"..UPU.Colorize(TodaysDailies[MAJ].Regular).."\r\n"
	ttText = ttText.."|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"..UPU.Colorize(TodaysDailies[GLIRION].Regular).."\r\n"
	ttText = ttText.."|t15:15:esoui/art/tutorial/smithing_rightarrow_up.dds|t"..UPU.Colorize(TodaysDailies[URGARLAG].Regular)
	return ttText	
end


---------------------------------------------------------
--	UTILS					   	   					   --
--------------------------------------------------------- 

--round to nearest
function UPU.Round( val, decimal )
	if ( decimal ) then
		return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
	else
		return math.floor(val+0.5)
	end
end

function UPU.Colorize( stringToColorize, color )
	
	if ( color ~= nil and color ~="" ) then 
		if color == BLUE then
			return "|c2020F0"..stringToColorize.."|r"
		elseif color == WHITE then
			return "|cF0F0F0"..stringToColorize.."|r"
		elseif color == RED then
			return "|cF02020"..stringToColorize.."|r"
		elseif color == GREEN then
			return "|c1FFF29"..stringToColorize.."|r"
		end		
	else
		return "|c"..UPU.sVars.MainTextColor.hex..""..stringToColorize.."|r"	
	end
	
end

function UPU.Debug( paramToDump, paramName )
	if UPU.DebugMode then		
		if ( paramToDump == nil ) then
			paramToDump = UPU.Colorize( "Null value", RED ) 
		elseif ( paramToDump == "" ) then
			paramToDump = UPU.Colorize( "Empty string", RED ) 
		elseif ( paramToDump == true ) then 
			paramToDump = UPU.Colorize( "True", BLUE )
		elseif ( paramToDump == false ) then
			paramToDump = UPU.Colorize( "False", BLUE )
		else
			paramToDump = UPU.Colorize( paramToDump, WHITE ) 
		end	
		if ( paramName == nil ) or ( paramName == "" ) then 
			paramName = UPU.Colorize( "Debug out", WHITE ) 
		elseif ( string.find("Function, Event, Override, PreHook, Binding, Slash, Module Loaded", paramName ) ) then 
			paramName = UPU.Colorize( paramName, BLUE )
		else
			paramName = UPU.Colorize( paramName, WHITE )
		end
		UPU.Msg2Chat( paramName.." : "..paramToDump)
	end
end

function UPU.Msg2Chat( stringToDisplay )
	d(stringToDisplay)
end

function UPU.ShowNodesIndexes()
	--gets the list of dungeons nodes
	for nodeIndex = 1, GetNumFastTravelNodes() do
		local _, nodeName, _, _, _, _, _, _, _ = GetFastTravelNodeInfo(nodeIndex)
		if string.find(nodeName, "Dungeon") then
			UPU.Debug (nodeIndex, nodeName)
		end
	end	
end

--for debug purposes only
function UPU.DumpQuestInfo(questIndex)

	local questName, backgroundText, activeStepText, activeStepType, activeStepTrackerOverrideText, completed, tracked, questLevel, pushed, questType, instanceDisplayType = GetJournalQuestInfo(questIndex)
	UPU.Debug (questIndex,"questIndex")
	UPU.Debug (questName,"questName")
	UPU.Debug (backgroundText,"backgroundText")
	UPU.Debug (activeStepText,"activeStepText")
	UPU.Debug (activeStepType,"activeStepType")
	UPU.Debug (activeStepTrackerOverrideText,"activeStepTrackerOverrideText")
	UPU.Debug (completed,"completed")
	UPU.Debug (tracked,"tracked")
	UPU.Debug (questLevel,"questLevel")
	UPU.Debug (pushed,"pushed")
	UPU.Debug (questType,"questType")
	UPU.Debug (instanceDisplayType,"instanceDisplayType")

end

--[[***********************************************************************************************************
*************************************             UI MANAGEMENT           *************************************
*************************************                                     *************************************
*************************************************************************************************************]] 
--"/esoui/art/actionbar/passiveabilityframe_round_up.dds"

function UPU.InitUI()

    local button = WINDOW_MANAGER:GetControlByName("UPU_Button_Button")
	button:SetHandler("OnClicked", function(self) UPU.Msg2Chat(UPU.GetNextPledges()) end)
	button:SetHandler("OnMouseEnter", function(self) UPU.DisplayTooltip(self) end)
    button:SetHandler("OnMouseExit", function(self) ZO_Tooltips_HideTextTooltip() end)   
	
	local tlc =  WINDOW_MANAGER:GetControlByName("UPU_Button")
	local fragment = ZO_SimpleSceneFragment:New(tlc)
	QUEST_JOURNAL_SCENE:AddFragment(fragment)
    
 end
 
 function UPU.DisplayTooltip(ctrl) 
    ZO_Tooltips_ShowTextTooltip(ctrl, TOP, UPU.GetDailiesTooltipText())    
end

EVENT_MANAGER:RegisterForEvent(UPU.AddonName, EVENT_ADD_ON_LOADED, UPU.OnAddOnLoaded)
Original_ZO_LinkHandler_OnLinkMouseUp = ZO_LinkHandler_OnLinkMouseUp
ZO_LinkHandler_OnLinkMouseUp = function(itemLink, button, control) UPU.ZO_LinkHandler_OnLinkMouseUp(itemLink, button, control) end
--keybinds
ZO_CreateStringId("SI_BINDING_NAME_ABANDON_PLEDGES", GetString(UPU_ABANDON_PLEDGES))
ZO_CreateStringId("SI_BINDING_NAME_POST_TO_CHAT", GetString(UPU_POST_TO_CHAT))