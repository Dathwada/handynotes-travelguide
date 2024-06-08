----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, ns = ...

local addon = LibStub("AceAddon-3.0"):NewAddon(FOLDER_NAME, "AceEvent-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local AceDB = LibStub("AceDB-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(FOLDER_NAME)
ns.locale = L

addon.constants = ns.constants

_G.HandyNotes_TravelGuide = addon

local IsQuestCompleted = C_QuestLog.IsQuestFlaggedCompleted

local portal_red  = ns.constants.icon.portal_red

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local RetrievindData    = L["handler_tooltip_data"]
local RequiresLevel     = L["handler_tooltip_requires_level"]
local RequiresQuest     = L["handler_tooltip_requires_quest"]
local RequiresRep       = L["handler_tooltip_requires_reputation"]

----------------------------------------------------------------------------------------------------
----------------------------------------------FUNCTIONS---------------------------------------------
----------------------------------------------------------------------------------------------------

-- returns true when all requirements are fulfilled
local function ReqFulfilled(req, ...)
    if (req.quest and not IsQuestCompleted(req.quest))
    or (req.level and (UnitLevel("player") < req.level))
    or (req.spell and not IsSpellKnown(req.spell))
    then
        return false
    end

    if (req.reputation) then
        local _,_,standing = GetFactionInfoByID(req.reputation[1])
        return standing >= req.reputation[2]
    end

    if (req.multiquest) then
        for i, quest in pairs(req.multiquest) do
            if (not IsQuestCompleted(quest)) then return false end
        end
    end

	return true
end

local function RefreshAfter(time)
    C_Timer.After(time, function() addon:Refresh() end)
end

-- workaround to prepare the multilabels with and without notes
-- because the game displays the first line in 14px and
-- the following lines in 13px with a normal for loop.
local function PrepareLabel(label, note, level, quest)
    local t = {}

    for i, name in ipairs(label) do
        local NOTE = ''
        local LEVEL = ''
        local QUEST = ''

        -- set spell name as label
        if (type(name) == "number") then
            name = GetSpellInfo(name)
        end

        -- add additional notes
        if (note and note[i] and ns.db.show_note) then
            NOTE = " ("..note[i]..")"
        end

        -- add required level information
        if (level and level[i] and UnitLevel("player") < level[i]) then
            LEVEL = "\n    |cFFFF0000"..RequiresLevel..": "..level[i].."|r"
        end

        -- add required quest information
        if (quest and quest[i] and not IsQuestCompleted(quest[i])) then
            if (C_QuestLog.GetQuestInfo(quest[i]) ~= nil) then
                local title = C_QuestLog.GetQuestInfo(quest[i])
                QUEST = "\n    |cFFFF0000"..RequiresQuest..": ["..title.."] (ID: "..quest[i]..")|r" -- red
            else
                QUEST = "\n    |cFFFF00FF"..RetrievindData.."|r" -- pink
                RefreshAfter(1) -- Refresh
            end
        end

        -- store everything together
        t[i] = name..NOTE..LEVEL..QUEST
    end

    return table.concat(t, "\n")
end

----------------------------------------------------------------------------------------------------
------------------------------------------------ICON------------------------------------------------
----------------------------------------------------------------------------------------------------

local function SetIcon(node)
    local icon_key = node.icon

    if (icon_key and ns.constants.icon[icon_key]) then
        return ns.constants.icon[icon_key]
    end
end

local function GetIconScale(icon)
    if (icon == "boat" or icon == "aboat") then
        return ns.db["icon_scale_boat"]
    elseif (icon == "zeppelin" or icon == "hzeppelin") then
        return ns.db["icon_scale_zeppelin"]
    end

    return ns.db["icon_scale_"..icon] or ns.db["icon_scale_others"]
end

local function GetIconAlpha(icon)
    if (icon == "boat" or icon == "aboat") then
        return ns.db["icon_alpha_boat"]
    elseif (icon == "zeppelin" or icon == "hzeppelin") then
        return ns.db["icon_alpha_zeppelin"]
    end

    return ns.db["icon_alpha_"..icon] or ns.db["icon_alpha_others"]
end

local GetNodeInfo = function(node)
    local icon

    if (node) then
        local label = node.label or node.multilabel and table.concat(node.multilabel, "\n") or UNKNOWN
        if (node.requirements and not ReqFulfilled(node.requirements)) then
            icon = ((node.icon == "portal") and portal_red)
        else
            icon = SetIcon(node)
        end
        return label, icon, node.icon, node.scale, node.alpha
    end
end

local GetNodeInfoByCoord = function(uMapID, coord)
    return GetNodeInfo(ns.DB.nodes[uMapID] and ns.DB.nodes[uMapID][coord])
end

----------------------------------------------------------------------------------------------------
----------------------------------------------TOOLTIP-----------------------------------------------
----------------------------------------------------------------------------------------------------

local function SetTooltip(tooltip, node)
    local nodereq = node.requirements
    if (node) then
        if (node.label) then
            tooltip:AddLine(node.label)
        end
        if (node.multilabel) then
            if (nodereq) then
                tooltip:AddLine(PrepareLabel(node.multilabel, node.multinote, nodereq.multilevel, nodereq.multiquest))
            else
                tooltip:AddLine(PrepareLabel(node.multilabel, node.multinote))
            end
        end
        if (node.note and profile.show_note) then
            tooltip:AddLine("("..node.note..")")
        end
        if (nodereq) then
            if (nodereq.level and UnitLevel("player") < nodereq.level) then
                tooltip:AddLine(RequiresLevel..": "..nodereq.level, 1) -- red
            end
            if (nodereq.quest and not IsQuestCompleted(nodereq.quest)) then
                if (C_QuestLog.GetQuestInfo(nodereq.quest) ~= nil) then
                    tooltip:AddLine(RequiresQuest..": ["..C_QuestLog.GetQuestInfo(nodereq.quest).."] (ID: "..nodereq.quest..")",1,0,0)
                else
                    tooltip:AddLine(RetrievindData,1,0,1) -- pink
                    C_Timer.After(1, function() addon:Refresh() end) -- Refresh
                    -- print("refreshed")
                end
            end
            if (nodereq.reputation) then
                local name, _, standing, _, _, value = GetFactionInfoByID(nodereq.reputation[1])
                if (standing < nodereq.reputation[2]) then
                    tooltip:AddLine(RequiresRep..": ",1) -- red
                    GameTooltip_ShowProgressBar(tooltip, 0, 21000, value, name..": "..value.." / 21000")
                end
            end
        end
    else
        tooltip:SetText(UNKNOWN)
    end
    tooltip:Show()
end

local SetTooltipByCoord = function(tooltip, uMapID, coord)
    return SetTooltip(tooltip, ns.DB.nodes[uMapID] and ns.DB.nodes[uMapID][coord])
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
    SetTooltipByCoord(tooltip, uMapID, coord)
end

function PluginHandler:OnLeave(uMapID, coord)
    if (self:GetParent() == WorldMapButton) then
        WorldMapTooltip:Hide()
    else
        GameTooltip:Hide()
    end
end

local function hideNode(button, uMapID, coord)
    ns.hidden[uMapID][coord] = true
    addon:Refresh()
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

local function addTomTomWaypoint(button, uMapID, coord)
    if (TomTom) then
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uMapID, x, y, {
            title = GetNodeInfoByCoord(uMapID, coord),
            from = L["handler_context_menu_addon_name"],
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

            if (TomTom and not profile.easy_waypoint) then
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
        if (profile.easy_waypoint and TomTom) then
            addTomTomWaypoint(button, uMapID, coord)
        end
        end
    end
end

do
    local currentMapID = nil
    local function iter(t, prestate)
        if (not t) then return nil end
        local state, value = next(t, prestate)
        while state do
            if (value and ns:ShouldShow(state, value, currentMapID)) then
                local _, icon, iconname, scale, alpha = GetNodeInfo(value)
                    scale = (scale or 1) * GetIconScale(iconname)
                    alpha = (alpha or 1) * GetIconAlpha(iconname)
                return state, nil, icon, scale, alpha
            end
            state, value = next(t, state)
        end
        return nil, nil, nil, nil, nil, nil
    end

    function PluginHandler:GetNodes2(uMapID, minimap)
        currentMapID = uMapID
        return iter, ns.DB.nodes[uMapID], nil
    end

    function ns:ShouldShow(coord, node, currentMapID)
        if (not ns.db.force_nodes) then
            if (ns.hidden[currentMapID] and ns.hidden[currentMapID][coord]) then
                return false
            end
            -- this will check if any node is for specific class
            if (node.class and node.class ~= select(2, UnitClass("player"))) then
                return false
            end
            -- this will check if any node is for specific faction
            if (node.faction and node.faction ~= select(1, UnitFactionGroup("player"))) then
                return false
            end
            if (node.icon == "portal" and not ns.db.show_portal) then return false end
            if (node.icon == "tram" and not ns.db.show_tram) then return false end
            if (node.icon == "boat" and not ns.db.show_boat) then return false end
            if (node.icon == "aboat" and not ns.db.show_aboat) then return false end
            if (node.icon == "zeppelin" and not ns.db.show_zeppelin) then return false end
            if (node.icon == "hzeppelin" and not ns.db.show_hzeppelin) then return false end
        end
        return true
    end
end

---------------------------------------------------------------------------------------------------
----------------------------------------------REGISTER---------------------------------------------
---------------------------------------------------------------------------------------------------

function addon:OnInitialize()
    self.db = AceDB:New("HandyNotes_TravelGuideBCCDB", ns.constants.defaults)

    profile = self.db.profile
    ns.db = profile

    global = self.db.global
    ns.global = global

    ns.hidden = self.db.char.hidden

    if (ns.global.dev) then
        ns.devmode()
    end

    -- Initialize database with HandyNotes
    HandyNotes:RegisterPluginDB(addon.pluginName, PluginHandler, ns.config.options)
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

    if (ns.db.dev and ns.db.show_prints) then
        print(addon.pluginName..": refreshed after ZONE_CHANGED")
    end
end

function events:ZONE_CHANGED_INDOORS(...)
    addon:Refresh()

    if (ns.db.dev and ns.db.show_prints) then
        print(addon.pluginName..": refreshed after ZONE_CHANGED_INDOORS")
    end
end

function events:QUEST_FINISHED(...)
    addon:Refresh()

    if (ns.db.dev and ns.db.show_prints) then
        print(addon.pluginName..": refreshed after QUEST_FINISHED")
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end