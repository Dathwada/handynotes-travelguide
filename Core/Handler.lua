local _G = getfenv(0)
-- Libraries
local string = _G.string
local format, gsub = string.format, string.gsub
local next, wipe, pairs, select, type = next, wipe, pairs, select, type
local GameTooltip, WorldMapTooltip, GetSpellInfo, CreateFrame, UnitClass = _G.GameTooltip, _G.WorldMapTooltip, _G.GetSpellInfo, _G.CreateFrame, _G.UnitClass
local UIDropDownMenu_CreateInfo, CloseDropDownMenus, UIDropDownMenu_AddButton, ToggleDropDownMenu = _G.UIDropDownMenu_CreateInfo, _G.CloseDropDownMenus, _G.UIDropDownMenu_AddButton, _G.ToggleDropDownMenu
local IsQuestCompleted = C_QuestLog.IsQuestFlaggedCompleted
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local LH = LibStub("AceLocale-3.0"):GetLocale("HandyNotes", false)
local AceDB = LibStub("AceDB-3.0")

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceEvent-3.0", "AceTimer-3.0")
addon.constants = private.constants;
addon.constants.addon_name = private.addon_name;

addon.descName = L["HandyNotes: TravelGuide"]
addon.description = L["Shows the portal, zepplin and boat locations on the World Map and the MiniMap."]
addon.pluginName = L["TravelGuide"]

addon.Name = FOLDER_NAME;
_G.HandyNotes_TravelGuide = addon;

local requires = L["Requires"]
local notavailable = L["currently NOT available"]
--local available = L["currently available"] -- not in use

-- //////////////////////////////////////////////////////////////////////////
-- get creature's name from server
local mcache_tooltip = CreateFrame("GameTooltip", private.addon_name.."_mcacheToolTip", UIParent, "GameTooltipTemplate")
local creature_cache

-- activation code
local function getCreatureNamebyID(id)
	mcache_tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	mcache_tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(id))
	creature_cache = _G[private.addon_name.."_mcacheToolTipTextLeft1"]:GetText()
end
-- //////////////////////////////////////////////////////////////////////////
-- get questname from server
local MyScanningTooltip = CreateFrame("GameTooltip", "MyScanningTooltip", UIParent, "GameTooltipTemplate")
local QuestTitleFromID = setmetatable({}, { __index = function(t, id)
	MyScanningTooltip:SetOwner(UIParent, "ANCHOR_NONE")
	MyScanningTooltip:SetHyperlink("quest:"..id)
	local title = MyScanningTooltipTextLeft1:GetText()
	MyScanningTooltip:Hide()
	if title and title ~= RETRIEVING_DATA then
		t[id] = title
		return title
	end
end })
-- //////////////////////////////////////////////////////////////////////////
local function work_out_texture(point)
	local icon_key
	
	if (point.boat) then icon_key = "boat" end
	if (point.aboat) then icon_key = "aboat" end
	if (point.zeppelin) then icon_key = "zeppelin" end
	if (point.hzeppelin) then icon_key = "hzeppelin" end
	if (point.portal) then icon_key = "portal" end
	if (point.mixedportal) then icon_key = "mixedportal" end
	if (point.orderhall) then icon_key = "portal" end
	if (point.worderhall) then icon_key = "worderhall" end
	if (point.tram) then icon_key = "tram" end
	if (point.flightmaster) then icon_key = "flightmaster" end
	if (point.wyrm) then icon_key = "wyrm" end

	if (icon_key and private.constants.icon_texture[icon_key]) then
		return private.constants.icon_texture[icon_key]
	elseif (point.type and private.constants.icon_texture[point.type]) then
		return private.constants.icon_texture[point.type]
	-- use the icon specified in point data
	elseif (point.icon) then
		return point.icon
	else
		return private.constants.defaultIcon
	end
end

local left, right, top, bottom = GetObjectIconTextureCoords("4773") --MagePortalHorde
MagePortalHorde = {
				icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
				tCoordLeft = left,
				tCoordRight = right,
				tCoordTop = top,
				tCoordBottom = bottom,
}

local get_point_info = function(point)
	local icon
	if point then
		local label = point.label or point.label2 or UNKNOWN
		if ((point.portal or point.boat) == true and (point.lvl or point.quest or point.timetravel or point.ttturn)) then
		if (point.portal and point.timetravel) then
			if UnitLevel("player") == 50 then
				if (IsQuestCompleted(point.timetravel) == false and not point.warfront and not point.ttturn) then
					icon = MagePortalHorde
				elseif (IsQuestCompleted(point.timetravel) and point.warfront and not point.ttturn) then
					icon = MagePortalHorde				
				elseif (IsQuestCompleted(point.timetravel) and not point.warfront and point.ttturn) then
					icon = MagePortalHorde
				else
					icon = work_out_texture(point)
				end
			else
				icon = work_out_texture(point)
			end	
		end
		if (point.portal and point.quest) then
			if IsQuestCompleted(point.quest) then
				icon = work_out_texture(point)
			else
				icon = MagePortalHorde
			end
		end
		if (point.boat and point.quest) then
			if IsQuestCompleted(point.quest) then
				icon = work_out_texture(point)
			else
				icon = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\XBoatgrey"
			end
		end
		if point.lvl then
			if point.quest then
				if IsQuestCompleted(point.quest) then
					icon = work_out_texture(point)
				else
					icon = MagePortalHorde
				end
			else
				if (UnitLevel("player") >= point.lvl) then
					icon = work_out_texture(point)
				else
					icon = MagePortalHorde
				end
			end			
		end
		if (point.warfront and point.warfront == "arathi" and UnitLevel("player") == 50) then
			if ((astate == 1 or astate == 2) and point.faction and point.faction == "Alliance" and IsQuestCompleted(point.timetravel) == false) then
				icon = work_out_texture(point)
			elseif ((astate == 3 or astate == 4) and point.faction and point.faction == "Horde"and IsQuestCompleted(point.timetravel) == false) then
				icon = work_out_texture(point)
			else
				icon = MagePortalHorde
			end
		end
		if (point.warfront and point.warfront == "darkshore" and UnitLevel("player") == 50) then
			if ((dstate == 1 or dstate == 2) and point.faction and point.faction == "Alliance" and IsQuestCompleted(point.timetravel) == false) then
				icon = work_out_texture(point)
			elseif ((dstate == 3 or dstate == 4) and point.faction and point.faction == "Horde"and IsQuestCompleted(point.timetravel)== false) then
				icon = work_out_texture(point)
			else
				icon = MagePortalHorde
			end
		end
			else icon = work_out_texture(point)		
		end
			return label, label2, icon, point.scale, point.alpha
	end
end 

local get_point_info_by_coord = function(uMapID, coord)
	return get_point_info(private.DB.points[uMapID] and private.DB.points[uMapID][coord])
end

local function handle_tooltip(tooltip, point)
if ((astate == 4 and dstate == 4) and point.faction and point.faction == "Horde") then
--	warfrontnote = 
	asetnote = 0
	dsetnote = 0
elseif ((astate == 1 or astate == 2) and point.faction and point.faction == "Alliance") then
	warfrontnote = " ".."\n"..notavailable
	asetnote = 0
	dsetnote = 1
elseif ((astate == 3 or astate == 4) and point.faction and point.faction == "Horde") then
	warfrontnote = " ".."\n"..notavailable
	asetnote = 0
	dsetnote = 1
elseif ((dstate == 1 or dstate == 2) and point.faction and point.faction == "Alliance") then
	warfrontnote = notavailable.."\n".." "
	asetnote = 1
	dsetnote = 0
elseif ((dstate == 3 or dstate == 4) and point.faction and point.faction == "Horde") then
	warfrontnote = notavailable.."\n".." "
	asetnote = 1
	dsetnote = 0
else 
	warfrontnote = notavailable.."\n"..notavailable	
	asetnote = 1
	dsetnote = 1
end

	if point then
		local spellName = GetSpellInfo(point.spell)
		if (point.label) then
			if (point.npc) then
				tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
			else
				tooltip:AddLine(point.label)
			end
		end
		if (point.mixedportal) then
			if (profile.show_note) then
				tooltip:AddDoubleLine(point.label1, warfrontnote, nil,nil,nil,1,0,0)
			elseif (not profile.show_note) then
				tooltip:AddDoubleLine(point.label2, warfrontnote, nil,nil,nil,1,0,0)
			end	
		end	
		if (point.label1 and profile.show_note and not point.mixedportal) then
				tooltip:AddLine(point.label1)
			elseif (not point.mixedportal) then
				tooltip:AddLine(point.label2)
			end
		if (point.note and profile.show_note) then
			tooltip:AddLine("("..point.note..")", nil, nil, nil, false) --when true text is wrapping
		end
		if (point.warfront and (point.warfront == "arathi" and asetnote == 1) or (point.warfront == "darkshore" and dsetnote == 1)) then
			tooltip:AddLine(notavailable, 1, 0, 0)
		end
		if (point.lvl and UnitLevel("player") < point.lvl) then
			tooltip:AddLine(L["Requires at least player level: "]..point.lvl, 1, 0, 0, true)
		end
		if (point.quest and profile.query_server and IsQuestCompleted(point.quest) ==false and QuestTitleFromID[point.quest] ~= nil) then
			tooltip:AddLine(L["Unlocked with quest: ["]..QuestTitleFromID[point.quest].."] (ID: "..point.quest..")",1,0,0)
		elseif (point.quest and profile.query_server and IsQuestCompleted(point.quest) ==false and QuestTitleFromID[point.quest] == nil) then
			tooltip:AddLine(L["RETRIEVING DATA..."],1,0,1)	
		end
		if (point.spell and spellName and point.timetravel and UnitLevel("player") == 50) then --down't show this under level 50
			if (IsQuestCompleted(point.timetravel) == false and not point.warfront and not point.ttturn) then
				tooltip:AddLine(requires..': '..spellName, 1, 0, 0) --text red / uncompleted
			elseif (IsQuestCompleted(point.timetravel) and point.warfront and not point.ttturn) then
				tooltip:AddLine(requires..': '..spellName, 1, 0, 0) --text red / uncompleted				
			elseif (IsQuestCompleted(point.timetravel) and not point.warfront and point.ttturn) then
				tooltip:AddLine(requires..': '..spellName, 1, 0, 0) --text red / uncompleted
			end
		end
	else
		tooltip:SetText(UNKNOWN)
	end
	tooltip:Show()
end

local handle_tooltip_by_coord = function(tooltip, uMapID, coord)
	return handle_tooltip(tooltip, private.DB.points[uMapID] and private.DB.points[uMapID][coord])
end

-- //////////////////////////////////////////////////////////////////////////
local PluginHandler = {}
local info = {}

function PluginHandler:OnEnter(uMapID, coord)
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end
	handle_tooltip_by_coord(tooltip, uMapID, coord)
end

function PluginHandler:OnLeave(uMapID, coord)
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

local function hideNode(button, uMapID, coord)
	private.hidden[uMapID][coord] = true
	addon:Refresh()
end

local function closeAllDropdowns()
	CloseDropDownMenus(1)
end

local function addTomTomWaypoint(button, uMapID, coord)
	if TomTom then
		local x, y = HandyNotes:getXY(coord)
		TomTom:AddWaypoint(uMapID, x, y, {
			title = get_point_info_by_coord(uMapID, coord),
			persistent = nil,
			minimap = true,
			world = true
		})
	end
end

do
	local currentMapID = nil
	local currentCoord = nil
	local function generateMenu(button, level)
		if (not level) then return end
		if (level == 1) then
--		local spacer = {text='', disabled=true, notClickable=true, notCheckable=true}
			
			-- Create the title of the menu
			info = UIDropDownMenu_CreateInfo()
			info.isTitle 		= true
			info.text 		= "HandyNotes: " ..addon.pluginName
			info.notCheckable 	= true
			UIDropDownMenu_AddButton(info, level)
			
--			UIDropDownMenu_AddButton(spacer, level)
			
			if TomTom and not profile.easy_waypoint then
				-- Waypoint menu item
				info = UIDropDownMenu_CreateInfo()
				info.text = L["Add to TomTom"]
				info.notCheckable = true
				info.func = addTomTomWaypoint
				info.arg1 = currentMapID
				info.arg2 = currentCoord
				UIDropDownMenu_AddButton(info, level)
			end

			-- Hide menu item
			info = UIDropDownMenu_CreateInfo()
			info.text		= L["Hide this node"] 
			info.notCheckable 	= true
			info.func		= hideNode
			info.arg1		= currentMapID
			info.arg2		= currentCoord
			UIDropDownMenu_AddButton(info, level)
			
--			UIDropDownMenu_AddButton(spacer, level)
			
			-- Close menu item
			info = UIDropDownMenu_CreateInfo()
			info.text		= CLOSE
			info.func		= closeAllDropdowns
			info.notCheckable 	= true
			UIDropDownMenu_AddButton(info, level)
		end
	end
	
	local HL_Dropdown = CreateFrame("Frame", private.addon_name.."DropdownMenu")
	HL_Dropdown.displayMode = "MENU"
	HL_Dropdown.initialize = generateMenu

	function PluginHandler:OnClick(button, down, uMapID, coord)
		if ((down or button ~= "RightButton") and profile.easy_waypoint) then
			return
		end
		if ((button == "RightButton" and not down) and not profile.easy_waypoint) then
			currentMapID = uMapID
			currentCoord = coord
			ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
		end
		if (IsControlKeyDown() and profile.easy_waypoint) then
			currentMapID = uMapID
			currentCoord = coord
			ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
		else
		if profile.easy_waypoint then
			addTomTomWaypoint(button, uMapID, coord)
		end
		end
	end
end

do

local currentMapID = nil
	local function iter(t, prestate)
		if not t then return nil end
		local state, value = next(t, prestate)
		while state do
			if value and private:ShouldShow(state, value, currentMapID) then
				local label, label2, icon, quest, lvl, scale, alpha = get_point_info(value)
				scale = (scale or 1) * (icon and icon.scale or 1) * profile.icon_scale
				alpha = (alpha or 1) * (icon and icon.alpha or 1) * profile.icon_alpha
				return state, nil, icon, scale, alpha
			end
			state, value = next(t, state)
		end
		return nil, nil, nil, nil, nil, nil
	end
	function PluginHandler:GetNodes2(uMapID, minimap)
		currentMapID = uMapID
		return iter, private.DB.points[uMapID], nil
	end
	function private:ShouldShow(coord, point, currentMapID)
		if (private.hidden[currentMapID] and private.hidden[currentMapID][coord]) then
			return false
		end
		-- this will check if any node is for specific class
		if (point.class and point.class ~= select(2, UnitClass("player"))) then
			return false
		end
		-- this will check if any node is for specific faction
		if (point.faction and point.faction ~= select(1, UnitFactionGroup("player"))) then
			return false
		end
		if (point.portal and not private.db.show_portal) then return false; end
		if (point.orderhall and not private.db.show_orderhall) then return false; end
		if (point.worderhall and not private.db.show_orderhall) then return false; end
		if (point.warfront and not private.db.show_warfront) then return false; end
		if (point.mixedportal and not private.db.show_warfront) then return false; end
		if (point.flightmaster and not private.db.show_orderhall) then return false; end
		if (point.tram and not private.db.show_tram) then return false; end
		if (point.boat and not private.db.show_boat) then return false; end
		if (point.aboat and not private.db.show_aboat) then return false; end
		if (point.zeppelin and not private.db.show_zepplin) then return false; end
		if (point.hzeppelin and not private.db.show_hzepplin) then return false; end
		if (point.wyrm and not private.db.show_wyrm) then return false; end
		return true
	end
end

-- //////////////////////////////////////////////////////////////////////////
function addon:OnInitialize()
	self.db = AceDB:New(private.addon_name.."DB", private.constants.defaults)

	profile = self.db.profile
	private.db = profile
	private.hidden = self.db.char.hidden

	-- Initialize database with HandyNotes
	HandyNotes:RegisterPluginDB(addon.pluginName, PluginHandler, private.config.options)
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "WorldEnter");
end

function addon:WorldEnter()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD");
    self:ScheduleTimer("RegisterWithHandyNotes", 2);
	C_Timer.After(5, function()
	end );
end

function addon:RegisterWithHandyNotes()
	astate = C_ContributionCollector.GetState(11)  --Battle for Stromgarde
	dstate = C_ContributionCollector.GetState(118) --Battle for Darkshore
--	astate = 1  --Battle for Stromgarde only for testing
--	dstate = 2  --Battle for Darkshore only for testing
--	print(astate..dstate) --only for testing
end

function addon:Refresh()
	self:SendMessage("HandyNotes_NotifyUpdate", addon.pluginName)
end

function addon:OnEnable()
end

function addon:ZONE_CHANGED()
	addon:Refresh()
end

function addon:ZONE_CHANGED_INDOORS()
	addon:Refresh()
end

function addon:NEW_WMO_CHUNK()
	addon:Refresh()
end

function addon:QUEST_FINISHED()
	addon:Refresh()
end
--[[
function addon:CLOSE_WORLD_MAP()
	closeAllDropdowns()
end

SLASH_TGREFRESH1 = "/tgrefresh"
SlashCmdList["TGREFRESH"] = function(msg)
	addon:Refresh()
	print("TravelGuide refreshed");
end
]]-- //////////////////////////////////////////////////////////////////////////