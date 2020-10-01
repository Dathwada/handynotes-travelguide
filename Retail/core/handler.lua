----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...

local addon = LibStub("AceAddon-3.0"):NewAddon(FOLDER_NAME, "AceEvent-3.0", "AceTimer-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local AceDB = LibStub("AceDB-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(FOLDER_NAME)
private.locale = L

addon.constants = private.constants

_G.HandyNotes_TravelGuide = addon

local IsQuestCompleted = C_QuestLog.IsQuestFlaggedCompleted
local constantsicon = private.constants.icon

local requires          = L["handler_tooltip_requires"]
local notavailable      = L["handler_tooltip_not_available"]
--local available       = L["handler_tooltip_available"] -- not in use
local RequiresPlayerLvl = L["handler_tooltip_requires_level"]
local RequiresQuest     = L["handler_tooltip_quest"]
local RetrievindData    = L["handler_tooltip_data"]
local sanctum_feature   = L["handler_tooltip_sanctum_feature"]
local TNRank            = L["handler_tooltip_TNTIER"]

----------------------------------------------------------------------------------------------------
-- get creature's name from server
local mcache_tooltip = CreateFrame("GameTooltip", id , UIParent, "GameTooltipTemplate")
local creature_cache

-- activation code
local function getCreatureNamebyID(id)
    mcache_tooltip:SetOwner(UIParent, "ANCHOR_NONE")
    mcache_tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(id))
    creature_cache = _G[FOLDER_NAME.."_mcacheToolTipTextLeft1"]:GetText()
end

----------------------------------------------------------------------------------------------------
local function work_out_icon(point)
    local icon_key

    if (point.boat) then icon_key = "boat" end
    if (point.aboat) then icon_key = "aboat" end
    if (point.zeppelin) then icon_key = "zeppelin" end
    if (point.hzeppelin) then icon_key = "hzeppelin" end
    if (point.portal or point.orderhall) then icon_key = "portal" end
    if (point.mixedportal) then icon_key = "mixedportal" end
    if (point.worderhall) then icon_key = "worderhall" end
    if (point.tram) then icon_key = "tram" end
    if (point.flightmaster) then icon_key = "flightmaster" end
    if (point.herosrestgate) then icon_key = "herosrestgate" end
    if (point.tpplatform) then icon_key = "tpplatform" end
    if (point.necroportal) then icon_key = "necroportal" end
    if (point.platform) then icon_key = "platform" end
    if (point.mushroom) then icon_key = "mushroom" end
    if (point.mirror) then icon_key = "mirror" end
    
    if (icon_key and constantsicon[icon_key]) then
        return constantsicon[icon_key]
    elseif (point.type and constantsicon[point.type]) then
        return constantsicon[point.type]
    -- use the icon specified in point data
    elseif (point.icon) then
        return point.icon
    else
        return private.constants.defaultIcon
    end
end

local get_point_info = function(point)
    local icon
    local MagePortalHorde = constantsicon.MagePortalHorde
    if point then
        local spellName = GetSpellInfo(point.spell)
        local label = point.label or point.label2 or spellName or UNKNOWN
        if ((point.portal or point.orderhall or point.boat or point.mirror or point.mushroom or point.platform or point.necroportal) == true and (point.lvl or point.quest or point.sanctumtalent or point.timetravel or point.spell)) then
        if (point.portal and point.timetravel) then
            if UnitLevel("player") >= 50 then
                if (IsQuestCompleted(point.timetravel) == false and not point.warfront and not point.ttturn) then
                    icon = MagePortalHorde
                elseif (IsQuestCompleted(point.timetravel) and point.warfront and not point.ttturn) then
                    icon = MagePortalHorde
                elseif (IsQuestCompleted(point.timetravel) and not point.warfront and point.ttturn) then
                    icon = MagePortalHorde
                else
                    icon = work_out_icon(point)
                end
            else
                icon = work_out_icon(point)
            end
        end
        if (point.portal and point.quest) then
            if IsQuestCompleted(point.quest) then
                icon = work_out_icon(point)
            else
                icon = MagePortalHorde
            end
        end
        if (point.orderhall and point.spell) then
            if IsSpellKnown(point.spell) then
                icon = work_out_icon(point)
            else
                icon = MagePortalHorde
            end
        end
        if (point.boat and point.quest) then
            if IsQuestCompleted(point.quest) then
                icon = work_out_icon(point)
            else
                icon = constantsicon.boat_X
            end
        end
        if (point.covenant and point.sanctumtalent) then
            local TALENT = C_Garrison.GetTalentInfo(point.sanctumtalent)
            if TALENT["researched"] then
                icon = work_out_icon(point)
            elseif point.platform then
                icon = constantsicon.platform_X
            elseif point.mirror then
                icon = constantsicon.mirror_X
            elseif point.mushroom then
                icon = constantsicon.mushroom_X
            elseif point.necroportal then
                icon = constantsicon.necroportal_X
            end
        end
        if (point.covenant and point.quest) then
            if IsQuestCompleted(point.quest) then
                icon = work_out_icon(point)
            elseif point.platform then
                icon = constantsicon.platform_X
            elseif point.mirror then
                icon = constantsicon.mirror_X
            elseif point.mushroom then
                icon = constantsicon.mushroom_X
            elseif point.necroportal then
                icon = constantsicon.necroportal_X
            end
        end
        if point.lvl then
            if point.quest then
                if IsQuestCompleted(point.quest) then
                    icon = work_out_icon(point)
                else
                    icon = MagePortalHorde
                end
            else
                if (UnitLevel("player") >= point.lvl) then
                    icon = work_out_icon(point)
                else
                    icon = MagePortalHorde
                end
            end
        end
        if (point.warfront and point.warfront == "arathi" and UnitLevel("player") >= 50) then
            if ((astate == 1 or astate == 2) and point.faction == "Alliance" and IsQuestCompleted(point.timetravel) == false) then
                icon = work_out_icon(point)
            elseif ((astate == 3 or astate == 4) and point.faction == "Horde"and IsQuestCompleted(point.timetravel) == false) then
                icon = work_out_icon(point)
            else
                icon = MagePortalHorde
            end
        end
        if (point.warfront and point.warfront == "darkshore" and UnitLevel("player") >= 50) then
            if ((dstate == 1 or dstate == 2) and point.faction == "Alliance" and IsQuestCompleted(point.timetravel) == false) then
                icon = work_out_icon(point)
            elseif ((dstate == 3 or dstate == 4) and point.faction == "Horde"and IsQuestCompleted(point.timetravel)== false) then
                icon = work_out_icon(point)
            else
                icon = MagePortalHorde
            end
        end
            else icon = work_out_icon(point)
        end
            return label, label2, icon, point.scale, point.alpha, point.portal, point.orderhall, point.mixedportal, point.zeppelin, point.hzeppelin, point.boat, point.aboat, point.covenant
    end
end

local get_point_info_by_coord = function(uMapID, coord)
    return get_point_info(private.DB.points[uMapID] and private.DB.points[uMapID][coord])
end

local function handle_tooltip(tooltip, point)
if ((astate == 4 and dstate == 4) and point.faction == "Horde") then
--  warfrontnote = 
    asetnote = 0
    dsetnote = 0
elseif ((astate == 1 or astate == 2) and point.faction == "Alliance") then
    warfrontnote = " ".."\n"..notavailable
    asetnote = 0
    dsetnote = 1
elseif ((astate == 3 or astate == 4) and point.faction == "Horde") then
    warfrontnote = " ".."\n"..notavailable
    asetnote = 0
    dsetnote = 1
elseif ((dstate == 1 or dstate == 2) and point.faction == "Alliance") then
    warfrontnote = notavailable.."\n".." "
    asetnote = 1
    dsetnote = 0
elseif ((dstate == 3 or dstate == 4) and point.faction == "Horde") then
    warfrontnote = notavailable.."\n".." "
    asetnote = 1
    dsetnote = 0
else 
    warfrontnote = notavailable.."\n"..notavailable
    asetnote = 1
    dsetnote = 1
end

    if point then
        if (point.label) then
            tooltip:AddLine(point.label)
        end
        if (point.note and profile.show_note) then
            tooltip:AddLine("("..point.note..")")
        end
        if (point.label1 and profile.show_note and not point.mixedportal) then
                tooltip:AddLine(point.label1)
        elseif (not point.mixedportal) then
                tooltip:AddLine(point.label2)
        end
        if (point.npc) then
            local spellName = GetSpellInfo(point.spell)
            if point.spell and point.npc == true then
                tooltip:AddLine(spellName)
            else
                tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
            end
        end
        if (point.mixedportal) then
            if (profile.show_note) then
                tooltip:AddDoubleLine(point.label1, warfrontnote, nil,nil,nil,1) -- only the second line is red
            elseif (not profile.show_note) then
                tooltip:AddDoubleLine(point.label2, warfrontnote, nil,nil,nil,1) -- only the second line is red
            end
        end
        if (point.warfront and (point.warfront == "arathi" and asetnote == 1) or (point.warfront == "darkshore" and dsetnote == 1)) then
            tooltip:AddLine(notavailable, 1) --red
        end
        if (point.lvl and UnitLevel("player") < point.lvl) then
            tooltip:AddLine(RequiresPlayerLvl..": "..point.lvl, 1) -- red
        end
        if (point.quest and IsQuestCompleted(point.quest) == false) then
            if C_QuestLog.GetTitleForQuestID(point.quest) ~= nil then
                tooltip:AddLine(RequiresQuest..": ["..C_QuestLog.GetTitleForQuestID(point.quest).."] (ID: "..point.quest..")",1,0,0)
            else
                tooltip:AddLine(RetrievindData,1,0,1) -- pink
                C_Timer.After(1, function() addon:Refresh() end) -- Refresh
--              print("refreshed")
            end
        end
        if (point.spell and point.timetravel and UnitLevel("player") >= 50) then --don't show this under level 50
            local spellName = GetSpellInfo(point.spell)
        if spellName then
            if (IsQuestCompleted(point.timetravel) == false and not point.warfront and not point.ttturn) then
                    tooltip:AddLine(requires..': '..spellName, 1) --text red / uncompleted
                elseif (IsQuestCompleted(point.timetravel) and point.warfront and not point.ttturn) then
                    tooltip:AddLine(requires..': '..spellName, 1) --text red / uncompleted
                elseif (IsQuestCompleted(point.timetravel) and not point.warfront and point.ttturn) then
                    tooltip:AddLine(requires..': '..spellName, 1) --text red / uncompleted
                end
            end
        end
        if (point.spell and not point.timetravel and not point.npc == true) then
            local spellName = GetSpellInfo(point.spell)
            if spellName then
                tooltip:AddLine(requires..': '..spellName, 1) --red
            end
        end
        if point.covenant and point.sanctumtalent then
            local TALENT = C_Garrison.GetTalentInfo(point.sanctumtalent)
            if TALENT["researched"] == false then
                L["Tier0"] = TNRank:format('1')
                L["Tier1"] = TNRank:format('2')
                L["Tier2"] = TNRank:format('3')
                tooltip:AddLine(requires.." "..sanctum_feature..":", 1) --red
                tooltip:AddLine(TALENT["name"], 1, 1, 1) --white
                tooltip:AddTexture(TALENT["icon"], {margin={right=2}})
                tooltip:AddLine("   • "..L["Tier"..TALENT["tier"]], 0.6, 0.6, 0.6) --grey
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

----------------------------------------------------------------------------------------------------

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
--      local spacer = {text='', disabled=true, notClickable=true, notCheckable=true}

            -- Create the title of the menu
            info = UIDropDownMenu_CreateInfo()
            info.isTitle = true
            info.text = L["handler_context_menu_addon_name"]
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

--            UIDropDownMenu_AddButton(spacer, level)

            if TomTom and not profile.easy_waypoint then
                -- Waypoint menu item
                info = UIDropDownMenu_CreateInfo()
                info.text = L["handler_context_menu_add_tomtom"]
                info.notCheckable = true
                info.func = addTomTomWaypoint
                info.arg1 = currentMapID
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level)
            end

            -- Hide menu item
            info = UIDropDownMenu_CreateInfo()
            info.text         = L["handler_context_menu_hide_node"]
            info.notCheckable = true
            info.func         = hideNode
            info.arg1         = currentMapID
            info.arg2         = currentCoord
            UIDropDownMenu_AddButton(info, level)

--          UIDropDownMenu_AddButton(spacer, level)

            -- Close menu item
            info = UIDropDownMenu_CreateInfo()
            info.text         = CLOSE
            info.func         = closeAllDropdowns
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)
        end
    end

    local HL_Dropdown = CreateFrame("Frame", FOLDER_NAME.."DropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function PluginHandler:OnClick(button, down, uMapID, coord)
        if ((down or button ~= "RightButton") and profile.easy_waypoint and TomTom) then
            return
        end
        if ((button == "RightButton" and not down) and (not profile.easy_waypoint or not TomTom)) then
            currentMapID = uMapID
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
        if (IsControlKeyDown() and profile.easy_waypoint and TomTom) then
            currentMapID = uMapID
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        else
        if profile.easy_waypoint and TomTom then
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
                local label, label2, icon, scale, alpha, portal, orderhall, mixedportal, zeppelin, hzeppelin, boat, aboat, covenant = get_point_info(value)
                if portal or orderhall or mixedportal then
                scale = (scale or 1) * (icon and icon.scale_portal or 1) * profile.icon_scale_portal
                alpha = (alpha or 1) * (icon and icon.alpha_portal or 1) * profile.icon_alpha_portal
                elseif boat or aboat then
                scale = (scale or 1) * (icon and icon.scale_boat or 1) * profile.icon_scale_boat
                alpha = (alpha or 1) * (icon and icon.alpha_boat or 1) * profile.icon_alpha_boat
                elseif zeppelin or hzeppelin then
                scale = (scale or 1) * (icon and icon.scale_zeppelin or 1) * profile.icon_scale_zeppelin
                alpha = (alpha or 1) * (icon and icon.alpha_zeppelin or 1) * profile.icon_alpha_zeppelin
                elseif covenant then
                scale = (scale or 1) * (icon and icon.scale_covenant or 1) * profile.icon_scale_covenant
                alpha = (alpha or 1) * (icon and icon.alpha_covenant or 1) * profile.icon_alpha_covenant
                else
                scale = (scale or 1) * (icon and icon.scale_others or 1) * profile.icon_scale_others
                alpha = (alpha or 1) * (icon and icon.alpha_others or 1) * profile.icon_alpha_others
                end
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
        if (point.class and point.class ~= select(2, UnitClass("player")) and not private.db.force_nodes) then
            return false
        end
        -- this will check if any node is for specific faction
        if (point.faction and point.faction ~= select(1, UnitFactionGroup("player")) and not private.db.force_nodes) then
            return false
        end
        if (point.covenant and point.covenant ~= C_Covenants.GetActiveCovenantID() and not private.db.force_nodes) then
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
        if (point.zeppelin and not private.db.show_zeppelin) then return false; end
        if (point.hzeppelin and not private.db.show_hzeppelin) then return false; end
        if (point.herosrestgate and not private.db.show_herorestgate) then return false; end
        if (point.tpplatform and not private.db.show_tpplatform) then return false; end
        if (point.covenant and not private.db.show_covenant) then return false; end -- platform, mirror, mushroom, necroportal
        return true
    end
end

----------------------------------------------------------------------------------------------------

function addon:OnInitialize()
    self.db = AceDB:New(FOLDER_NAME.."DB", private.constants.defaults)

    profile = self.db.profile
    private.db = profile
    private.hidden = self.db.char.hidden

    if private.db.dev then
        private.devmode()
    end

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
--  astate = 1  --Battle for Stromgarde only for testing
--  dstate = 2  --Battle for Darkshore only for testing
end

function addon:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", addon.pluginName)
end

function addon:OnEnable()
end

function addon:ZONE_CHANGED()
    addon:Refresh()

    if private.db.show_prints then
        print("TravelGuide: refreshed after ZONE_CHANGED")
    end
end

function addon:ZONE_CHANGED_INDOORS()
    addon:Refresh()
    
    if private.db.show_prints then
        print("TravelGuide: refreshed after ZONE_CHANGED_INDOORS")
    end
end

function addon:NEW_WMO_CHUNK()
    addon:Refresh()
    
    if private.db.show_prints then
        print("TravelGuide: refreshed after NEW_WMO_CHUNK")
    end
end

function addon:QUEST_FINISHED()
    addon:Refresh()
    
    if private.db.show_prints then
        print("TravelGuide: refreshed after QUEST_FINISHED")
    end
end

--[[
function addon:CLOSE_WORLD_MAP()
    closeAllDropdowns()
end


]]