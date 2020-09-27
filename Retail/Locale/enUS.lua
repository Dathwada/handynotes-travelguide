local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("HandyNotes_TravelGuide", "enUS", true, true)


if L then
----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

L["config_plugin_name"] = "TravelGuide"
L["config_plugin_desc"] = "Shows the portal, zeppelin and boat locations on the World Map and the MiniMap."

L["config_tab_general"] = "General"
L["config_tab_scale_alpha"] = "Scale / Alpha"
--L["config_scale_alpha_desc"] = "PH"
--L["Icon settings"] = true
--L["These settings control the look and feel of the icon."] = true
L["config_icon_scale"] = "Icon Scale"
L["config_icon_scale_desc"] = "The scale of the icons"
L["config_icon_alpha"] = "Icon Alpha"
L["config_icon_alpha_desc"] = "The alpha transparency of the icons"
L["config_what_to_display"] = "What to display?"
L["config_what_to_display_desc"] = "These settings control what type of icons to be displayed."

L["config_portal"] = "Portal"
L["config_portal_desc"] = "Show the portal locations."

L["config_order_hall_portal"] = "Order Hall Portal"
L["config_order_hall_portal_desc"] = "Show the Order Hall portal locations."

L["config_warfront_portal"] = "Warfront Portal"
L["config_warfront_portal_desc"] = "Show the Warfront portal locations."

L["config_boat"] = "Boat"
L["config_boat_desc"] = "Show the boat locations."
L["config_boat_horde"] = "Horde Boat"
L["config_boat_horde_desc"] = "Show the Horde boat locations."
L["config_boat_alliance"] = "Alliance Boat"
L["config_boat_alliance_desc"] = "Show the Alliance boat locations."

L["config_zeppelin"] = "Zeppelin"
L["config_zeppelin_desc"] = "Show the Zeppelin locations."
L["config_zeppelin_horde"] = "Horde Zeppelin"
L["config_zeppelin_horde_desc"] = "Show the Horde Zeppelin locations."
L["config_zeppelin_alliance"] = "Allianze Zeppelin"
L["config_zeppelin_alliance_desc"] = "Show the Alliance Zeppelin locations."

L["config_deeprun_tram"] = "Deerun Tram"
L["config_deeprun_tram_desc"] = "Show the Deeprun Tram locations in Stormwind and Ironforge."

L["config_note"] = "Note"
L["config_note_desc"] = "Show the node's additional notes when it's available."

L["config_easy_waypoints"] = "Easy Waypoints"
L["config_easy_waypoints_desc"] = "Activates simplified waypoint creation. \nAllows you to set a waypoint by right-clicking and access to more options by CTRL + right-clicking."

L["config_teleport_platform"] = "Teleport platforms"
L["config_teleport_platform_desc"] = "Show the teleport plattform locations."

L["config_anima_gateway"] = "Anima Gateways"
L["config_anima_gateway_desc"] = "Show the anima gateway locations."

L["config_covenant"] = "Covenant Travel Network"
L["config_covenant_desc"] = "Show locations of access points for the covenant travel network."

L["config_others"] = "Others"
L["config_others_desc"] = "Show all the other POIs."

--L["AddOn Settings"] = true
--L["Query from server"] = true
--L["Send query request to server to lookup localized name. May be a little bit slower for the first time lookup but would be very fast once the name is found and cached."] = true
L["config_restore_nodes"] = "Restore hidden nodes"
L["config_restore_nodes_desc"] = "Show all nodes that you have manually hidden by CTRL + right-clicking on them and choosing \"Hide this node\"."
L["config_restore_nodes_print"] = "All hidden nodes have been restored"

----------------------------------------------------------------------------------------------------
-------------------------------------------------DEV------------------------------------------------
----------------------------------------------------------------------------------------------------

L["dev_config_tab"] = "DEV"

L["dev_config_force_nodes"] = "Force Nodes"
L["dev_config_force_nodes_desc"] = "Force the display of all nodes regardless of class, faction or covenant."

L["dev_config_show_prints"] = "Show print()"
L["dev_config_show_prints_desc"] = "Show print() messages in the chat window."

----------------------------------------------------------------------------------------------------
-----------------------------------------------HANDLER----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================CONTEXT_MENU==========================================--

L["handler_context_menu_addon_name"] = "HandyNotes: TravelGuide"
L["handler_context_menu_add_tomtom"] = "Add to TomTom"
L["handler_context_menu_hide_node"] = "Hide this node"

--============================================TOOLTIPS============================================--

L["handler_tooltip_requires"] = "Requires"
L["handler_tooltip_sanctum_feature"] = "a Sanctum Upgrade"
L["handler_tooltip_data"] = "RETRIEVING DATA..."
L["handler_tooltip_quest"] = "Unlocked with quest"
L["handler_tooltip_requires_level"] = "Requires at least player level"
L["handler_tooltip_TNTIER"] = "Tier %s of the travel network."
L["handler_tooltip_not_available"] = "currently NOT available"
--L["handler_tooltip_available"] = "currently available"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================SHADOWLANDS===========================================--

L["Shadowlands"] = true
L["Portal to Oribos"] = true
L["Waystone to Oribos"] = true
L["Oribos"] = true
L["To Ring of Transference"] = true
L["To Ring of Fates"] = true
L["Into the Maw"] = true
L["Portal to Thorghast"] = true
L["Reavendreath"] = true
L["Bastion"] = true
L["Maldraxxus"] = true
L["Ardenweald"] = true
L["The Maw"] = true

--===========================================Maldraxxus===========================================--

L["Nurakkir, House of Eyes"] = true
L["Exoramas, House of Rituals"] = true
L["Overlook, Seat of the Primus"] = true
L["Main Hall, Seat of the Primus"] = true
L["Zerekriss: Maldraxxus"] = true
L["Seat of the Primus"] = true

--============================================Bastion=============================================--

L["Eternal Gateway"] = true
L["Anima Gateway"] = true
L["Anima Gateway to Hero's rest"] = true

--==========================================Ardenweald============================================--

L["RANDOM LOCATION"] = true
L["near Tirna Vaal"] = true
L["near Tirna Scithe"] = true
L["near Dreamsang Fenn"] = true
L["Darkreach"] = true
L["Shimmerbough"] = true
L["Heartwoodgrove"] = true
L["near Hibernal Hollow"] = true

--==========================================Reavendreath==========================================--

L["Sanctuary of the Mad"] = true
L["Ember Ward"] = true
L["Sinfall"] = true
L["The Eternal Terrace"] = true
L["Pridefall Hamlet"] = true
L["The Banewood"] = true
L["Halls of Atonement"] = true
L["Dominance Keep"] = true
L["Feeders' Thicket"] = true

-------------------------------------------------BfA------------------------------------------------

L["Zandalar"] = true
L["Zandalar, Zuldazar"] = true
L["Portal to Zuldazar"] = true
L["Boat to Zuldazar"] = true
L["Return to Zuldazar"] = true
L["Boat to Vol'Dun"] = true
L["Boat to Nazmir"] = true
L["Portal to Nazjatar"] = true
L["Submarine to Mechagon"] = true
L["Portal to Silithus"] = true

L["Kul Tiras"] = true
L["Kul Tiras, Tiragarde Sound"] = true
L["Portal to Boralus"] = true
L["Boat to Boralus"] = true
L["Return to Boralus"] = true
L["Boat to Drustvar"] = true
L["Boat to Stormsong Valley"] = true
L["Boat to Tiragarde Sound"] = true

L["Portal to Arathi Highlands"] = true
L["Portal to Port of Zandalar"] = true
L["Portal to Darkshore"] = true
L["Portal to Port of Boralus"] = true

-----------------------------------------------LEGION-----------------------------------------------

L["Broken Isles"] = true
L["Broken Isles, Stormheim"] = true
L["Portal to Stormheim"] = true
L["Portal to Helheim"] = true
L["Portal to Dalaran"] = true
L["Portal to Azsuna"] = true
L["Portal to Val'sharah"] = true
L["Portal to Emerald Dreamway"] = true
L["Portal to Suramar"] = true
L["Portal to Highmountain"] = true
L["Great Eagle to Trueshot Lodge"] = true
L["Jump to Skyhold"] = true
L["Dalaran"] = true
L["Azsuna"] = true
L["Val'sharah"] = true
L["Suramar"] = true
L["Highmountain"] = true
L["Stormheim"] = true
L["Broken Shore"] = true

-------------------------------------------------WoD------------------------------------------------

L["Portal to Warspear"] = true
L["Portal to Stormshield"] = true
L["Portal to Vol'mar"] = true
L["Portal to Lion's watch"] = true
L["Draenor, Tanaan Jungle"] = true
L["Draenor, Ashran"] = true

-------------------------------------------------MoP------------------------------------------------

L["Pandaria"] = true
L["Pandaria, Kun-Lai Summit"] = true
L["Pandaria, Townlong Steppes"] = true
L["Portal to Jade Forest"] = true
L["Portal to Pandaria"] = true
L["Portal to Isle of Thunder"] = true
L["Portal to Shado-Pan Garrison"] = true
L["Portal to Peak of Serenity"]= true

-------------------------------------------------CATA-----------------------------------------------

L["Maelstrom"] = true
L["Maelstrom, Deepholm"] = true
L["Portal to Deepholm"] = true
L["Portal to Temple of Earth"] = true
L["Portal to Therazane's Throne"] = true
L["Portal to Twilight Highlands"] = true
L["Portal to Tol Barad"] = true
L["Portal to Uldum"] = true
L["Portal to Vashj'ir"] = true
L["Portal to Hyjal"] = true

------------------------------------------------WotLK-----------------------------------------------

L["Northrend, Crystalsong Forest"] = true
L["Portal to the Purple Parlor"] = true
L["Northrend, Howling Fjord"] = true
L["Northrend, Vengeance Landing"] = true
L["Northrend, Valgarde"] = true
L["Boat to Howling Fjord"] = true
L["Boat to Kamagua"] = true
L["Portal to Howling Fjord"] = true
L["Northrend, Borean Tundra"] = true
L["Northrend, Warsong Hold"] = true
L["Northrend, Valiance Keep"] = true
L["Boat to Borean Tundra"] = true
L["Boat to Unu'Pe"] = true
L["Zeppelin to Borean Tundra"] = true
L["Northrend, Dragonblight"] = true
L["Boat to Moa'Ki Harbor"] = true

-------------------------------------------------BC-------------------------------------------------

L["Outland"] = true
L["Outland, Terokkar Forest"] = true
L["Portal to Hellfire Peninsula"] = true
L["Portal to Shattrath"] = true
L["Portal to Isle of Quel'Danas"] = true
L["Kalimdor, Azuremyst Isle"] = true
L["Portal to Exodar"] = true
L["in Exodar"] = true
L["Boat to Exodar"] = true

-----------------------------------------------VANILLA----------------------------------------------

L["Eastern Kingdoms"] = true
L["Eastern Kingdoms, Wetlands"] = true
L["Boat to Menethil Harbor"] = true

L["Eastern Kingdoms, Eversong Woods"] = true
L["Portal to Silvermoon"] = true

L["Eastern Kingdoms, Tirisfal Glades"] = true
L["Portal to Undercity"] = true
L["Orb of translocation"] = true
L["in Undercity Magic Quarter"] = true

L["Eastern Kingdoms, Stranglethorn Vale"] = true
L["Eastern Kingdoms, Grom'gol Base Camp"] = true
L["Zeppelin to Stranglethorn Vale"] = true
L["Portal to Stranglethorn Vale"] = true
L["Boat to Booty Bay"] = true

L["Eastern Kingdoms, Elwynn Forest"] = true
L["Portal to Stormwind"] = true
L["Boat to Stormwind"] = true
L["Deeprun Tram to Stormwind"] = true

L["Eastern Kingdoms, Dun Morogh"] = true
L["Portal to Ironforge"] = true
L["Deeprun Tram to Ironforge"] = true

L["Kalimdor"] = true
L["Kalimdor, Durotar"] = true
L["Portal to Orgrimmar"] = true
L["Zeppelin to Orgrimmar"] = true

L["Kalimdor, Mulgore"] = true
L["Portal to Thunder Bluff"] = true
L["Zeppelin to Thunder Bluff"] = true

L["Kalimdor, Teldrassil"] = true
L["Portal to Darnassus"] = true

L["Kalimdor, Northern Barrens"] = true
L["Boat to Ratchet"] = true

L["Kalimdor, Dustwallow Marsh"] = true
L["Boat to Theramore"] = true

L["Kalimdor, Tanaris"] = true
L["Portal to Caverns of Time"] = true

L["Eastern Kingdoms, Arathi Highlands"] = true
L["Kalimdor, Darkshore"] = true

L["Portal to Dalaran Crater"] = true
L["Eastern Kingdoms, Hillsbrad Foothills"] = true
L["Portal to the Sepulcher"] = true
L["Eastern Kingdoms, Silverpine Forest"] = true
end