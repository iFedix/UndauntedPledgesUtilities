----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities utils file  	   				    																--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
local UPU = UndauntedPledgesUtilities

local ORIGIN_TIMESTAMP = 1502690400 --08/14/2017 @ 6:00am (UTC) -> 6:00am UTC = daily pledge reset time

--return true if value is found in a table
function UPU.Contains(table, val)
    for i=1,#table do
        if table[i] == val then
            return true
        end
    end
    return false
end

--round to nearest
function UPU.Round( val, decimal )
    if ( decimal ) then
        return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
    else
        return math.floor(val+0.5)
    end
end

--print to chat
function UPU.Msg2Chat( stringToDisplay )
    d(stringToDisplay)
end

--list all the dungeon nodesId
function UPU.ShowNodesIndexes()
    --gets the list of dungeons nodes
    for nodeIndex = 1, GetNumFastTravelNodes() do
        local _, nodeName, _, _, _, _, poiType, _, _ = GetFastTravelNodeInfo(nodeIndex)
        --check nodeIndex ~= 378 (black rose prison)
        if poiType==6 and nodeIndex ~= 378 then
            UPU.Msg2Chat (tostring(nodeIndex)..": "..nodeName)
        end
    end
end

--colorize text
function UPU.Colorize( stringToColorize, color )
    if ( color ~= nil and color ~="" ) then
        if color == "BLUE" then
            return "|c2020F0"..stringToColorize.."|r"
        elseif color == "WHITE" then
            return "|cF0F0F0"..stringToColorize.."|r"
        elseif color == "RED" then
            return "|cF02020"..stringToColorize.."|r"
        elseif color == "GREEN" then
            return "|c1FFF29"..stringToColorize.."|r"
        end
    else
        return "|c"..UPU.sVars.MainTextColor.hex..""..stringToColorize.."|r"
    end
end

--find word in string
function UPU.IsWordFoundInSentence(word, sentence)
    return select(2, sentence:gsub('^' .. word .. '%W+','')) +
            select(2, sentence:gsub('%W+' .. word .. '$','')) +
            select(2, sentence:gsub('^' .. word .. '$','')) +
            select(2, sentence:gsub('%W+' .. word .. '%W+','')) > 0
end

--DEBUG function for achievs
function UPU.GetActivityFinderStatusString(num)
    if num==0 then return "ACTIVITY_FINDER_STATUS_NONE" end
    if num==1 then return "ACTIVITY_FINDER_STATUS_QUEUED" end
    if num==2 then return "ACTIVITY_FINDER_STATUS_IN_PROGRESS" end
    if num==3 then return "ACTIVITY_FINDER_STATUS_COMPLETE" end
    if num==4 then return "ACTIVITY_FINDER_STATUS_READY_CHECK" end
    if num==5 then return "ACTIVITY_FINDER_STATUS_FORMING_GROUP" end
    return "errValue"
end

--get days from ORIGIN_TIMESTAMP
function UPU.GetDaysFromOriginTimestamp()
    local secondsSinceStart = GetTimeStamp() - ORIGIN_TIMESTAMP
    local daysElapsed, dayFraction = math.modf((secondsSinceStart)/86400)
    return daysElapsed, dayFraction
end

--merge two tables
function UPU.MergeTables(t1, t2)
    for k,v in pairs(t2) do
        t1[k]=v
    end
    return t1
end

--concat two tables
function UPU.ConcatTables(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

--print table (debug)
function UPU.PrintTable(node)
    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    UPU.Msg2Chat(output_str)
end

--dump pledge dungeon names
function UPU.DumpDungeonNames()
    for pledgeGiver, pledgeGiverData in pairs(UPU.GetPledgesData()) do
        for index,indexData in pairs(pledgeGiverData) do
            UPU.Msg2Chat(tostring(indexData.ZoneID)..": "..ZO_CachedStrFormat("<<C:1>>", GetZoneNameById(indexData.ZoneID) ))
        end
    end
end

--build item link from item id (thanks Baertram!)
--The following qualities are available:
--357:  Trash
--366:  Normal
--367:  Magic
--368:  Arcane
--369:  Artifact
--370:  Legendary
function UPU.BuildItemLink(itemId, itemQualitySubType)
    return string.format("|H1:item:%d:%d:50:0:0:0:0:0:0:0:0:0:0:0:0:%d:%d:0:0:%d:0|h|h", itemId, itemQualitySubType, ITEMSTYLE_NONE, 0, 10000)
end

--get localized zone name (=dungeon name) from the zoneID
function UPU.GetZoneName(zoneID)
    return ZO_CachedStrFormat("<<C:1>>", GetZoneNameById(zoneID) )
end

--return true if an itemId is collected, false otherwise
function UPU.IsCollected(itemId)
    return IsItemSetCollectionPieceUnlocked(GetItemLinkItemId(UPU.BuildItemLink(itemId, 369)))
end

--get category of quest in the journal to check if its a pledge
function UPU.IsPledge(questIndex)
    if GetJournalQuestType(questIndex) == QUEST_TYPE_UNDAUNTED_PLEDGE then return true else return false end
end

--find differences between journal quest name and built quest name
function UPU.CheckPledgeQuestNames(journalQuestName, builtQuestName)
    --UPU.Msg2Chat("subJournalName: "..string.sub(journalQuestName,-string.len(builtQuestName)))
    --UPU.Msg2Chat("builtQuestName: "..builtQuestName)
    return string.sub(journalQuestName,-string.len(builtQuestName))==builtQuestName
end




--MAIN FUNCTION TO UPDATE THE ADDON GIVING NEW DUNGEONS ADDED
function UPU.UpdateAddonData(zoneID)

    --------------------------------------------------HOW TO UPDATE THE ADDON WITH NEW DATA--------------------------------------------------

    --1) Get the zoneIDS for the new dungeons (use the LibSets_SetData.xlsx by Baetram in the LibSets addon folder,
    --go to the sheet "ESO zone constants" and get the "ESO internal zoneId" by looking for the dungeon names in the column "Zone Name EN").
    --Use this function to get all the data (except the achievements and the questID) that you can copy/paste into UPU_Data.lua
    --using PChat addon (left click on message -> Copy channel talk)
    if LibSets.checkIfSetsAreLoadedProperly() then
        --start from zoneID of the dungeon, for example for dom: 1081
        --UPU.Msg2Chat("zoneId: "..(zoneId))

        local zoneID = tonumber(zoneID)

        local data = "\t\t[X] = {\n\t\t\tZoneID = "..tostring(zoneID)..", --- \""

        --get dungeon name
        local dungeonName = LibSets.GetZoneName(zoneID)

        if dungeonName == "" then
            UPU.Msg2Chat("Invalid zoneID")
            return
        end
        --UPU.Msg2Chat("zoneName: "..dungeonName)

        data = data..dungeonName.."\" "..tostring(os.date("%m/%d/%Y", os.time())).."\n\t\t\t"

        --get acronym
        local acronym = ""
        for word in string.gmatch(dungeonName, "[^%s]+") do
            acronym = acronym ..string.lower(string.sub(word, 1, 1))
        end
        --UPU.Msg2Chat("acronym: "..acronym)
        data = data.."Acronym = \""..acronym.."\",\n\t\t\t"

        --achievements skeleton
        data = data.. "Achievements = {\n\t\t\t\t"..
                "[DUNGEON_DIFFICULTY_NORMAL] = {\n\t\t\t\t\tSingle = {},".."\n\t\t\t\t\t"..
                "Composed = {\n\t\t\t\t\t\t[] = {}\n\t\t\t\t\t}\n\t\t\t\t},\n\t\t\t\t"..
                "[DUNGEON_DIFFICULTY_VETERAN] = {\n\t\t\t\t\tSingle = {},".."\n\t\t\t\t\t"..
                "Composed = {\n\t\t\t\t\t\t[] = {}\n\t\t\t\t\t}\n\t\t\t\t},\n\t\t\t},\n\t\t\t"

        --questID skeleton
        data=data.."QuestID = ,\n\t\t\t"

        --find the setId of the monsterHelmets
        local fSetId=0
        for setId, _ in pairs(LibSets.monsterSets) do
            if UPU.Contains(LibSets.GetZoneIds(setId), zoneID) then
                fSetId=setId
                break
            end
        end
        --UPU.Msg2Chat('monsterHelmet setID: '..tostring(fSetId))

        --find the node related to the setId
        local nodeId = LibSets.GetWayshrineIds(fSetId)[1]
        --UPU.Msg2Chat("dungeon nodeId: "..tostring(nodeId))
        data=data.."NodeID = "..nodeId..",\n\t\t\t"

        --get the helmet itemIds
        local helmets={}
        for itemId, _ in pairs(LibSets.GetSetInfo(fSetId).setItemIds) do
            local fItemLink = LibSets.buildItemLink(itemId, 369) --369 for epic quality
            --only helmets in divines
            if GetItemLinkEquipType(fItemLink)==EQUIP_TYPE_HEAD and GetItemLinkTraitInfo(fItemLink)==ITEM_TRAIT_TYPE_ARMOR_DIVINES then
                helmets[GetItemLinkArmorType(fItemLink)]=itemId
            end
        end

        data=data.."HelmetsItemIDS = {\n\t\t\t\t[ARMORTYPE_LIGHT] = "..tostring(helmets[1])..",\n\t\t\t\t"..
                "[ARMORTYPE_MEDIUM] = "..tostring(helmets[2])..",\n\t\t\t\t"..
                "[ARMORTYPE_HEAVY] = "..tostring(helmets[3]).."\n\t\t\t},\n\t\t},"

        UPU.Msg2Chat(data)
    end

    --2) Add the achievements data: dump the achievements data in the saved variables using Dumper addon and copy and paste ids for the related achievements of the new dungeons.
    --Note: for the achievements,  giving two new dungeons, you ALWAYS need to insert:
    --for d1:
    --a) normal:
    --single -> enter either d1 or d2 for the first time
    --composed -> complete both d1 and d2 in Normal (and the related id of the associated vanquisher achiev)
    --b) veteran:
    --single ->
    --composed -> complete both d1 and d2 in Veteran (and the related id of the associated conqueror achiev)
    --
    --for d2:
    --a) normal:
    --single -> enter either d1 or d2 for the first time
    --composed -> complete both d1 and d2 in Normal (and the related id of the associated vanquisher achiev)
    --b) veteran:
    --single ->
    --composed -> complete both d1 and d2 in Veteran (and the related id of the associated vanquisher achiev)

    --3) Add the QuestID: still need to find precisely how to add it on my own from game,
    --usually I find it on https://esoitem.uesp.net/viewlog.php?record=quest
    --(you need the dungeon quest name and then you copy and past the related internalId value).
    --Problem is that sometimes you don't find this value on the site (you need to wait that it gets updated on the site)

    --4) Move the indexes: since two new dungeons are added, the dlc dungeon order is screwed, so:
    --a) go here and find the dlc dungeon that should be the daily one: https://eso-hub.com/en/daily-undaunted-pledges
    --b) Calculate the new index that you need to put in the daily dlc dungeon.
    --To calculate what index should be today, run this code (https://www.lua.org/cgi-bin/demo):
    --function round( val, decimal )
    -- if ( decimal ) then
    --     return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
    -- else
    --     return math.floor(val+0.5)
    -- end
    --end
    --
    --local ORIGIN_TIMESTAMP = 1502690400 --08/14/2017 @ 6:00am (UTC)
    --local URGARLAG_CYCLE = NEW_URGARLAG_CYCLE_GOES_HERE
    --local secondsSinceStart = os.time(os.date("!*t"))- ORIGIN_TIMESTAMP
    --local daysElapsed, dayFraction = math.modf((secondsSinceStart)/86400)
    --local cyclesCount, cycleFraction = math.modf(daysElapsed/URGARLAG_CYCLE)
    --local todayIndex = round(cycleFraction*URGARLAG_CYCLE)
    --print(todayIndex)
    --5) Update UPU.URGARLAG_CYCLE value (new UPU.MAJ_AND_GLIRION_CYCLE = old UPU.MAJ_AND_GLIRION_CYCLE +2)
end
