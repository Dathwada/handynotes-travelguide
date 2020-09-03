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
--		show_others = true,
		show_note = true,
		easy_waypoint = true,
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
	mixedportal = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\MixedPortal",
	boat 		= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat",
	aboat 		= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat_Alliance",
	tram  		= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Tram",
	flightmaster = "Interface\\MINIMAP\\TRACKING\\FlightMaster",	
	zeppelin 	= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin",			
	hzeppelin 	= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin_Horde",
	worderhall	= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Warrior",
	wyrm		= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Wyrm",
}	
--[[-------------------------------------NOT IN USE-------------------------------------
vehicle 		= "Interface\\MINIMAP\\Vehicle-Air-Occupied",
valliance		= "Interface\\MINIMAP\\Vehicle-Air-Alliance",
vhorde			= "Interface\\MINIMAP\\Vehicle-Air-Horde",
azeppelin 	= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Zeppelin_Alliance",
molemachine  = "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Molemachine",
tram 		= {
			icon = "Interface\\MINIMAP\\OBJECTICONSATLAS",
			tCoordLeft = 0.532, tCoordRight = 0.561, tCoordTop = 0.935, tCoordBottom = 1 },
			tCoordLeft = 0.563, tCoordRight = 0.594, tCoordTop = 0.931, tCoordBottom = 0.993 },
portal 		= {
			icon = "Interface\\MINIMAP\\OBJECTICONS",
			tCoordLeft = 0.125, tCoordRight = 0.25, tCoordTop = 0.875, tCoordBottom = 1 },
			tCoordLeft = 0.532, tCoordRight = 0.561, tCoordTop = 0.935, tCoordBottom = 0.993 },
aboat 		= {
					icon = "Interface\\MINIMAP\\OBJECTICONSATLAS",
					tCoordLeft = 0.012, tCoordRight = 0.054, tCoordTop = 0.538, tCoordBottom = 0.622 },
	
hboat 		= {
					icon = "Interface\\MINIMAP\\OBJECTICONSATLAS",
					tCoordLeft = 0.012, tCoordRight = 0.055, tCoordTop = 0.665, tCoordBottom = 0.751 },	
hboat 		= "Interface\\AddOns\\HandyNotes_TravelGuide\\Images\\Boat_Horde",
	
]]--