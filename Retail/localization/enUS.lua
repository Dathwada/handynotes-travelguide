local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("HandyNotes_TravelGuide", "enUS", true, true)


if L then
----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

L["config_plugin_name"] = "TravelGuide"
L["config_plugin_desc"] = "Displays the portal, zeppelin and boat locations on the world map and minimap."

L["config_tab_general"] = "General"
L["config_tab_scale_alpha"] = "Scale / Alpha"
--L["config_scale_alpha_desc"] = "PH"
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

L["config_petbattle_portal"] = "Petbattle Portal"
L["config_petbattle_portal_desc"] = "Show the Petbattle portal locations."

L["config_ogreWaygate"] = "Ogre Waygate"
L["config_ogreWaygate_desc"] = "Show the Ogre Waygat portal locations."

L["config_boat"] = "Boat"
L["config_boat_desc"] = "Show the boat locations."
L["config_boat_alliance"] = "Alliance Boat"
L["config_boat_alliance_desc"] = "Show the Alliance boat locations."

L["config_zeppelin"] = "Zeppelin"
L["config_zeppelin_desc"] = "Show the Zeppelin locations."
L["config_zeppelin_horde"] = "Horde Zeppelin"
L["config_zeppelin_horde_desc"] = "Show the Horde Zeppelin locations."

L["config_tram"] = "Deerun Tram"
L["config_tram_desc"] = "Show the Deeprun Tram locations in Stormwind and Ironforge."

L["config_note"] = "Note"
L["config_note_desc"] = "Show the node's additional notes when it's available."

L["config_easy_waypoints"] = "Easy Waypoints"
L["config_easy_waypoints_desc"] = "Activates simplified waypoint creation. \nAllows you to set a waypoint by right-clicking and access to more options by CTRL + right-clicking."

L["config_teleportPlatform"] = "Teleport platforms in Oribos"
L["config_teleportPlatform_desc"] = "Show the teleport plattform locations in Oribos."

L["config_animaGateway"] = "Anima Gateways in Bastion"
L["config_animaGateway_desc"] = "Show the anima gateway locations in Bastion."

L["config_others"] = "Others"
L["config_others_desc"] = "Show all the other POIs."

L["config_restore_nodes"] = "Restore hidden nodes"
L["config_restore_nodes_desc"] = "Restore all nodes that were hidden via the context menu."
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
L["handler_tooltip_rep"] = "Requires reputation with"
L["handler_tooltip_requires_level"] = "Requires at least player level"
L["handler_tooltip_TNTIER"] = "Tier %s of the travel network."
L["handler_tooltip_not_available"] = "currently NOT available"
--L["handler_tooltip_available"] = "currently available"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================SHADOWLANDS===========================================--

L["Portal to Oribos"] = true
L["Waystone to Oribos"] = true
L["To Ring of Transference"] = true
L["To Ring of Fates"] = true
L["Into the Maw"] = true
L["To Keeper's Respite"] = true
L["Portal to Torghast"] = true

--============================================Bastion=============================================--

L["Anima Gateway to Hero's rest"] = true

-------------------------------------------------BfA------------------------------------------------

L["Portal to Zuldazar"] = true
L["Boat to Zuldazar"] = true
L["Return to Zuldazar"] = true
L["Boat to Vol'Dun"] = true
L["Boat to Nazmir"] = true
L["Portal to Nazjatar"] = true
L["Submarine to Mechagon"] = true
L["Portal to Silithus"] = true

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

-------------------------------------------------WoD------------------------------------------------

L["Portal to Warspear"] = true
L["Portal to Stormshield"] = true
L["Portal to Vol'mar"] = true
L["Portal to Lion's watch"] = true
L["Ogre Waygate"] = true

-------------------------------------------------MoP------------------------------------------------

L["Portal to Jade Forest"] = true
L["Portal to Pandaria"] = true
L["Portal to Isle of Thunder"] = true
L["Portal to Shado-Pan Garrison"] = true
L["Portal to Peak of Serenity"]= true

-------------------------------------------------CATA-----------------------------------------------

L["Portal to Deepholm"] = true
L["Portal to Temple of Earth"] = true
L["Portal to Therazane's Throne"] = true
L["Portal to Twilight Highlands"] = true
L["Portal to Tol Barad"] = true
L["Portal to Uldum"] = true
L["Portal to Vashj'ir"] = true
L["Portal to Hyjal"] = true

------------------------------------------------WotLK-----------------------------------------------

L["Portal to the Purple Parlor"] = true
L["Boat to Howling Fjord"] = true
L["Boat to Kamagua"] = true
L["Portal to Howling Fjord"] = true
L["Boat to Borean Tundra"] = true
L["Boat to Unu'Pe"] = true
L["Zeppelin to Borean Tundra"] = true
L["Boat to Moa'Ki Harbor"] = true
L["Waygate to Sholazar Basin"] = true

-------------------------------------------------BC-------------------------------------------------

L["Portal to Hellfire Peninsula"] = true
L["Portal to Shattrath"] = true
L["Portal to Isle of Quel'Danas"] = true
L["Portal to Exodar"] = true
L["in Exodar"] = true
L["Boat to Exodar"] = true
L["Speak with Zephyr"] = true

-----------------------------------------------VANILLA----------------------------------------------

L["Boat to Menethil Harbor"] = true

L["Portal to Silvermoon"] = true

L["Portal to Undercity"] = true
L["Orb of translocation"] = true
L["in Undercity Magic Quarter"] = true

L["Zeppelin to Stranglethorn Vale"] = true
L["Portal to Stranglethorn Vale"] = true
L["Boat to Booty Bay"] = true

L["Portal to Stormwind"] = true
L["Boat to Stormwind"] = true
L["Deeprun Tram to Stormwind"] = true

L["Portal to Ironforge"] = true
L["Deeprun Tram to Ironforge"] = true

L["Portal to Orgrimmar"] = true
L["Zeppelin to Orgrimmar"] = true

L["Portal to Thunder Bluff"] = true
L["Zeppelin to Thunder Bluff"] = true

L["Portal to Darnassus"] = true

L["Boat to Ratchet"] = true

L["Boat to Theramore"] = true

L["Portal to Caverns of Time"] = true

L["Portal to Dalaran Crater"] = true
L["Portal to the Sepulcher"] = true

L["Waygate to Un'Goro Crater"] = true
end