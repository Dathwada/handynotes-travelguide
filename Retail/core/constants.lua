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
--      show_others = true,

        force_nodes = false,
        show_prints = false,
    },
    global = {
        dev = false,
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
local MagePortalAlliance = {
        icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
        tCoordLeft = left,
        tCoordRight = right,
        tCoordTop = top,
        tCoordBottom = bottom,
    }

constants.icon = {
    portal = MagePortalAlliance,
    orderhall = MagePortalAlliance,
    MagePortalHorde = {
        icon = [[Interface\MINIMAP\OBJECTICONSATLAS]],
        tCoordLeft = left2,
        tCoordRight = right2,
        tCoordTop = top2,
        tCoordBottom = bottom2,
    },
    mixedportal   = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\portal_mixed",
    boat          = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\boat",
    aboat         = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\boat_alliance",
    boat_x        = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\boat_grey_x",
    tram          = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\tram",
    flightmaster  = "Interface\\MINIMAP\\TRACKING\\FlightMaster",
    zeppelin      = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\zeppelin",
    hzeppelin     = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\zeppelin_horde",
    worderhall    = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\warrior",
    tpplatform    = "Interface\\MINIMAP\\TempleofKotmogu_ball_cyan",
    herosrestgate = "Interface\\AddOns\\"..FOLDER_NAME.."\\icons\\platform",
}
