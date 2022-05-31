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

local MagePortalHorde  = private.constants.icon.MagePortalHorde
local BoatX            = private.constants.icon.boat_x

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local requires          = L["handler_tooltip_requires"]
local notavailable      = L["handler_tooltip_not_available"]
--local available       = L["handler_tooltip_available"] -- not in use
local RequiresPlayerLvl = L["handler_tooltip_requires_level"]
local RequiresQuest     = L["handler_tooltip_quest"]
local RequiresRep       = L["handler_tooltip_rep"]
local RetrievindData    = L["handler_tooltip_data"]
local sanctum_feature   = L["handler_tooltip_sanctum_feature"]
local TNRank            = L["handler_tooltip_TNTIER"]

----------------------------------------------------------------------------------------------------
----------------------------------------------FUNCTIONS---------------------------------------------
----------------------------------------------------------------------------------------------------

-- returns the controlling faction
local function GetWarfrontState(id)
    -- Battle for Stromgarde 11, Battle for Darkshore 118
    local state = C_ContributionCollector.GetState(id)

    return (state == 1 or state == 2) and "Alliance" or "Horde"
end

-- returns the note for mixed portals
local function SetWarfrontNote()
    local astate = GetWarfrontState(11) -- Battle for Stromgarde
    local dstate = GetWarfrontState(118) -- Battle for Darkshore

    return (astate ~= select(1, UnitFactionGroup("player")) and notavailable or " ").."\n"..(dstate ~= select(1, UnitFactionGroup("player")) and notavailable or " ")
end

-- returns true when all requirements are fulfilled
local function ReqFulfilled(req, ...)
    if (req.quest and not IsQuestCompleted(req.quest))
    or (req.level and (UnitLevel("player") < req.level))
    or (req.sanctumtalent and not C_Garrison.GetTalentInfo(req.sanctumtalent).researched)
    or (req.timetravel and UnitLevel("player") >= 50 and not IsQuestCompleted(req.timetravel.quest) and not req.warfront and not req.timetravel.turn)
    or (req.timetravel and UnitLevel("player") >= 50 and IsQuestCompleted(req.timetravel.quest) and req.warfront and not req.timetravel.turn)
    or (req.timetravel and UnitLevel("player") >= 50 and IsQuestCompleted(req.timetravel.quest) and not req.warfront and req.timetravel.turn)
    or (req.warfront and GetWarfrontState(req.warfront) ~= select(1, UnitFactionGroup("player")))
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

-- workaround to prepare the multilabels with and without notes
-- because the game displays the first line in 14px and
-- the following lines in 13px with a normal for loop.
local function Prepare(label, note, level, quest)
    local t = {}
    local NOTE
    local LEVEL
    local QUEST

    for i, name in ipairs(label) do

        -- set spell name as label
        if (type(name) == "number") then
            name = GetSpellInfo(name)
        end

        -- add additional notes
        if (note and note[i] and private.db.show_note) then
            NOTE = " ("..note[i]..")"
        else
            NOTE = ''
        end

        -- add required level information
        if (level and level[i] and UnitLevel("player") < level[i]) then
            LEVEL = "\n    |cFFFF0000"..RequiresPlayerLvl..": "..level[i].."|r"
        else
            LEVEL = ''
        end

        -- add required quest information
        if (quest and quest[i] and not IsQuestCompleted(quest[i])) then
            if (C_QuestLog.GetTitleForQuestID(quest[i]) ~= nil) then
                local title = C_QuestLog.GetTitleForQuestID(quest[i])
                QUEST = "\n    |cFFFF0000"..RequiresQuest..": ["..title.."] (ID: "..quest[i]..")|r" -- red
            else
                QUEST = "\n    |cFFFF00FF"..RetrievindData.."|r" -- pink
                C_Timer.After(1, function() addon:Refresh() end) -- Refresh
            end
        else
            QUEST = ''
        end

        -- store everything together
        t[i] = name..NOTE..LEVEL..QUEST
    end

    return table.concat(t, "\n")
end

----------------------------------------------------------------------------------------------------
------------------------------------------------ICON------------------------------------------------
----------------------------------------------------------------------------------------------------

local function SetIcon(point)
    local icon_key = point.icon

    if (icon_key and private.constants.icon[icon_key]) then
        return private.constants.icon[icon_key]
    end
end

local function GetIconScale(icon)
    if (icon == "portal" or icon == "orderhall" or icon == "mixedPortal" or icon == "petBattlePortal" or icon == "ogreWaygate") then
        return private.db["icon_scale_portal"]
    elseif (icon == "boat" or icon == "aboat") then
        return private.db["icon_scale_boat"]
    elseif (icon == "zeppelin" or icon == "hzeppelin") then
        return private.db["icon_scale_zeppelin"]
    end

    return private.db["icon_scale_"..icon] or private.db["icon_scale_others"]
end

local function GetIconAlpha(icon)
    if (icon == "portal" or icon == "orderhall" or icon == "mixedPortal" or icon == "petBattlePortal" or icon == "ogreWaygate") then
        return private.db["icon_alpha_portal"]
    elseif (icon == "boat" or icon == "aboat") then
        return private.db["icon_alpha_boat"]
    elseif (icon == "zeppelin" or icon == "hzeppelin") then
        return private.db["icon_alpha_zeppelin"]
    end

    return private.db["icon_alpha_"..icon] or private.db["icon_alpha_others"]
end

local GetPointInfo = function(point)
    local icon

    if (point) then
        local label = point.label or point.multilabel and Prepare(point.multilabel) or UNKNOWN
        if (point.requirements and not ReqFulfilled(point.requirements)) then
            icon = ((point.icon == "portal" or point.icon == "orderhall" or point.icon == "mixedPortal" or point.icon == "petBattlePortal" or point.icon == "ogreWaygate") and MagePortalHorde) or (point.icon == "boat" and BoatX)
        else
            icon = SetIcon(point)
        end
        return label, icon, point.icon, point.scale, point.alpha
    end
end

local GetPoinInfoByCoord = function(uMapID, coord)
    return GetPointInfo(private.DB.points[uMapID] and private.DB.points[uMapID][coord])
end

----------------------------------------------------------------------------------------------------
----------------------------------------------TOOLTIP-----------------------------------------------
----------------------------------------------------------------------------------------------------

local function SetTooltip(tooltip, point)
    local pointreq = point.requirements
    if (point) then
        if (point.label) then
            tooltip:AddLine(point.label)
        end
        if (point.note and private.db.show_note) then
            tooltip:AddLine("("..point.note..")")
        end
        if (point.multilabel and point.icon ~= "mixedPortal") then
            if (pointreq) then
                tooltip:AddLine(Prepare(point.multilabel, point.multinote, pointreq.multilevel, pointreq.multiquest))
            else
                tooltip:AddLine(Prepare(point.multilabel, point.multinote))
            end
        end
        if (point.npc) then
            tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
        end
        if (point.icon == "mixedPortal") then
            tooltip:AddDoubleLine(Prepare(point.multilabel, point.multinote), SetWarfrontNote(), nil,nil,nil,1) -- only the second line is red
        end
        if (pointreq) then
            if (pointreq.warfront and GetWarfrontState(pointreq.warfront) ~= select(1, UnitFactionGroup("player"))) then
                tooltip:AddLine(notavailable, 1) -- red
            end
            if (pointreq.level and UnitLevel("player") < pointreq.level) then
                tooltip:AddLine(RequiresPlayerLvl..": "..pointreq.level, 1) -- red
            end
            if (pointreq.quest and not IsQuestCompleted(pointreq.quest)) then
                if (not pointreq.hideQuestName) then
                    if (C_QuestLog.GetTitleForQuestID(pointreq.quest) ~= nil) then
                        tooltip:AddLine(RequiresQuest..": ["..C_QuestLog.GetTitleForQuestID(pointreq.quest).."] (ID: "..pointreq.quest..")",1,0,0)
                    else
                        tooltip:AddLine(RetrievindData,1,0,1) -- pink
                        C_Timer.After(1, function() addon:Refresh() end) -- Refresh
                        -- print("refreshed")
                    end
                elseif (pointreq.item) then -- OgreWaygate
                    local name = C_Item.GetItemNameByID(pointreq.item[1]) or "UNKNOWN"
                    local quantity = pointreq.item[2]
                    if (name == "UNKNOWN") then
                        C_Timer.After(1, function() addon:Refresh() end) -- Refresh
                    end
                    tooltip:AddLine(requires..': '..quantity..'x '..name, 1) -- red
                end
            end
            if (pointreq.reputation) then
                local name, _, standing, _, _, value = GetFactionInfoByID(pointreq.reputation[1])
                if (standing < pointreq.reputation[2]) then
                    tooltip:AddLine(RequiresRep..": ",1) -- red
                    GameTooltip_ShowProgressBar(GameTooltip, 0, 21000, value, name..": "..value.." / 21000")
                end
            end
            if (pointreq.timetravel and UnitLevel("player") >= 50) then -- don't show this under level 50
                local spellName = GetSpellInfo(pointreq.timetravel["spell"])
                if (spellName) then
                    if (not IsQuestCompleted(pointreq.timetravel["quest"]) and not pointreq.warfront and not pointreq.timetravel["turn"])
                    or (IsQuestCompleted(pointreq.timetravel["quest"]) and pointreq.warfront and not pointreq.timetravel["turn"])
                    or (IsQuestCompleted(pointreq.timetravel["quest"]) and not pointreq.warfront and pointreq.timetravel["turn"]) then
                        tooltip:AddLine(requires..': '..spellName, 1) -- text red / uncompleted
                    end
                end
            end
            if (pointreq.spell) then -- don't show this if the spell is known
                local spellName = GetSpellInfo(pointreq.spell)
                local isKnown = IsSpellKnown(pointreq.spell)
                if (spellName and not isKnown) then
                    tooltip:AddLine(requires..': '..spellName, 1) -- red
                end
            end
            if (point.covenant and pointreq.sanctumtalent) then
                local TALENT = C_Garrison.GetTalentInfo(pointreq.sanctumtalent)
                if (not TALENT["researched"]) then
                    tooltip:AddLine(requires.." "..sanctum_feature..":", 1) -- red
                    tooltip:AddLine(TALENT["name"], 1, 1, 1) -- white
                    tooltip:AddTexture(TALENT["icon"], {margin={right=2}})
                    tooltip:AddLine("   • "..format(TNRank, TALENT["tier"]+1), 0.6, 0.6, 0.6) -- grey
                end
            end
        end
    else
        tooltip:SetText(UNKNOWN)
    end
    tooltip:Show()
end

local SetTooltipByCoord = function(tooltip, uMapID, coord)
    return SetTooltip(tooltip, private.DB.points[uMapID] and private.DB.points[uMapID][coord])
end

----------------------------------------------------------------------------------------------------
-------------------------------------------PluginHandler--------------------------------------------
----------------------------------------------------------------------------------------------------

local PluginHandler = {}
local info = {}

function PluginHandler:OnEnter(uMapID, coord)
    local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
    if (self:GetCenter() > UIParent:GetCenter()) then -- compare X coordinate
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
    private.hidden[uMapID][coord] = true
    addon:Refresh()
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

local function addTomTomWaypoint(button, uMapID, coord)
    if (IsAddOnLoaded("TomTom")) then
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uMapID, x, y, {
            title = GetPoinInfoByCoord(uMapID, coord),
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
        -- local spacer = {text='', disabled=true, notClickable=true, notCheckable=true}

            -- Create the title of the menu
            info = UIDropDownMenu_CreateInfo()
            info.isTitle = true
            info.text = L["handler_context_menu_addon_name"]
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            -- UIDropDownMenu_AddButton(spacer, level)

            if (IsAddOnLoaded("TomTom") and not private.db.easy_waypoint) then
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

            -- UIDropDownMenu_AddButton(spacer, level)

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
        elseif (private.db.easy_waypoint and IsAddOnLoaded("TomTom")) then
            addTomTomWaypoint(button, uMapID, coord)
        end
    end
end

do
    local currentMapID = nil
    local function iter(t, prestate)
        if (not t) then return nil end
        local state, value = next(t, prestate)
        while state do
            if (value and private:ShouldShow(state, value, currentMapID)) then
                local _, icon, iconname, scale, alpha = GetPointInfo(value)
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
        return iter, private.DB.points[uMapID], nil
    end
    function private:ShouldShow(coord, point, currentMapID)
        if (not private.db.force_nodes) then
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
            -- this will check if any node is for specific covenant
            if (point.covenant and point.covenant ~= C_Covenants.GetActiveCovenantID()) then
                return false
            end
            if (point.icon == "portal" and not private.db.show_portal) then return false end
            if (point.icon == "orderhall" and not private.db.show_orderhall) then return false end
            if (point.icon == "worderhall" and not private.db.show_orderhall) then return false end
            if (point.requirements and point.requirements.warfront and not private.db.show_warfront) then return false end
            if (point.icon == "mixedPortal" and not private.db.show_warfront) then return false end
            if (point.icon == "petBattlePortal" and not private.db.show_petBattlePortal) then return false end
            if (point.icon == "ogreWaygate" and not private.db.show_ogreWaygate) then return false end
            if (point.icon == "flightMaster" and not private.db.show_orderhall) then return false end
            if (point.icon == "tram" and not private.db.show_tram) then return false end
            if (point.icon == "boat" and not private.db.show_boat) then return false end
            if (point.icon == "aboat" and not private.db.show_aboat) then return false end
            if (point.icon == "zeppelin" and not private.db.show_zeppelin) then return false end
            if (point.icon == "hzeppelin" and not private.db.show_hzeppelin) then return false end
            if (point.icon == "animaGateway" and not private.db.show_animaGateway) then return false end
            if (point.icon == "teleportPlatform" and not private.db.show_teleportPlatform) then return false end
        end
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

    global = self.db.global
    private.global = global

    private.hidden = self.db.char.hidden

    if (private.global.dev) then
        private.devmode()
    end

    -- Initialize database with HandyNotes
    HandyNotes:RegisterPluginDB(addon.pluginName, PluginHandler, private.config.options)
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

    if (private.global.dev and private.db.show_prints) then
        print("TravelGuide: refreshed after ZONE_CHANGED")
    end
end

function events:ZONE_CHANGED_INDOORS(...)
    addon:Refresh()

    if (private.global.dev and private.db.show_prints) then
        print("TravelGuide: refreshed after ZONE_CHANGED_INDOORS")
    end
end

function events:QUEST_FINISHED(...)
    addon:Refresh()

    if (private.global.dev and private.db.show_prints) then
        print("TravelGuide: refreshed after QUEST_FINISHED")
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
    frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end