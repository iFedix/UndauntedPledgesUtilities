
----------------------------------------------------------------------------------------------------------------------------------
--	Undaunted Pledges Utilities settings panel file  	   				    													--
--	Written by @Carter_DC (EU) / coirier.rom1@gmail.com (initial code) and @iFedix (EU) (current dev) / livio4ever@hotmail.it 	--
----------------------------------------------------------------------------------------------------------------------------------

local LAM = LibStub("LibAddonMenu-2.0")
UndauntedPledgesUtilities = UndauntedPledgesUtilities or {}
local UPU = UndauntedPledgesUtilities

function UPU.CreateSettingsMenu()
--    local pledgeDifficultyMode ={
--     [1] = "NORMAL",     
--     [2] = "VETERAN",
--    [3] = "VETERAN HARD MODE",
--	}
   
	local panelData ={
		type = "panel",
		name = UPU.AddonNameSpaces,
		author = UPU.Author,
		version = UPU.AddonVersion,
		website = UPU.WebSite,
		registerForRefresh = true,
		registerForDefaults = true,
	}
	LAM:RegisterAddonPanel(UPU.AddonName.."_LAM", panelData)

	local optionsTable ={
		[1] = {
			type = "description",
			text = GetString(UPU_MENU_DESCRIPTION), 
		},
		[2] = {
			type = "header",
			name = UPU.Colorize(GetString(UPU_MENU_CMDS)),
			width = "full",
		},
		[3] = {
			type = "description",
			text = GetString(UPU_MENU_CMD_DESCRIPTION),
		},
		[4] = {
			type = "header",
			name = UPU.Colorize(GetString(UPU_MENU_GENERAL)),
			width = "full",
		},
		[5] = {
			type = "colorpicker",
			name = GetString(UPU_MENU_COLOR), --"Main Text Color",
			tooltip = "Default is r=254, g=254, b=254",
			getFunc = function() return UPU.GetMainTextColor() end, 
			setFunc = function(r,g,b,a)
				UPU.SetMainTextColor(r, g, b, a) 
				UPU.sVars.MainTextColor.hex = RGBAToHex(r, g, b)
			end,
			width = "full",
			default = function() return UPU.Default.MainTextColor.r, UPU.Default.MainTextColor.g, UPU.Default.MainTextColor.b, UPU.Default.MainTextColor.a end,
			disabled = false,
		},
		[6] = {
			type = "header",
			name = UPU.Colorize(GetString(UPU_MENU_DAILIES)),
			width = "full",
		},
		[7] = {
			type = "checkbox",
			name = GetString(UPU_MENU_AUTO_ABANDON), --"Auto Abandon",
			tooltip = GetString(UPU_MENU_AUTO_ABANDON_TT), --"Silently abandon all NON COMPLETED undaunted dailies",
			getFunc = function() return UPU.sVars.bAutoDelete end,
			setFunc = function(value)
				UPU.sVars.bAutoDelete = value   
				if value then
					UPU.DeleteNonCompletedDailies()
				end		  
			end,
			default = UPU.defaults.bAutoDelete,
		},
		[8] = {
			type = "checkbox",
			name = GetString(UPU_MENU_DISPLAY_DAILIES), -- "Display Dailies", 
			tooltip = GetString(UPU_MENU_DISPLAY_DAILIES_TT), --"Whether or not the list of dailies will be displayed in the client chat", 
			getFunc = function() return UPU.sVars.bAdvertizeDailies end,
			setFunc = function(value)
				UPU.sVars.bAdvertizeDailies = value            
			end,
			default = UPU.defaults.bAdvertizeDailies,
		},
		[9] = {
			type = "checkbox",
			name = GetString(UPU_MENU_QUICK_DIALOGS),--"Quick Dialogs",
			tooltip = GetString(UPU_MENU_QUICK_DIALOGS_TT),--"Auto accepts and returns quests in npc dialogs",
			getFunc = function() return UPU.sVars.bQuickDialog end,
			setFunc = function(value)
				UPU.sVars.bQuickDialog = value  
				if value then
					EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_CHATTER_BEGIN, UPU.OnChatterBegin)
				else
					EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_CHATTER_BEGIN)
				end
			end,
			default = UPU.defaults.bQuickDialog,
		},
		[10] = {
			type = "checkbox",
			name = GetString(UPU_MENU_CHEST_HELPER), --"Chest Helper",
			tooltip = GetString(UPU_MENU_CHEST_HELPER_TT), --"Displays the list of possible chest Sets.",
			getFunc = function() return UPU.sVars.bDisplayChestHelper end,
			setFunc = function(value)
				UPU.sVars.bDisplayChestHelper = value  
				if value then
					ZO_PreHook(RETICLE, "TryHandlingInteraction", UPU.TryHandlingInteraction)
				end
			end,
			default = UPU.defaults.bDisplayChestHelper,
		},
		[11] = {
			type = "checkbox",
			name = GetString(UPU_MENU_SHOW_LOOT), --"Show Helmet",
			tooltip = GetString(UPU_MENU_SHOW_LOOT_TT), --"Displays the lootable helmets in the dungeons.",
			getFunc = function() return UPU.sVars.bDisplayLootLink end,
			setFunc = function(value)
				UPU.sVars.bDisplayLootLink = value  
			end,
			default = UPU.defaults.bDisplayLootLink,
		},
		[12] = {
			type = "checkbox",
			name = GetString(UPU_MENU_DAILY_DELVE), --"Daily delve",
			tooltip = GetString(UPU_MENU_DAILY_DELVE_TT), --"Shows the daily delve quest in Undaunted Dailies category (default: Guild category)",
			getFunc = function() return UPU.sVars.bIncludeDelves end,
			setFunc = function(value)
				UPU.sVars.bIncludeDelves = value  
				zo_callLater(function() ReloadUI() end, 1000)
			end,
			warning = "ReloadUI",
			default = UPU.defaults.bIncludeDelves,
		},
		[13] = {
			type = "header",
			name = UPU.Colorize(GetString(UPU_ACH_TRACKER)),
			width = "full",
		},
		[14] = {
			type = "checkbox",
			name = GetString(UPU_ACH_ENABLE), --"Enable",
			tooltip = GetString(UPU_ACH_ENABLE_TT), --"Enable the missing achievements info when you enter a dungeon",
			getFunc = function() return UPU.sVars.bEnableAch end,
			setFunc = function(value)
				UPU.sVars.bEnableAch = value  
				if value then
					EVENT_MANAGER:RegisterForEvent( UPU.AddonName, EVENT_ACHIEVEMENT_AWARDED , UPU.OnAchievementAwarded ) 
					EVENT_MANAGER:RegisterForEvent( UPU.AddonName, EVENT_ACTIVITY_FINDER_STATUS_UPDATE, UPU.onStatusUpdate)
					CALLBACK_MANAGER:RegisterCallback("OnWorldMapChanged", UPU.onZoneChanged)
				else
					EVENT_MANAGER:UnregisterForEvent( UPU.AddonName, EVENT_ACHIEVEMENT_AWARDED) 
					EVENT_MANAGER:UnregisterForEvent( UPU.AddonName, EVENT_ACTIVITY_FINDER_STATUS_UPDATE)
					CALLBACK_MANAGER:UnregisterCallback("OnWorldMapChanged", UPU.onZoneChanged)
				end
			end,
			default = UPU.defaults.bEnableAch,
		},
		[15] = {
			type = "checkbox",
			name = GetString(UPU_MENU_SHOW_ACH_ON_AW), --"Show on Achiev Awarded",
			tooltip = GetString(UPU_MENU_SHOW_ACH_ON_AW_TT), --"Show remaining achievements on achievement awarded",
			getFunc = function() return UPU.sVars.bShowOnAchievAwarded end,
			setFunc = function(value)
				UPU.sVars.bShowOnAchievAwarded = value  
			end,
			default = UPU.defaults.bShowOnAchievAwarded,
			disabled = function() return not UPU.sVars.bEnableAch end,
		},
		[16] = {
			type = "checkbox",
			name = GetString(UPU_MENU_COMMON_ACH), --"Common Achievements",
			tooltip = GetString(UPU_MENU_COMMON_ACH_TT), --"Include common achievements to all the dungeons on both difficulties (the achievements in dungeons general category)",
			getFunc = function() return UPU.sVars.bShowCommonAchievs end,
			setFunc = function(value)
				UPU.sVars.bShowCommonAchievs = value  
			end,
			default = UPU.defaults.bShowCommonAchievs,
			disabled = function() return not UPU.sVars.bEnableAch end,
		},
		[17] = {
			type = "checkbox",
			name = GetString(UPU_MENU_COMPOSED_ACH), --"Composed Achievements",
			tooltip = GetString(UPU_MENU_COMPOSED_ACH_TT), --"Include composed achievements (e.g. Complete All Speed Challenges achiev or Vanquisher of the Covenant achiev)",
			getFunc = function() return UPU.sVars.bShowComposedAchievs end,
			setFunc = function(value)
				UPU.sVars.bShowComposedAchievs = value  
			end,
			default = UPU.defaults.bShowComposedAchievs,
			disabled = function() return not UPU.sVars.bEnableAch end,
		},
  }
   
   LAM:RegisterOptionControls(UPU.AddonName.."_LAM", optionsTable)
end


do	
	function UPU.GetMainTextColor()
		return UPU.sVars.MainTextColor.r, UPU.sVars.MainTextColor.g, UPU.sVars.MainTextColor.b, UPU.sVars.MainTextColor.a
	end

	function UPU.SetMainTextColor(r, g, b, a)
		UPU.sVars.MainTextColor.r = r
		UPU.sVars.MainTextColor.g = g 
		UPU.sVars.MainTextColor.b = b 
		UPU.sVars.MainTextColor.a = a 
	end

	function RGBAToHex(r, g, b, a)
	  if r>1 then r=1 end
	  if g>1 then g=1 end
	  if b>1 then b=1 end
	  
	  r = r <= 1 and r >= 0 and r or 0
	  g = g <= 1 and g >= 0 and g or 0
	  b = b <= 1 and b >= 0 and b or 0
	  if a ~= nil then
	  	  return string.format("%02x%02x%02x%02x", UPU.Round(r * 255), UPU.Round(g * 255), UPU.Round(b * 255), UPU.Round(a * 255))
		else
			return string.format("%02x%02x%02x", UPU.Round(r * 255), UPU.Round(g * 255), UPU.Round(b * 255))
		end
	end

	function HexToRGBA( hex )
		local rhex, ghex, bhex, ahex = string.sub(hex, 1, 2), string.sub(hex, 3, 4), string.sub(hex, 5, 6), string.sub(hex, 7, 8)
		return tonumber(rhex, 16)/255, tonumber(ghex, 16)/255, tonumber(bhex, 16)/255
	end
end