local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("HandyNotes_TravelGuide", "enUS", true, true)

-- https://www.curseforge.com/members/dathwada
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
L["config_portal_desc"] = "Show the Portal locations."

L["config_boat"] = "Boat"
L["config_boat_desc"] = "Show the boat locations."
L["config_boat_alliance"] = "Alliance Boat"
L["config_boat_alliance_desc"] = "Show the Alliance boat locations."

L["config_zeppelin"] = "Zeppelin"
L["config_zeppelin_desc"] = "Show the Zeppelin locations."
L["config_zeppelin_horde"] = "Horde Zeppelin"
L["config_zeppelin_horde_desc"] = "Show the Horde Zeppelin locations."

L["config_tram"] = "Deeprun Tram"
L["config_tram_desc"] = "Show the Deeprun Tram locations in Stormwind and Ironforge."

L["config_note"] = "Note"
L["config_note_desc"] = "Show the node's additional notes when it's available."

L["config_easy_waypoints"] = "Easy Waypoints"
L["config_easy_waypoints_desc"] = "Activates simplified waypoint creation. \nAllows you to set a waypoint by right-clicking and access to more options by CTRL + right-clicking."
L["config_easy_waypoints_requires"] = "Requires"

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

L["handler_tooltip_data"] = "RETRIEVING DATA..."
L["handler_tooltip_requires_quest"] = "Unlocked with quest"
L["handler_tooltip_requires_reputation"] = "Requires reputation with"
L["handler_tooltip_requires_level"] = "Requires at least player level"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

L["Boat to Menethil Harbor"] = true

L["Zeppelin to Undercity"] = true

L["Zeppelin to Stranglethorn Vale"] = true
L["Boat to Booty Bay"] = true

L["Deeprun Tram to Stormwind"] = true

L["Deeprun Tram to Ironforge"] = true

L["Zeppelin to Orgrimmar"] = true

L["Boat to Darnassus"] = true

L["Boat to Ratchet"] = true

L["Boat to Theramore Isle"] = true

L["Boat to Auberdine"] = true

L["Portal to Silvermoon"] = true

L["Portal to Undercity"] = true
L["Orb of translocation"] = true

L["Shattrath Portal to Orgrimmar"] = true

L["Boat to Exodar"] = true
L["Shattrath Portal to Stormwind"] = true

L["Shattrath Portal to Isle of Quel'Danas"] = true

L["To Caverns of Time"] = true
L["Speak with Zephyr"] = true

L["Portal to Darnassus"] = true
L["Portal to Exodar"] = true

L["Portal to Stormwind"] = true
L["Boat to Stormwind"] = true
L["Portal to Orgrimmar"] = true
L["Zeppelin to Thunder Bluff"] = true
L["Portal to the Purple Parlor"] = true
L["Boat to Howling Fjord"] = true
L["Boat to Kamagua"] = true
L["Zeppelin to Howling Fjord"] = true
L["Boat to Borean Tundra"] = true
L["Boat to Unu'pe"] = true
L["Zeppelin to Borean Tundra"] = true
L["Boat to Moa'ki Harbor"] = true
L["Waygate to Sholazar Basin"] = true
L["Waygate to Un'Goro Crater"] = true
L["Portal to Blasted Lands"] = true

L["Dalaran Portal to Caverns of Time"] = true

L["Portal to Deepholm"] = true
L["Portal to Hyjal"] = true
L["Portal to the Firelands"] = true
L["Portal to Temple of Earth"] = true
L["Portal to Therazane's Throne"] = true
L["Portal to Tol Barad"] = true
L["Portal to Twilight Highlands"] = true
L["Portal to Uldum"] = true
L["Portal to Vashj'ir"] = true

L["Portal to Dalaran Crater"] = true
L["Portal to the Sepulcher"] = true
end