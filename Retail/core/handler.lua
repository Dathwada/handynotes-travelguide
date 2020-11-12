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

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local requires          = L["handler_tooltip_requires"]
local notavailable      = L["handler_tooltip_not_available"]
--local available       = L["handler_tooltip_available"] -- not in use
local RequiresPlayerLvl = L["handler_tooltip_requires_level"]
local RequiresQuest     = L["handler_tooltip_quest"]
local RetrievindData    = L["handler_tooltip_data"]
local sanctum_feature   = L["handler_tooltip_sanctum_feature"]
local TNRank            = L["handler_tooltip_TNTIER"]

----------------------------------------------------------------------------------------------------
------------------------------------------------ICON------------------------------------------------
----------------------------------------------------------------------------------------------------

local function work_out_icon(point)
    local icon_key

    for i, k in ipairs({
        "portal", "orderhall", "mixedportal", "boat", "aboat", "zeppelin",
        "hzeppelin", "tram", "flightmaster", "herosrestgate", "tpplatform"
    }) do
        if point[k] then icon_key = k end
    end

    if (icon_key and constantsicon[icon_key]) then
        return constantsicon[icon_key]
    end
end

local get_point_info = function(point)
    local icon
    local MagePortalHorde = constantsicon.MagePortalHorde
    if point then
        local spellName = GetSpellInfo(point.spell)
        local label = point.label or table.concat(point.multilabel, "\n") or spellName or UNKNOWN
        if (point.lvl or point.quest or point.sanctumtalent or point.timetravel or point.spell) and not point.mixedportal then
        if (point.portal and (point.lvl or point.quest or point.timetravel)) then
            if (point.lvl and (UnitLevel("player") < point.lvl)) and (point.quest and not IsQuestCompleted(point.quest)) then
                icon = MagePortalHorde
            elseif (point.timetravel and UnitLevel("player") >= 50 and not IsQuestCompleted(point.timetravel["quest"]) and not point.warfront and not point.timetravel["turn"]) then
                icon = MagePortalHorde
            elseif (point.timetravel and UnitLevel("player") >= 50 and IsQuestCompleted(point.timetravel["quest"]) and point.warfront and not point.timetravel["turn"]) then
                icon = MagePortalHorde
            elseif (point.timetravel and UnitLevel("player") >= 50 and IsQuestCompleted(point.timetravel["quest"]) and not point.warfront and point.timetravel["turn"]) then
                icon = MagePortalHorde
            elseif (point.lvl and (UnitLevel("player") < point.lvl)) then
                icon = MagePortalHorde
            elseif (point.quest and not IsQuestCompleted(point.quest)) then
                icon = MagePortalHorde
            else
                icon = work_out_icon(point)
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
        if (point.warfront and point.warfront == "arathi" and UnitLevel("player") >= 50) then
            if ((astate == 1 or astate == 2) and point.faction == "Alliance" and not IsQuestCompleted(point.timetravel["quest"])) then
                icon = work_out_icon(point)
            elseif ((astate == 3 or astate == 4) and point.faction == "Horde"and not IsQuestCompleted(point.timetravel["quest"])) then
                icon = work_out_icon(point)
            else
                icon = MagePortalHorde
            end
        end
        if (point.warfront and point.warfront == "darkshore" and UnitLevel("player") >= 50) then
            if ((dstate == 1 or dstate == 2) and point.faction == "Alliance" and not IsQuestCompleted(point.timetravel["quest"])) then
                icon = work_out_icon(point)
            elseif ((dstate == 3 or dstate == 4) and point.faction == "Horde" and not IsQuestCompleted(point.timetravel["quest"])) then
                icon = work_out_icon(point)
            else
                icon = MagePortalHorde
            end
        end
            else icon = work_out_icon(point)
        end
            return label, multilabel, icon, point.scale, point.alpha, point.portal, point.orderhall, point.mixedportal, point.zeppelin, point.hzeppelin, point.boat, point.aboat, point.covenant
    end
end

local get_point_info_by_coord = function(uMapID, coord)
    return get_point_info(private.DB.points[uMapID] and private.DB.points[uMapID][coord])
end

----------------------------------------------------------------------------------------------------
----------------------------------------------TOOLTIP-----------------------------------------------
----------------------------------------------------------------------------------------------------

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

    function preparelabel()
    -- workaround to prepare the multilabels with and without notes
    -- because the game displays the first line in 14px and
    -- the following lines in 13px with a normal for loop.
        local label = {}
        for i, name in ipairs(point.multilabel) do
            if (point.multilabel and private.db.show_note) then
                if point.multilabel[i] and point.multinote[i] then
                    label[i] = name.." ("..point.multinote[i]..")"
                else
                    label[i] = name -- if there is no note for this Portal
                end
            else
                label[i] = name -- if the private.db.show_note == false
            end
        end
    return table.concat(label, "\n")
    end

    if point then
        if (point.label) then
            tooltip:AddLine(point.label)
        end
        if point.labelspell then
            local spellName = GetSpellInfo(point.labelspell)
            tooltip:AddLine(spellName)
        end
        if (point.note and private.db.show_note) then
            tooltip:AddLine("("..point.note..")")
        end
        if (point.multilabel and not point.mixedportal) then
            tooltip:AddLine(preparelabel())
        end
        if (point.npc) then
            tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
        end
        if (point.mixedportal) then
            tooltip:AddDoubleLine(preparelabel(), warfrontnote, nil,nil,nil,1) -- only the second line is red
        end
        if (point.warfront and (point.warfront == "arathi" and asetnote == 1) or (point.warfront == "darkshore" and dsetnote == 1)) then
            tooltip:AddLine(notavailable, 1) -- red
        end
        if (point.lvl and UnitLevel("player") < point.lvl) then
            tooltip:AddLine(RequiresPlayerLvl..": "..point.lvl, 1) -- red
        end
        if (point.quest and not IsQuestCompleted(point.quest)) then
            if C_QuestLog.GetTitleForQuestID(point.quest) ~= nil then
                tooltip:AddLine(RequiresQuest..": ["..C_QuestLog.GetTitleForQuestID(point.quest).."] (ID: "..point.quest..")",1,0,0)
            else
                tooltip:AddLine(RetrievindData,1,0,1) -- pink
                C_Timer.After(1, function() addon:Refresh() end) -- Refresh
--              print("refreshed")
            end
        end
        if (point.timetravel and UnitLevel("player") >= 50) then -- don't show this under level 50
            local spellName = GetSpellInfo(point.timetravel["spell"])
            if spellName then
                if (not IsQuestCompleted(point.timetravel["quest"]) and not point.warfront and not point.timetravel["turn"]) then
                    tooltip:AddLine(requires..': '..spellName, 1) -- text red / uncompleted
                elseif (IsQuestCompleted(point.timetravel["quest"]) and point.warfront and not point.timetravel["turn"]) then
                    tooltip:AddLine(requires..': '..spellName, 1) -- text red / uncompleted
                elseif (IsQuestCompleted(point.timetravel["quest"]) and not point.warfront and point.timetravel["turn"]) then
                    tooltip:AddLine(requires..': '..spellName, 1) -- text red / uncompleted
                end
            end
        end
        if (point.spell) then -- don't show this if the spell is known
            local spellName = GetSpellInfo(point.spell)
            local isKnown = IsSpellKnown(point.spell)
            if spellName and not isKnown then
                tooltip:AddLine(requires..': '..spellName, 1) -- red
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
-------------------------------------------PluginHandler--------------------------------------------
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
    if IsAddOnLoaded("TomTom") then
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uMapID, x, y, {
            title = get_point_info_by_coord(uMapID, coord),
            persistent = nil,
            minimap = true,
            world = true
        })
    end
end

--------------------------------------------CONTEXT MENU--------------------------------------------

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

            if IsAddOnLoaded("TomTom") and not private.db.easy_waypoint then
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
        if ((down or button ~= "RightButton") and private.db.easy_waypoint and IsAddOnLoaded("TomTom")) then
            return
        end
        if ((button == "RightButton" and not down) and (not private.db.easy_waypoint or not IsAddOnLoaded("TomTom"))) then
            currentMapID = uMapID
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
        if (IsControlKeyDown() and private.db.easy_waypoint and IsAddOnLoaded("TomTom")) then
            currentMapID = uMapID
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        else
        if private.db.easy_waypoint and IsAddOnLoaded("TomTom") then
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
                local _, _, icon, scale, alpha, portal, orderhall, mixedportal, zeppelin, hzeppelin, boat, aboat, covenant = get_point_info(value)
                if portal or orderhall or mixedportal then
                scale = (scale or 1) * private.db.icon_scale_portal
                alpha = (alpha or 1) * private.db.icon_alpha_portal
                elseif boat or aboat then
                scale = (scale or 1) * private.db.icon_scale_boat
                alpha = (alpha or 1) * private.db.icon_alpha_boat
                elseif zeppelin or hzeppelin then
                scale = (scale or 1) * private.db.icon_scale_zeppelin
                alpha = (alpha or 1) * private.db.icon_alpha_zeppelin
                elseif covenant then
                scale = (scale or 1) * private.db.icon_scale_covenant
                alpha = (alpha or 1) * private.db.icon_alpha_covenant
                else
                scale = (scale or 1) * private.db.icon_scale_others
                alpha = (alpha or 1) * private.db.icon_alpha_others
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
        -- this will check if any node is for specific covenant
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
        return true
    end
end

---------------------------------------------------------------------------------------------------
----------------------------------------------REGISTER---------------------------------------------
---------------------------------------------------------------------------------------------------

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
    astate = C_ContributionCollector.GetState(11)  -- Battle for Stromgarde
    dstate = C_ContributionCollector.GetState(118) -- Battle for Darkshore
--  astate = 1  -- Battle for Stromgarde only for testing
--  dstate = 2  -- Battle for Darkshore only for testing
end

function addon:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", addon.pluginName)
end

function addon:OnEnable()
end

----------------------------------------------EVENTS-----------------------------------------------

local frame, events = CreateFrame("Frame"), {};
function events:ZONE_CHANGED(...)
    addon:Refresh()

    if private.db.dev and private.db.show_prints then
        print("TravelGuide: refreshed after ZONE_CHANGED")
    end
end

function events:ZONE_CHANGED_INDOORS(...)
    addon:Refresh()

    if private.db.dev and private.db.show_prints then
        print("TravelGuide: refreshed after ZONE_CHANGED_INDOORS")
    end
end

function events:QUEST_FINISHED(...)
    addon:Refresh()

    if private.db.dev and private.db.show_prints then
        print("TravelGuide: refreshed after QUEST_FINISHED")
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end