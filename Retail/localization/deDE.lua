local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_TravelGuide", "deDE", false, true)

if not L then return end
-- German Translation by Dathwada EU-Eredar
if L then
----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

L["config_plugin_name"] = "TravelGuide"
L["config_plugin_desc"] = "Zeigt die Positionen von Portalen, Zeppelinen und Schiffen auf der Weltkarte und Minimap an."

L["config_tab_general"] = "Allgemein"
L["config_tab_scale_alpha"] = "Größe / Transparenz"
--L["config_scale_alpha_desc"] = "PH"
L["config_icon_scale"] = "Symbolgröße"
L["config_icon_scale_desc"] = "Die größe der Symbole"
L["config_icon_alpha"] = "Symboltransparenz"
L["config_icon_alpha_desc"] = "Die Transparenz der Symbole"
L["config_what_to_display"] = "Was soll angezeigt werden?"
L["config_what_to_display_desc"] = "Diese Einstellungen legen fest welche Symbole auf der Welt- und Minimap angezeigt werden sollen."

L["config_portal"] = "Portale"
L["config_portal_desc"] = "Zeigt die Positionen von Portalen an."

L["config_order_hall_portal"] = "Ordenshallenportale"
L["config_order_hall_portal_desc"] = "Zeigt die Positionen von Ordenshallenportalen an."

L["config_warfront_portal"] = "Kriegsfrontportale"
L["config_warfront_portal_desc"] = "Zeigt die Positionen von Kriegsfrontportalen an."

L["config_petbattle_portal"] = "Haustierkampfportale"
L["config_petbattle_portal_desc"] = "Zeigt die Positionen von Haustierkampfportalen an."

L["config_ogreWaygate"] = "Ogerportale"
L["config_ogreWaygate_desc"] = "Zeigt die Positionen von Ogerportalen an."

L["config_boat"] = "Schiffe"
L["config_boat_desc"] = "Zeigt die Positionen von Schiffen an."
L["config_boat_alliance"] = "Allianz Schiffe"
L["config_boat_alliance_desc"] = "Zeigt die Positionen von Allianz Schiffen an."

L["config_zeppelin"] = "Zeppeline"
L["config_zeppelin_desc"] = "Zeigt die Positionen von Zeppelinen an."
L["config_zeppelin_horde"] = "Horde Zeppeline"
L["config_zeppelin_horde_desc"] = "Zeigt die Positionen von Horde Zeppelinen an."

L["config_tram"] = "Tiefenbahn"
L["config_tram_desc"] = "Zeigt die Positionen der Tiefenbahn in Sturmwind und Eisenschmiede an."

L["config_note"] = "Notizen"
L["config_note_desc"] = "Zeigt zusätzliche Notizen an, wenn diese verfügbar sind."

L["config_easy_waypoints"] = "Vereinfachte Wegpunkte"
L["config_easy_waypoints_desc"] = "Aktiviert die vereinfachte Wegpunkterstellung. \nErlaubt es per Rechtsklick einen Wegpunkt zu setzen und per STRG + Rechtsklick mehr Optionen aufzurufen."

L["config_teleportPlatform"] = "Teleportplattformen in Oribos"
L["config_teleportPlatform_desc"] = "Zeigt die Positionen von Teleportplattformen in Oribos an."

L["config_animaGateway"] = "Animaportale in der Bastion"
L["config_animaGateway_desc"] = "Zeigt die Positionen von Animaportalen in der Bastion an."

L["config_others"] = "Anderes"
L["config_others_desc"] = "Zeige alle anderen POIs."

L["config_restore_nodes"] = "Versteckte Punkte wiederherstellen"
L["config_restore_nodes_desc"] = "Stellt alle Punkte wieder her, die über das Kontextmenü versteckt wurden."
L["config_restore_nodes_print"] = "Alle versteckten Punkte wurden wiederhergestellt."

----------------------------------------------------------------------------------------------------
-------------------------------------------------DEV------------------------------------------------
----------------------------------------------------------------------------------------------------

L["dev_config_tab"] = "DEV"

L["dev_config_force_nodes"] = "Erzwinge Punkte"
L["dev_config_force_nodes_desc"] = "Erzwingt die Anzeige aller Punkte unabhängig von Klasse, Fraktion oder Pakt."

L["dev_config_show_prints"] = "Zeige print()"
L["dev_config_show_prints_desc"] = "Zeigt print() Nachrichten im Chatfenster an."

----------------------------------------------------------------------------------------------------
-----------------------------------------------HANDLER----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================CONTEXT_MENU==========================================--

L["handler_context_menu_addon_name"] = "HandyNotes: TravelGuide"
L["handler_context_menu_add_tomtom"] = "Zu TomTom hinzufügen"
L["handler_context_menu_hide_node"] = "Verstecke diesen Punkt"

--============================================TOOLTIPS============================================--

L["handler_tooltip_requires"] = "Benötigt"
L["handler_tooltip_sanctum_feature"] = "eine Sanktumaufwertung"
L["handler_tooltip_data"] = "DATEN ABRUFEN..."
L["handler_tooltip_quest"] = "Freigeschaltet mit der Quest"
L["handler_tooltip_requires_level"] = "Benötigt min. Spielerlevel"
L["handler_tooltip_rep"] = "Benötigt Ruf bei"
L["handler_tooltip_TNTIER"] = "Stufe %s des Reisenetzwerks."
L["handler_tooltip_not_available"] = "zurzeit NICHT Verfügbar"
--L["currently available"] = "zurzeit Verfügbar"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================SHADOWLANDS===========================================--

L["Portal to Oribos"] = "Portal nach Oribos"
L["Waystone to Oribos"] = "Portalstein nach Oribos"
L["To Ring of Transference"] = "Zum Ring der Übertragung"
L["To Ring of Fates"] = "Zum Ring der Schicksale"
L["Into the Maw"] = "In den Schlund"
L["To Keeper's Respite"] = "Zur Zuflucht des Hüters"
L["Portal to Torghast"] = "Portal nach Torghast"
L["Portal to Zereth Mortis"] = "Portal nach Zereth Mortis"
L["Portal to Karazhan"] = "Portal nach Karazhan"
L["Portal to Mechagon"] = "Portal nach Mechagon"
L["Portal to Gorgrond"] = "Portal nach Gorgrond"

--============================================Bastion=============================================--

L["Anima Gateway to Hero's rest"] = "Animaportal nach Heldenrast"

-------------------------------------------------BfA------------------------------------------------

L["Portal to Zuldazar"] = "Portal nach Zuldazar"
L["Boat to Zuldazar"] = "Schiff nach Zuldazar"
L["Return to Zuldazar"] = "Zurück nach Zuldazar"
L["Boat to Vol'Dun"] = "Schiff nach Vol'Dun"
L["Boat to Nazmir"] = "Schiff nach Nazmir"
L["Portal to Nazjatar"] = "Portal nach Nazjatar"
L["Submarine to Mechagon"] = "U-Boot nach Mechagon"
L["Portal to Silithus"] = "Portal nach Silithus"

L["Portal to Boralus"] = "Portal nach Boralus"
L["Boat to Boralus"] = "Schiff nach Boralus"
L["Return to Boralus"] = "Zurück nach Boralus"
L["Boat to Drustvar"] = "Schiff nach Drustvar"
L["Boat to Stormsong Valley"] = "Schiff ins Sturmsangtal"
L["Boat to Tiragarde Sound"] = "Schiff zum Tiragardesund"

L["Portal to Arathi Highlands"] = "Portal ins Arathihochland"
L["Portal to Port of Zandalar"] = "Portal zum Hafen von Zandalar"
L["Portal to Darkshore"] = "Portal zur Dunkelküste"
L["Portal to Port of Boralus"] = "Portal zum Hafen von Boralus"

-----------------------------------------------LEGION-----------------------------------------------

L["Portal to Stormheim"] = "Portal nach Sturmheim"
L["Portal to Helheim"] = "Portal nach Helheim"
L["Portal to Dalaran"] = "Portal nach Dalaran"
L["Portal to Azsuna"] = "Portal nach Azsuna"
L["Portal to Val'sharah"] = "Portal nach Val'sharah"
L["Portal to Emerald Dreamway"] = "Portal zum Smaragdgrünen Traumpfad"
L["Portal to Suramar"] = "Portal nach Suramar"
L["Portal to Highmountain"] = "Portal zum Hochberg"
L["Great Eagle to Trueshot Lodge"] = "Großer Adler zur Volltrefferhütte"
L["Jump to Skyhold"] = "Zur Himmelfeste springen"

-------------------------------------------------WoD------------------------------------------------

L["Portal to Warspear"] = "Portal nach Kriegsspeer"
L["Portal to Stormshield"] = "Portal zum Sturmschild"
L["Portal to Vol'mar"] = "Portal nach Vol'mar"
L["Portal to Lion's watch"] = "Portal zur Löwenwacht"
L["Ogre Waygate"] = "Ogerportal"

-------------------------------------------------MoP------------------------------------------------

L["Portal to Jade Forest"] = "Portal zum Jadewald"
L["Portal to Pandaria"] = "Portal nach Pandaria"
L["Portal to Isle of Thunder"] = "Portal zur Insel des Donners"
L["Portal to Shado-Pan Garrison"] = "Portal zur Shado-Pan Garnison"
L["Portal to Peak of Serenity"] = "Portal zum Gipfel der Ruhe"

-------------------------------------------------CATA-----------------------------------------------

L["Portal to Deepholm"] = "Portal nach Tiefenheim"
L["Portal to Temple of Earth"] = "Portal zum Tempel der Erde"
L["Portal to Therazane's Throne"] = "Portal zu Therazanes Thron"
L["Portal to Twilight Highlands"] = "Portal ins Schattenhochland"
L["Portal to Tol Barad"] = "Portal nach Tol Barad"
L["Portal to Uldum"] = "Portal nach Uldum"
L["Portal to Vashj'ir"] = "Portal nach Vashj'ir"
L["Portal to Hyjal"] = "Portal zum Hyjal"

------------------------------------------------WotLK-----------------------------------------------

L["Portal to the Purple Parlor"] = "Portal zum Purpursalon"
L["Boat to Howling Fjord"] = "Schiff in den Heulenden Fjord"
L["Boat to Kamagua"] = "Schiff nach Kamagua"
L["Portal to Howling Fjord"] = "Portal zum Heulenden Fjord"
L["Boat to Borean Tundra"] = "Schiff in die Boreanische Tundra"
L["Boat to Unu'Pe"] = "Schiff nach Unu'pe"
L["Zeppelin to Borean Tundra"] = "Zeppelin in die Boreanische Tundra"
L["Boat to Moa'Ki Harbor"] = "Schiff zum Hafen Moa'ki"
L["Waygate to Sholazar Basin"] = "Tor ins Sholazarbecken"

-------------------------------------------------BC-------------------------------------------------

L["Portal to Hellfire Peninsula"] = "Portal zur Höllenfeuerhalbinsel"
L["Portal to Shattrath"] = "Portal nach Shattrath"
L["Portal to Isle of Quel'Danas"] = "Portal zur Insel von Quel'Danas"
L["Portal to Exodar"] = "Portal zur Exodar"
L["in Exodar"] = true
L["Boat to Exodar"] = "Schiff zur Exodar"
L["Speak with Zephyr"] = "Sprich mit Zephyr"

-----------------------------------------------VANILLA----------------------------------------------

L["Boat to Menethil Harbor"] = "Schiff zum Hafen von Menethil"

L["Portal to Silvermoon"] = "Portal nach Silbermond"

L["Portal to Undercity"] = "Portal nach Unterstadt"
L["Orb of translocation"] = "Translokationskugel"
L["in Undercity Magic Quarter"] = "in Unterstadt im Magieviertel"

L["Zeppelin to Stranglethorn Vale"] = "Zeppelin ins Schlingendorntal"
L["Portal to Stranglethorn Vale"] = "Portal zum Schlingendorntal"
L["Boat to Booty Bay"] = "Schiff nach Beutebucht"

L["Portal to Stormwind"] = "Portal nach Sturmwind"
L["Boat to Stormwind"] = "Schiff nach Sturmwind"
L["Deeprun Tram to Stormwind"] = "Tiefenbahn nach Sturmwind"

L["Portal to Ironforge"] = "Portal nach Eisenschmiede"
L["Deeprun Tram to Ironforge"] = "Tiefenbahn nach Eisenschmiede"

L["Portal to Orgrimmar"] = "Portal nach Orgrimmar"
L["Zeppelin to Orgrimmar"] = "Zeppelin nach Orgrimmar"

L["Portal to Thunder Bluff"] = "Portal nach Donnerfels"
L["Zeppelin to Thunder Bluff"] = "Zeppelin nach Donnerfels"

L["Portal to Darnassus"] = "Portal nach Darnassus"

L["Boat to Ratchet"] = "Schiff nach Ratchet"

L["Boat to Theramore"] = "Schiff nach Theramore"

L["Portal to Caverns of Time"] = "Portal zu den Höhlen der Zeit"

L["Portal to Dalaran Crater"] = "Portal zum Dalaran Krater"
L["Portal to the Sepulcher"] = "Portal zum Grabmal"

L["Waygate to Un'Goro Crater"] = "Tor zum Krater von Un'Goro"
end