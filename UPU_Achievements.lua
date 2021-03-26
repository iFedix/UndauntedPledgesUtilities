----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities achievements file  	   				    																--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
local UPU = UndauntedPledgesUtilities

--Achievement tracker
UPU.CanFire=false
UPU.AfterNewInstance = true

---------------------------------------------------------------- EVENTS -------------------------------------------------------------------

--event that triggers when you press with middle mouse button on achievement
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

--event that fires before teleporting: used to track the EVENT_PLAYER_ACTIVATED event to prevent it to fire when inside a dungeon trespassing doors
function UPU.OnPrepareForJump()
    if UPU.sVars.bEnableAch then
        if UPU.sVars.bDebugMode then
            UPU.Msg2Chat(UPU.Colorize("EVENT: EVENT_PREPARE_FOR_JUMP, MSG: EVENT_PLAYER_ACTIVATED can now be triggered! -> canFire="..tostring(not UPU.CanFire),"GREEN"))
        end

        UPU.CanFire=true
        UPU.AfterNewInstance = false
    end
end

--event that fires when you enter a dungeon. It cannot fire if you are inside and you trespass a door and go to a subzone inside
function UPU.OnDungeonEnter()
    if UPU.sVars.bEnableAch then
        if UPU.CanFire or UPU.AfterNewInstance then
            if UPU.sVars.bDebugMode then
                UPU.Msg2Chat(UPU.Colorize("EVENT: EVENT_PLAYER_ACTIVATED, MSG: ".."You are in "..ZO_CachedStrFormat("<<C:1>>", GetZoneNameByIndex(GetUnitZoneIndex("player")))..
                        " -> canFire="..tostring(not UPU.CanFire),"GREEN"))
                if UPU.AfterNewInstance then UPU.Msg2Chat(UPU.Colorize("NOTE: fired after a reload ui, after a dc or after a new login", "GREEN")) end
            end

            UPU.CanFire=false
            UPU.AfterNewInstance =false

            local dungeonData = UPU.GetDungeonData(GetZoneId(GetUnitZoneIndex("player")))
            if dungeonData then
                UPU.HandleAchievements(GetCurrentZoneDungeonDifficulty(), dungeonData)
            end

        else
            if UPU.sVars.bDebugMode then
                UPU.Msg2Chat(UPU.Colorize("EVENT: EVENT_PLAYER_ACTIVATED, MSG: event was triggered but is currently locked because canFire="..tostring(UPU.CanFire),"RED"))
            end
        end
    end
end

--return dungeon data giving its zoneID
function UPU.GetDungeonData(zoneID)
    local foundData
    for _, pledgeGiverData in pairs(UPU.GetPledgesData()) do
        for _,indexData in pairs(pledgeGiverData) do
            if indexData.ZoneID==zoneID then
                foundData=indexData
                break
            end
        end
    end
    return foundData
end

--function that fires when a new dungeon achievement is rewarded
function UPU.OnAchievementAwarded(eventCode, name, points, id, link)
    if UPU.sVars.bDebugMode then
        UPU.Msg2Chat(UPU.Colorize("EVENT: EVENT_ACHIEVEMENT_AWARDED, MSG: fired","GREEN"))
    end
    if UPU.sVars.bEnableAch then
        if UPU.sVars.bDebugMode then
            UPU.Msg2Chat(UPU.Colorize("EVENT: EVENT_ACHIEVEMENT_AWARDED, MSG: awarded achievement: "..name,"GREEN"))
        end

        local currentZoneID = GetZoneId(GetUnitZoneIndex("player"))

        for _, pledgeGiverData in pairs(UPU.GetPledgesData()) do
            for _,indexData in pairs(pledgeGiverData) do
                if currentZoneID==indexData.ZoneID then

                    local difficulty = GetCurrentZoneDungeonDifficulty()

                    --need to check if its an achiev from the dungeon
                    --(for example "Treasure Chest Hunter" can also trigger, but it should not)

                    if UPU.IsAchievFromDungeon(id, indexData.Achievements[difficulty]) then
                        CHAT_SYSTEM:AddMessage(GetAchievementLink(id,1)..GetString(UPU_ACH_AWARDED))
                        if UPU.sVars.bShowOnAchievAwarded then
                            UPU.HandleAchievements(difficulty, indexData)
                        end
                        break
                    end
                end
            end
        end
    end
end


------------------------------------------------------------------ ACHIEVS FUNCTIONS ----------------------------------------------------------

--check if a trigger achiev is related to dungeon achievements
function UPU.IsAchievFromDungeon(achID, achievementsFromDung)
    --Single check
    for _,storedID in pairs(achievementsFromDung.Single) do
        if storedID == achID then return true end
    end
    --Composed check
    for storedID,_ in pairs(achievementsFromDung.Composed) do
        if storedID == achID then return true end
    end
    return false
end

--open achievements menu and show selected achievement
function UPU.ShowAchieve(link)
    local aid = GetAchievementIdFromLink(link)
    if select(1,GetCategoryInfoFromAchievementId(aid)) ~= nil then
        SCENE_MANAGER:ShowBaseScene()
        ACHIEVEMENTS:ShowAchievement(aid)
    end
end

--master function to handle achievements
function UPU.HandleAchievements(difficulty, dungeonData)

    local needAtLeastOneAchiev = false
    --Standard achievements
    --always print the general ones (doable also in normal difficulty)

    UPU.Msg2Chat(UPU.Colorize(UPU.GetZoneName(dungeonData.ZoneID), "BLUE"))

    local achievements = UPU.GetSingleUncompletedAchievements(dungeonData.Achievements[DUNGEON_DIFFICULTY_NORMAL].Single)
    if not (next(achievements) == nil) then
        UPU.Msg2Chat(UPU.Colorize(GetString(UPU_MISSING_ACH).."("..GetString(UPU_GENERAL_ACH).."):", "WHITE"))
        UPU.PrintAchievements(achievements)
        needAtLeastOneAchiev = true
    end

    --Veteran mode achievements
    if difficulty == DUNGEON_DIFFICULTY_VETERAN then
        achievements = UPU.GetSingleUncompletedAchievements(dungeonData.Achievements[DUNGEON_DIFFICULTY_VETERAN].Single)
        if not (next(achievements) == nil) then
            UPU.Msg2Chat(UPU.Colorize(GetString(UPU_MISSING_ACH).."("..GetString(UPU_VETERAN_ACH).."):", "WHITE"))
            UPU.PrintAchievements(achievements)
            needAtLeastOneAchiev = true
        end
    end

    --Common achievements
    if UPU.sVars.bShowCommonAchievs then
        achievements = UPU.GetSingleUncompletedAchievements(UPU.GetCommonAchievements())
        if not (next(achievements) == nil) then
            UPU.Msg2Chat(UPU.Colorize(GetString(UPU_COMMON_ACH), "WHITE"))
            UPU.PrintAchievements(achievements)
            needAtLeastOneAchiev = true
        end
    end

    --Composed achievements
    if UPU.sVars.bShowComposedAchievs then
        local achievements = UPU.GetComposedUncompletedAchievements(dungeonData.Achievements[DUNGEON_DIFFICULTY_NORMAL].Composed)
        if difficulty == DUNGEON_DIFFICULTY_VETERAN then
            local vetAchievements = UPU.GetComposedUncompletedAchievements(dungeonData.Achievements[DUNGEON_DIFFICULTY_VETERAN].Composed)
            achievements = UPU.ConcatTables(achievements, vetAchievements)
        end

        if not (next(achievements) == nil) then
            UPU.Msg2Chat(UPU.Colorize(GetString(UPU_COMPOSED_ACH), "WHITE"))
            UPU.PrintAchievements(achievements)
            needAtLeastOneAchiev = true
        end
    end

    if needAtLeastOneAchiev then
        UPU.Msg2Chat(UPU.Colorize(GetString(UPU_MIDDLE_CLICK), "WHITE"))
    else
        UPU.Msg2Chat(UPU.Colorize(GetString(UPU_NO_MISSING_ACH)..GetUnitZone("player")))
    end
end

--function to get the uncompleted achievemtns ("single" type)
function UPU.GetSingleUncompletedAchievements(achievements)
    local foundUncompleted =  {}

    for _,id in pairs(achievements) do
        local _,_,_,_,completed,_,_ = GetAchievementInfo(id)
        if not completed then
            table.insert(foundUncompleted, id)
        end
    end

    return foundUncompleted
end

--function to get the uncompleted achievemtns ("composed" type)
function UPU.GetComposedUncompletedAchievements(achievements)

    local foundUncompleted =  {}
    for composedAchiev, dependencyAchievs in pairs(achievements) do

        local toHide = true

        for _, dependencyAchiev in pairs(dependencyAchievs) do
            local _,_,_,_,completed,_,_  = GetAchievementInfo(dependencyAchiev)
            toHide = toHide and completed
        end

        if not toHide then
            table.insert(foundUncompleted, composedAchiev)
        end
    end

    return foundUncompleted
end

--print achievs (table as input)
function UPU.PrintAchievements(achievements)
    for _, achievID in pairs(achievements) do
        CHAT_SYSTEM:AddMessage( "|cF0F0F0-|r "..GetAchievementLink(achievID,1))
    end
end