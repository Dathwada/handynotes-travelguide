local _G = getfenv(0)
local FOLDER_NAME, private = ...
private.addon_name = "HandyNotes_TravelGuide"

local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local constants = {}
private.constants = constants

constants.defaults = {
    profile = {
        icon_scale = 1.5,
        icon_alpha = 1.0,
        query_server = true,
        show_portal = true,
        show_orderhall = true,
        show_warfront = true,
        show_tram = true,
        show_boat = true,
        show_aboat = true,
        show_zepplin = true,
        show_hzepplin = true,
--      show_others = true,
        show_note = true,
        easy_waypoint = true,
        show_gate = true,
        show_tpplatform = true,
        show_herorestgate = true,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

local left, right, top, bottom = GetObjectIconTextureCoords("4772") --MagePortalAlliance
constants.icon_texture = {
    portal = {
        icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
        tCoordLeft = left,
        tCoordRight = right,
        tCoordTop = top,
        tCoordBottom = bottom,
    },
    
    mixedportal   = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Portal_mixed",
    boat 		  = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat",
    aboat 	      = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat_Alliance",
    tram  		  = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Tram",
    flightmaster  = "Interface\\MINIMAP\\TRACKING\\FlightMaster",	
    zeppelin 	  = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin",			
    hzeppelin     = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin_Horde",
    worderhall    = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Warrior",
    gate          = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Wyrm",
    tpplatform      = "Interface\\MINIMAP\\TempleofKotmogu_ball_cyan",
    herosrestgate = {
        icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
        tCoordLeft = 0.607422,
        tCoordRight = 0.638672,
        tCoordTop = 0.666016,
        tCoordBottom = 0.728516,
    },
}