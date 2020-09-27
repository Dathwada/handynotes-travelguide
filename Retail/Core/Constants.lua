----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...

local constants = {}
private.constants = constants

----------------------------------------------------------------------------------------------------
----------------------------------------------DEFAULTS----------------------------------------------
----------------------------------------------------------------------------------------------------

constants.defaults = {
    profile = {
        icon_scale_portal = 1.5,
        icon_alpha_portal = 1.0,
        icon_scale_boat = 1.5,
        icon_alpha_boat = 1.0,
        icon_scale_zeppelin = 1.5,
        icon_alpha_zeppelin = 1.0,
        icon_scale_covenant = 1.3,
        icon_alpha_covenant = 1.0,
        icon_scale_others = 1.5,
        icon_alpha_others = 1.0,

        query_server = true,
        show_portal = true,
        show_orderhall = true,
        show_warfront = true,
        show_tram = true,
        show_boat = true,
        show_aboat = true,
        show_zeppelin = true,
        show_hzeppelin = true,
        show_note = true,
        easy_waypoint = true,
        show_tpplatform = true,
        show_herorestgate = true,
        show_covenant = true,
--      show_others = true,

        dev = false,
        force_nodes = false,
        show_prints = false,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

----------------------------------------------------------------------------------------------------
------------------------------------------------ICONS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local left, right, top, bottom = GetObjectIconTextureCoords("4772") --MagePortalAlliance
local left2, right2, top2, bottom2 = GetObjectIconTextureCoords("4773") --MagePortalHorde
constants.icon = {
    portal = {
        icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
        tCoordLeft = left,
        tCoordRight = right,
        tCoordTop = top,
        tCoordBottom = bottom,
    },
    MagePortalHorde = {
        icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
        tCoordLeft = left2,
        tCoordRight = right2,
        tCoordTop = top2,
        tCoordBottom = bottom2,
    },
    mixedportal   = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Portal_mixed",
    boat          = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat",
    aboat         = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat_Alliance",
    boat_X        = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat_grey_X",
    tram          = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Tram",
    flightmaster  = "Interface\\MINIMAP\\TRACKING\\FlightMaster",
    zeppelin      = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin",
    hzeppelin     = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin_Horde",
    worderhall    = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Warrior",
    tpplatform    = "Interface\\MINIMAP\\TempleofKotmogu_ball_cyan",
    herosrestgate = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Platform",
    mirror        = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Mirror",
    mirror_X      = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Mirror_X",
    mushroom      = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Mushroom",
    mushroom_X    = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Mushroom_X",
    necroportal   = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Necroportal",
    necroportal_X = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Necroportal_X",
    platform      = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Platform_Kyrian",
    platform_X    = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Platform_Kyrian_X",
}
