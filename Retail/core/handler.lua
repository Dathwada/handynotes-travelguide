----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, ns = ...

local addon = LibStub("AceAddon-3.0"):NewAddon(FOLDER_NAME, "AceEvent-3.0")
local AceDB = LibStub("AceDB-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HBD = LibStub('HereBeDragons-2.0')
local L = LibStub("AceLocale-3.0"):GetLocale(FOLDER_NAME)
ns.locale = L

_G.HandyNotes_TravelGuide = addon

local IsQuestCompleted = C_QuestLog.IsQuestFlaggedCompleted
local IsQuestCompletedOnAccount = C_QuestLog.IsQuestFlaggedCompletedOnAccount

local portal_red       = ns.constants.icon.portal_red
local portal_mixed     = ns.constants.icon.portal_mixed
local BoatX            = ns.constants.icon.boat_x
local ZeppelinX        = ns.constants.icon.zeppelin_x
local molemachineX     = ns.constants.icon.molemachine_x

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local requires          = L["handler_tooltip_requires"]
local notavailable      = L["handler_tooltip_not_available"]
-- local available       = L["handler_tooltip_available"] -- not in use
local RequiresPlayerLvl = L["handler_tooltip_requires_level"]
local RequiresQuest     = L["handler_tooltip_quest"]
local RequiresRep       = L["handler_tooltip_rep"]
local RequiresToy       = L["handler_tooltip_toy"]
local RetrievingData    = L["handler_tooltip_data"]
local sanctum_feature   = L["handler_tooltip_sanctum_feature"]
local TNRank            = L["handler_tooltip_TNTIER"]

local areaPoisToRemove = {
    -- Alliance
    [5846] = true, -- Vol'dun
    [5847] = true, -- Nazmir
    [5848] = true, -- Zuldazar
    [5873] = true, -- Dustwallow Marsh, Boat to Menethil Harbor, Wetlands
    [5874] = true, -- Wetlands, Boat to Theramore Isle, Dustwallow Marsh
    [5875] = true, -- Wetlands, Boat to Daggercap Bay, Howling Fjord
    [5876] = true, -- Howling Fjord, Boat to Menethil Harbor, Wetlands
    [5877] = true, -- Borean Tundra, Boat to Stormwind City
    [5878] = true, -- Stormwind, Boat to Valiance Keep, Borean Tundra
    [5879] = true, -- Stormwind, Boat to Boralus Harbor, Tiragarde Sound
    [5880] = true, -- Tiragarde Sound, Boat to Stormwind City
    [5892] = true, -- The Jade Forest, Portal to Stormwind City
    [6014] = true, -- Stormwind Portal Room
    [7340] = true, -- Thaldraszus, Boat to Stormwind
    [7335] = true, -- Stormwind, Boat to Dragon Isle
    [8530] = true, -- Founder's Point, Portal to Stormwind

    -- Horde
    [5843] = true, -- Drustvar
    [5844] = true, -- Tiragarde Sound
    [5845] = true, -- Stormsong Valley
    [5883] = true, -- Northern Stranglethorn, Zeppelin to Orgrimmar
    [5884] = true, -- Orgrimmar, Zeppelin to Grom'gol, Schlingendorntal
    [5885] = true, -- Orgrimmar, Zeppelin to Warsong Hold, Borean Tundra
    [5886] = true, -- Borean Tundra, Zeppelin to Orgrimmar
    [5887] = true, -- Echo Isles, Boat to Dazar'alor, Zuldazar
    [5888] = true, -- Zuldazar, Boat to Echo Isles, Durotar
    [5890] = true, -- The Jade Forest, Portal to Orgrimmar
    [6015] = true, -- Orgrimmar Portal Room
    [6138] = true, -- Mechagon
    [7339] = true, -- Thaldraszus, Zeppelin to Orgrimmar
    [7341] = true, -- Durotar, Zeppelin to the Waking Shores, Dragon Isles
    [8529] = true, -- Razorwind Shores, Portal to Orgrimmar

    -- Neutral
    [5881] = true, -- The Cape of Stranglethorn, Boat to Ratschet
    [5882] = true, -- Northern Barrens, Boat to Booty
    [7017] = true, -- Oribos, Portal to Korthia
    [7019] = true, -- Oribos, Portal to Zereth Mortis
    [7020] = true, -- Zereth Mortis, Portalstone to Oribos
    [7944] = true, -- Amirdrassil, Boat to Stormglen
    [7945] = true, -- Gilneas, Boat to Belanaar
    [7959] = true, -- Dustwallow Marsh, Portal to Dalaran
    [7960] = true, -- Dragonblight, Portal to Dalaran
    [7961] = true, -- Searing Gorge, Portal to Dalaran
    [8001] = true, -- Dornogal, Portal to Azj-Kahet
    [8002] = true, -- Azj-Kahet, Portal to Dornogal
    [8003] = true, -- Dornogal, To Ringing Deeps
    [8004] = true, -- Ringing Deeps, to Isle of Dorn (bottom)
    [8006] = true, -- Isle of Dorn, To Ringing Deeps (bottom)
    [8009] = true, -- Isle of Dorn, To Ringing Deeps (top)
    [8010] = true, -- Ringing Deeps, to Isle of Dorn (middle)
    [8171] = true, -- Dornogal, Portal to the Timeways
    [8247] = true, -- Ringing Deeps, Mole Machine to Siren Isle
    [8248] = true, -- Isle of Dorn, Zeppelin to Siren Isle
    [8249] = true, -- Siren Isle, Zeppelin to Dornogal
    [8250] = true, -- Siren Isle, Mole Machine to Gundargaz
    [8230] = true, -- Dornogal, Teleporter to Undermine
    [8231] = true, -- Undermine, Teleporter to Dornogal
    [7919] = true, -- Dornogal, Foundation Hall Portal Room
    [7920] = true, -- Seat of the Aspects, Teleporter to Dornogal
    [8413] = true, -- Dornogal, Portal to Mechagon Island
    [8415] = true, -- Dornogal, Portal to Maldraxxus
    [8416] = true, -- Maldraxxus, Portal to Dornogal
    [8417] = true, -- Dornogal, Portal to K'aresh
    [8414] = true, -- Tazavesh, Portal to Dornogal
}

----------------------------------------------------------------------------------------------------
---------------------------------------------HookScript---------------------------------------------
----------------------------------------------------------------------------------------------------

-- This will remove specified AreaPois on the WorldMapFrame
local function RemoveAreaPOIs()
    if (not ns.db.remove_AreaPois) then return end

    for pin in WorldMapFrame:EnumeratePinsByTemplate("AreaPOIPinTemplate") do
        local areaPoiID = pin.poiInfo.areaPoiID
        if (areaPoisToRemove[areaPoiID]) then
            WorldMapFrame:RemovePin(pin)
            addon:debugmsg("removed AreaPOI "..areaPoiID.." "..pin.poiInfo.name)
        end
    end
end

----------------------------------------------------------------------------------------------------
----------------------------------------------FUNCTIONS---------------------------------------------
----------------------------------------------------------------------------------------------------

local function IsWarfrontActive(id)
    -- Battle for Stromgarde 11, Battle for Darkshore 118
    local state = C_ContributionCollector.GetState(id)
    local controllingFaction = (state == 1 or state == 2) and "Alliance" or "Horde"
    local playerFaction = UnitFactionGroup("player")

    return controllingFaction == playerFaction
end

local function IsMageTowerActive()
    local state = C_ContributionCollector.GetState(1) -- Mage Tower

    return state == 3 -- state == 2 ?
end

-- returns true when all requirements are fulfilled
local function ReqsFulfilled(node)
    local statusText = 'all'
    local reqs = node.requirements
    local PLAYERLVL = UnitLevel("player")
    local REQLVL = reqs.timetravel and reqs.timetravel.level or 50

    if (reqs.quest and not reqs.accquest and not IsQuestCompleted(reqs.quest))
    or (reqs.quest and reqs.accquest and not IsQuestCompletedOnAccount(reqs.quest))
    or (reqs.level and (PLAYERLVL < reqs.level))
    or (reqs.sanctumtalent and not C_Garrison.GetTalentInfo(reqs.sanctumtalent).researched)
    or (reqs.timetravel and PLAYERLVL >= REQLVL and not IsQuestCompleted(reqs.timetravel.quest) and not reqs.warfront and not reqs.timetravel.turn)
    or (reqs.timetravel and PLAYERLVL >= REQLVL and IsQuestCompleted(reqs.timetravel.quest) and reqs.warfront and not reqs.timetravel.turn)
    or (reqs.timetravel and PLAYERLVL >= REQLVL and IsQuestCompleted(reqs.timetravel.quest) and not reqs.warfront and reqs.timetravel.turn)
    or (reqs.warfront and not IsWarfrontActive(reqs.warfront))
    or (reqs.mageTower and not IsMageTowerActive())
    or (reqs.spell and not C_SpellBook.IsSpellInSpellBook(reqs.spell))
    or (reqs.toy and not PlayerHasToy(reqs.toy))
    then
        return "none"
    end

    if (reqs.reputation) then
        local standing = C_Reputation.GetFactionDataByID(reqs.reputation[1]).currentStanding
        statusText = (standing >= reqs.reputation[2]) and 'all' or 'none'
    end

    if (node.multilabel) then
        local checks = { fulfilled = 0 }
        for i, _ in ipairs(node.multilabel) do
            checks[i] = {}

            if (reqs.multiquest and reqs.multiquest[i]) then
                local isAccwide = reqs.multiaccquest and reqs.multiaccquest[i]
                local quest = reqs.multiquest[i]

                checks[i].quest = ((isAccwide and IsQuestCompletedOnAccount(quest)) or IsQuestCompleted(quest))
            end

            if (reqs.multilevel and reqs.multilevel[i]) then
                checks[i].level = (PLAYERLVL >= reqs.multilevel[i])
            end

            if (reqs.multiwarfront and reqs.multiwarfront[i]) then
                checks[i].warfront = IsWarfrontActive(reqs.multiwarfront[i])
            end

            if (checks[i].quest ~= false)
            and (checks[i].level ~= false)
            and (checks[i].warfront ~= false)
            then
                checks.fulfilled = checks.fulfilled + 1
            end
        end

        if checks.fulfilled == #node.multilabel then
            statusText = "all"
        elseif checks.fulfilled > 0 then
            statusText = "some"
        else
            statusText = "none"
        end
    end

    return statusText
end

local function RefreshAfter(time)
    C_Timer.After(time, function() addon:Refresh() end)
end

-- workaround to prepare the multilabels with and without notes
-- because the game displays the first line in 14px and
-- the following lines in 13px with a normal for loop.
local function Prepare(node, onlyLabels)
    local t = {}
    local reqs = node.requirements

    for i, label in ipairs(node.multilabel) do
        local NOTE = ''
        local LEVEL = ''
        local QUEST = ''
        local WARFRONT = ''

        -- set spell name as label
        if (type(label) == "number") then
            label = C_Spell.GetSpellInfo(label).name
        end

        -- add additional notes
        if (not onlyLabels and node.multinote and node.multinote[i] and ns.db.show_note) then
            NOTE = " ("..node.multinote[i]..")"
        end

        if (reqs and not onlyLabels) then

            -- add required level information
            if (reqs.multilevel and reqs.multilevel[i] and UnitLevel("player") < reqs.multilevel[i]) then
                LEVEL = "\n    |cFFFF0000"..RequiresPlayerLvl..": "..reqs.multilevel[i].."|r"
            end

            -- add required warfront information
            if (reqs.multiwarfront and not IsWarfrontActive(reqs.multiwarfront[i])) then
                WARFRONT = "\n    |cFFFF0000"..notavailable.."|r"
            end

            -- add required quest information
            local questID = reqs.multiquest and reqs.multiquest[i]
            local isAccwide = reqs.multiaccquest and reqs.multiaccquest[i]
            if (questID and ((isAccwide and not IsQuestCompletedOnAccount(questID)) or (not isAccwide and not IsQuestCompleted(questID)))) then
                local title = C_QuestLog.GetTitleForQuestID(questID)
                if (title ~= nil) then
                    QUEST = "\n    |cFFFF0000"..RequiresQuest..": ["..title.."] (ID: "..questID..")|r" -- red
                else
                    QUEST = "\n    |cFFFF00FF"..RetrievingData.."|r" -- pink
                    RefreshAfter(1) -- Refresh
                end
            end
        end

        -- store everything together
        t[i] = label..NOTE..LEVEL..QUEST..WARFRONT
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
    if (icon == "portal" or icon == "orderhall" or icon == "warfront" or icon == "petBattlePortal" or icon == "ogreWaygate" or icon == "portal_purple") then
        return ns.db["icon_scale_portal"]
    elseif (icon == "boat" or icon == "aboat") then
        return ns.db["icon_scale_boat"]
    elseif (icon == "zeppelin" or icon == "hzeppelin") then
        return ns.db["icon_scale_zeppelin"]
    end

    return ns.db["icon_scale_"..icon] or ns.db["icon_scale_others"]
end

local function GetIconAlpha(icon)
    if (icon == "portal" or icon == "orderhall" or icon == "warfront" or icon == "petBattlePortal" or icon == "ogreWaygate" or icon == "portal_purple") then
        return ns.db["icon_alpha_portal"]
    elseif (icon == "boat" or icon == "aboat") then
        return ns.db["icon_alpha_boat"]
    elseif (icon == "zeppelin" or icon == "hzeppelin") then
        return ns.db["icon_alpha_zeppelin"]
    end

    return ns.db["icon_alpha_"..icon] or ns.db["icon_alpha_others"]
end

local GetNodeInfo = function(node)
    local icon

    if (node) then
        local label = node.label or node.multilabel and Prepare(node, true) or UNKNOWN
        if (node.requirements and ReqsFulfilled(node) == 'none') then
            icon = ((node.icon == "portal" or node.icon == "orderhall" or node.icon == "warfront" or node.icon == "petBattlePortal" or node.icon == "ogreWaygate" or node.icon == "portal_purple") and portal_red)
            or (node.icon == "boat" and BoatX)
            or (node.icon == "zeppelin" and ZeppelinX)
            or (node.icon == "molemachine" and molemachineX)
        elseif (node.requirements and ReqsFulfilled(node) == 'some') then
            icon = ((node.icon == "portal" or node.icon == "orderhall" or node.icon == "warfront" or node.icon == "petBattlePortal" or node.icon == "ogreWaygate" or node.icon == "portal_purple") and portal_mixed)
            or (node.icon == "boat" and BoatX)
            or (node.icon == "zeppelin" and ZeppelinX)
            or (node.icon == "molemachine" and molemachineX)
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
    if (not node) then
        tooltip:SetText(UNKNOWN)
        tooltip:Show()
        return
    end

    local reqs = node.requirements
    if (node.label) then
        tooltip:AddLine(node.label)
    end
    if (node.note and ns.db.show_note) then
        tooltip:AddLine("("..node.note..")")
    end
    if (node.multilabel) then
        tooltip:AddLine(Prepare(node, false))
    end
    if (node.npc) then
        tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(node.npc))
    end
    if (reqs) then
        if (reqs.level and UnitLevel("player") < reqs.level) then
            tooltip:AddLine(RequiresPlayerLvl..": "..reqs.level, 1) -- red
        end
        if (reqs.quest) then
            local questNotCompleted = (not reqs.accquest and not IsQuestCompleted(reqs.quest))
            local questNotCompletedOnAccount = (reqs.accquest and not IsQuestCompletedOnAccount(reqs.quest))
            if (questNotCompleted or questNotCompletedOnAccount) then
                if (not reqs.hideQuestName) then
                    local questTitle = C_QuestLog.GetTitleForQuestID(reqs.quest)
                    if (questTitle) then
                        tooltip:AddLine(RequiresQuest..": ["..questTitle.."] (ID: "..reqs.quest..")", 1, 0, 0)
                    else
                        tooltip:AddLine(RetrievingData, 1, 0, 1) -- pink
                        RefreshAfter(1) -- Refresh
                    end
                elseif (reqs.item) then -- OgreWaygate
                    local name = C_Item.GetItemNameByID(reqs.item[1]) or RetrievingData
                    local quantity = reqs.item[2]
                    if name == RetrievingData then RefreshAfter(1) end

                    tooltip:AddLine(requires..": "..quantity.."x "..name, 1) -- red
                elseif (node.icon == "molemachine") then
                    tooltip:AddLine(L["handler_tooltip_not_discovered"], 1) -- red
                end
            end
        end
        if (reqs.warfront and not IsWarfrontActive(reqs.warfront)) then
            tooltip:AddLine(notavailable, 1) -- red
        end
        if (reqs.reputation) then
            local reqValuesForStandings = {0, 36000, 39000, 42000, 45000, 51000, 63000, 84000}
            local faction = C_Reputation.GetFactionDataByID(reqs.reputation[1])
            if (faction and faction.reaction < reqs.reputation[2]) then
                local reqValue = reqValuesForStandings[reqs.reputation[2]]
                local value = faction.currentStanding
                tooltip:AddLine(RequiresRep..": ", 1) -- red
                GameTooltip_ShowProgressBar(GameTooltip, 0, reqValue, value, faction.name..": "..value.." / "..reqValue)
            end
        end

        local REQLVL = reqs.timetravel and reqs.timetravel.level or 50
        if (reqs.timetravel and UnitLevel("player") >= REQLVL) then
            local spellName = C_Spell.GetSpellInfo(reqs.timetravel["spell"]).name
            if (spellName) then
                local questCompleted = IsQuestCompleted(reqs.timetravel.quest)
                if (not questCompleted and not reqs.warfront and not reqs.timetravel["turn"])
                or (questCompleted and reqs.warfront and not reqs.timetravel["turn"])
                or (questCompleted and not reqs.warfront and reqs.timetravel["turn"]) then
                    tooltip:AddLine(requires..': '..spellName, 1) -- text red / uncompleted
                end
            end
        end
        if (reqs.spell) then -- don't show this if the spell is known
            local spellName = C_Spell.GetSpellInfo(reqs.spell).name
            local isKnown = C_SpellBook.IsSpellInSpellBook(reqs.spell)
            if (spellName and not isKnown) then
                tooltip:AddLine(requires..': '..spellName, 1) -- red
            end
        end
        if (reqs.toy) then
            local toyName = C_Item.GetItemInfo(reqs.toy) or RetrievingData
            local isKnown = PlayerHasToy(reqs.toy)
            if (toyName == RetrievingData) then RefreshAfter(1) end

            if (not isKnown) then
                tooltip:AddLine(RequiresToy..': '..toyName, 1) -- red
            end
        end
        if (node.covenant and reqs.sanctumtalent) then
            local TALENT = C_Garrison.GetTalentInfo(reqs.sanctumtalent)
            if (not TALENT["researched"]) then
                tooltip:AddLine(requires.." "..sanctum_feature..":", 1) -- red
                tooltip:AddLine(TALENT["name"], 1, 1, 1) -- white
                tooltip:AddTexture(TALENT["icon"], {margin = {right = 2}})
                tooltip:AddLine("   • "..format(TNRank, TALENT["tier"] + 1), 0.6, 0.6, 0.6) -- grey
            end
        end
        if (reqs.mageTower and not IsMageTowerActive()) then
            local _, percentage = C_ContributionCollector.GetState(1)
            local formattedPercentage = format("%d%%", math.floor(percentage * 100))
            local contributionText = format(_G["CONTRIBUTION_POI_TOOLTIP_PERCENTAGE_BUILT"], formattedPercentage)
            tooltip:AddLine(requires.." ".._G["BROKENSHORE_BUILDING_MAGETOWER"] .. " (" .. contributionText .. ")", 1) -- red
        end
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
    ns.hidden[uMapID][coord] = true
    addon:Refresh()
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

local function addTomTomWaypoint(button, uMapID, coord)
    if (C_AddOns.IsAddOnLoaded("TomTom")) then
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

local function addBlizzardWaypoint(button, uMapID, coord)
    local x, y = HandyNotes:getXY(coord)
    local parentMapID = C_Map.GetMapInfo(uMapID)["parentMapID"]
    if (not C_Map.CanSetUserWaypointOnMap(uMapID)) then
        local wx, wy = HBD:GetWorldCoordinatesFromZone(x, y, uMapID)
        uMapID = parentMapID
        x, y = HBD:GetZoneCoordinatesFromWorld(wx, wy, parentMapID)
    end

    C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(uMapID, x, y))
    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
end

--------------------------------------------CONTEXT MENU--------------------------------------------

do
    local currentMapID = nil
    local currentCoord = nil
    local function generateMenu(button, level)
        if (not level) then return end
        if (level == 1) then

            -- Create the title of the menu
            UIDropDownMenu_AddButton({
                isTitle = true,
                text = L["handler_context_menu_addon_name"],
                notCheckable = true
            }, level)

            -- TomTom waypoint menu item
            if (C_AddOns.IsAddOnLoaded("TomTom")) then
                UIDropDownMenu_AddButton({
                    text = L["handler_context_menu_add_tomtom"],
                    notCheckable = true,
                    func = addTomTomWaypoint,
                    arg1 = currentMapID,
                    arg2 = currentCoord
                }, level)
            end

            -- Blizzard waypoint menu item
            UIDropDownMenu_AddButton({
                text = L["handler_context_menu_add_map_pin"],
                notCheckable = true,
                func = addBlizzardWaypoint,
                arg1 = currentMapID,
                arg2 = currentCoord
            }, level)

            -- Hide menu item
            UIDropDownMenu_AddButton({
                text         = L["handler_context_menu_hide_node"],
                notCheckable = true,
                func         = hideNode,
                arg1         = currentMapID,
                arg2         = currentCoord
            }, level)

            -- Close menu item
            UIDropDownMenu_AddButton({
                text         = CLOSE,
                func         = closeAllDropdowns,
                notCheckable = true
            }, level)

        end
    end

    local HL_Dropdown = CreateFrame("Frame", FOLDER_NAME.."DropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function PluginHandler:OnClick(button, down, uMapID, coord)
        local TomTom = select(2, C_AddOns.IsAddOnLoaded('TomTom'))
        local dropdown = ns.db.easy_waypoint_dropdown

        if (down or button ~= "RightButton") then return end

        if (button == "RightButton" and not down and not ns.db.easy_waypoint) then
            currentMapID = uMapID
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        elseif (IsControlKeyDown() and ns.db.easy_waypoint) then
            currentMapID = uMapID
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        elseif (not TomTom or dropdown == 1) then
            addBlizzardWaypoint(button, uMapID, coord)
        elseif (TomTom and dropdown == 2) then
            addTomTomWaypoint(button, uMapID, coord)
        else
            addBlizzardWaypoint(button, uMapID, coord)
            if (TomTom) then addTomTomWaypoint(button, uMapID, coord) end
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
            if (ns.hidden[currentMapID] and ns.hidden[currentMapID][coord]) then return false end
            if (node.requirements and ns.db.remove_unknown and ReqsFulfilled(node) ~= 'all') then return false end
            if (node.class and node.class ~= select(2, UnitClass("player"))) then return false end
            if (node.faction and node.faction ~= select(1, UnitFactionGroup("player"))) then return false end
            if (node.race and node.race ~= select(2, UnitRace("player"))) then return false end
            if (node.covenant and node.covenant ~= C_Covenants.GetActiveCovenantID()) then return false end
            if (node.icon == "portal" and not ns.db.show_portal) then return false end
            if (node.icon == "orderhall" and not ns.db.show_orderhall) then return false end
            if (node.icon == "worderhall" and not ns.db.show_orderhall) then return false end
            if (node.icon == "warfront" and not ns.db.show_warfront) then return false end
            if (node.icon == "petBattlePortal" and not ns.db.show_petBattlePortal) then return false end
            if (node.icon == "ogreWaygate" and not ns.db.show_ogreWaygate) then return false end
            if (node.icon == "portal_purple" and not ns.db.show_reflectivePortal) then return false end
            if (node.icon == "flightMaster" and not ns.db.show_orderhall) then return false end
            if (node.icon == "tram" and not ns.db.show_tram) then return false end
            if (node.icon == "boat" and not ns.db.show_boat) then return false end
            if (node.icon == "aboat" and not ns.db.show_aboat) then return false end
            if (node.icon == "zeppelin" and not ns.db.show_zeppelin) then return false end
            if (node.icon == "hzeppelin" and not ns.db.show_hzeppelin) then return false end
            if (node.icon == "animaGateway" and not ns.db.show_animaGateway) then return false end
            if (node.icon == "teleportPlatform" and not ns.db.show_teleportPlatform) then return false end
            if (node.icon == "molemachine" and not ns.db.show_molemachine) then return false end
        end
        return true
    end
end

---------------------------------------------------------------------------------------------------
----------------------------------------------REGISTER---------------------------------------------
---------------------------------------------------------------------------------------------------

function addon:OnInitialize()
    self.db = AceDB:New(FOLDER_NAME.."DB", ns.constants.defaults, true)
    self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")

    ns.db = self.db.profile
    ns.global = self.db.global
    ns.hidden = self.db.char.hidden

    -- Initialize database with HandyNotes
    HandyNotes:RegisterPluginDB(addon.pluginName, PluginHandler, ns.config.options)

    -- Get the option table for profiles
    ns.config.options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
    ns.config.options.args.profiles.order = 2

    -- Get the options table for development
    if (ns.global.dev) then ns.devmode() end
end

function addon:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", addon.pluginName)
end

function addon:OnEnable()
end

function addon:OnProfileChanged(event, database, newProfileKey)
    ns.db = database.profile
    self:Refresh()
end

----------------------------------------------EVENTS-----------------------------------------------

local frame, events = CreateFrame("Frame"), {};
function events:ZONE_CHANGED(...)
    addon:Refresh()

    addon:debugmsg("refreshed after ZONE_CHANGED")
end

function events:ZONE_CHANGED_INDOORS(...)
    addon:Refresh()

    addon:debugmsg("refreshed after ZONE_CHANGED_INDOORS")
end

function events:QUEST_FINISHED(...)
    addon:Refresh()

    addon:debugmsg("refreshed after QUEST_FINISHED")
end

function events:PLAYER_LOGIN(...)
    -- Hook the RefreshAllData() function of the "AreaPOIPinTemplate" data provider
    for dp in pairs(WorldMapFrame.dataProviders) do
        if (not dp.GetPinTemplates and type(dp.GetPinTemplate) == "function") then
            if (dp:GetPinTemplate() == "AreaPOIPinTemplate") then
                hooksecurefunc(dp, "RefreshAllData", RemoveAreaPOIs)
            end
        end
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
    frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end
