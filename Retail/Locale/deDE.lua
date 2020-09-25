local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_TravelGuide", "deDE", false, true)

if not L then return end
--German Translation by Dathwada EU-Eredar
if L then
----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

L["config_plugin_name"] = "TravelGuide"
L["config_plugin_desc"] = "Zeigt die Positionen von Portalen, Zeppelinen und Schiffen auf der Worldmap und der Minimap an."

L["config_tab_general"] = "Allgemein"
L["config_tab_scale_alpha"] = "Größe / Transparenz"
--L["config_scale_alpha_desc"] = "PH"
--L["Icon settings"] = "Symboleinstellungen"
--L["These settings control the look and feel of the icon."] = "Diese Einstellungen legen das Aussehen der Symbole fest."
L["config_icon_scale"] = "Symbolgröße"
L["config_icon_scale_desc"] = "Die größe der Symbole"
L["config_icon_alpha"] = "Symboltranzparenz"
L["config_icon_alpha_desc"] = "Die Transparenz der Symbole"
L["config_what_to_display"] = "Was soll angezeigt werden?"
L["config_what_to_display_desc"] = "Diese Einstellungen legen fest welche Symbole auf der Welt- und Minimap angezeigt werden sollen."

L["config_portal"] = "Portale"
L["config_portal_desc"] = "Zeigt die Positionen von Portalen an."

L["config_order_hall_portal"] = "Ordenshallenportale"
L["config_order_hall_portal_desc"] = "Zeigt die Positionen von Ordenshallenportalen an."

L["config_warfront_portal"] = "Kriegsfrontportale"
L["config_warfront_portal_desc"] = "Zeigt die Positionen von Kriegsfrontportalen an."

L["config_boat"] = "Schiffe"
L["config_boat_desc"] = "Zeigt die Positionen von Schiffen an."
L["config_boat_horde"] = "Horde Schiffe"
L["config_boat_horde_desc"] = "Zeigt die Positionen von Horde Schiffen an."
L["config_boat_alliance"] = "Allianz Schiffe"
L["config_boat_alliance_desc"] = "Zeigt die Positionen von Allianz Schiffen an."

L["config_zeppelin"] = "Zeppeline"
L["config_zeppelin_desc"] = "Zeigt die Positionen von Zeppelinen an."
L["config_zeppelin_horde"] = "Horde Zeppeline"
L["config_zeppelin_horde_desc"] = "Zeigt die Positionen von Horde Zeppelinen an."
L["config_zeppelin_alliance"] = "Allianz Zeppeline"
L["config_zeppelin_alliance_desc"] = "Zeigt die Positionen von Allianz Zeppelinen an."

L["config_deeprun_tram"] = "Tiefenbahn"
L["config_deeprun_tram_desc"] = "Zeigt die Positionen der Tiefenbahn in Sturmwind und Eisenschmiede an."

L["config_note"] = "Notizen"
L["config_note_desc"] = "Zeigt zusätzliche Notizen an wenn diese verfügbar sind."

L["config_easy_waypoints"] = "Vereinfachte Wegpunkte"
L["config_easy_waypoints_desc"] = "Aktiviert die vereinfachte Wegpunkterstellung. \nErlaubt es per Rechtsklick einen Wegpunkt zu setzen und per STRG + Rechtsklick mehr Optionen aufzurufen."

L["config_teleport_platform"] = "Teleportplattformen"
L["config_teleport_platform_desc"] = "Zeigt die Positionen von Teleportplattformen an."

L["config_anima_gateway"] = "Animaportale"
L["config_anima_gateway_desc"] = "Zeigt die Positionen von Animaportalen an."

L["config_covenant"] = "Pakt Reisenetzwerk"
L["config_covenant_desc"] = "Zeigt die Positionen von Zugangspunkten für das Pakt Reisenetzwerk an."

L["config_others"] = "Anderes"
L["config_others_desc"] = "Zeige alle anderen POIs."

--L["AddOn Settings"] = "AddOn Einstellungen"
--L["Query from server"] = "Abfrage vom Server"
--L["Send query request to server to lookup localized name. May be a little bit slower for the first time lookup but would be very fast once the name is found and cached."] = "Senden Sie eine Abfrageanforderung an den Server, um den lokalisierten Namen zu suchen. Kann beim ersten Mal ein wenig langsamer sein, ist aber schneller sobald der Name gefunden und zwischengespeichert wurde."
L["config_restore_nodes"] = "Versteckte Punkte wiederherstellen"
L["config_restore_nodes_desc"] = "Zeigt wieder alle Symbole an die mit STRG + Rechtsklick --> \"Verstecke diesen Punkt\" manuell ausgeblendet worden sind."
L["config_restore_nodes_print"] = "Alle Versteckten Punkte wurden wiederhergestellt."

L["dev_config_force_nodes"] = "Erzwinge Punkte"
L["dev_config_force_nodes_desc"] = "Erzwingt die Anzeige aller Punkte unabhängig von Klasse, Fraktion oder Pakt."

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
L["handler_tooltip_TNTIER"] = "Stufe %s des Reisenetzwerks."
L["handler_tooltip_not_available"] = "zurzeit NICHT Verfügbar"
--L["currently available"] = "zurzeit Verfügbar"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================SHADOWLANDS===========================================--

L["Shadowlands"] = "Schattenlande"
L["Portal to Oribos"] = "Portal nach Oribos"
L["Waystone to Oribos"] = "Portalstein nach Oribos"
L["Oribos"] = true
L["To Ring of Transference"] = "Zum Ring der Übertragung"
L["To Ring of Fates"] = "Zum Ring der Schicksale"
L["Into the Maw"] = "In den Schlund"
L["Portal to Thorghast"] = "Portal nach Thorghast"
L["Reavendreath"] = true
L["Bastion"] = true
L["Maldraxxus"] = true
L["Ardenweald"] = "Ardenwald"
L["The Maw"] = "Der Schlund"

--===========================================Maldraxxus===========================================--

L["Nurakkir, House of Eyes"] = "Nurakkir, Haus der Augen"
L["Exoramas, House of Rituals"] = "Exoramas, Haus der Rituale"
L["Overlook, Seat of the Primus"] = "Warte, Sitz des Primus"
L["Main Hall, Seat of the Primus"] = "Haupthalle, Sitz des Primus"
L["Zerekriss: Maldraxxus"] = true
L["Seat of the Primus"] = "Sitz des Primus"

--============================================Bastion=============================================--

L["Eternal Gateway"] = "Ewiges Tor"
L["Anima Gateway"] = "Animaportal"
L["Anima Gateway to Hero's rest"] = "Animaportal nach Heldenrast"

--==========================================Ardenweald============================================--

L["RANDOM LOCATION"] = "ZUFÄLLIGER ORT"
L["near Tirna Vaal"] = "nahe Tirna Vaal"
L["near Tirna Scithe"] = "nahe Tirna Scithe"
L["near Dreamsang Fenn"] = "nahe Traumsang Fenn"
L["Darkreach"] = "Dunkelvorstoss"
L["Shimmerbough"] = "Schimmerkaskadenbecken"
L["Heartwoodgrove"] = "Herzholzhain"
L["near Hibernal Hollow"] = "nahe dem Winterschlafbecken"

--==========================================Reavendreath==========================================--

L["Sanctuary of the Mad"] = "Refugium des Wahnsinnigen"
L["Ember Ward"] = "Glutdistrikt"
L["Sinfall"] = "Sündensturz"
L["The Eternal Terrace"] = "Die Ewige Terrasse"
L["Pridefall Hamlet"] = "Stolzsturzweiler"
L["The Banewood"] = "Fresserdickicht"
L["Halls of Atonement"] = "Hallen der Sühne"
L["Dominance Keep"] = "Herrschaftsburg"
L["Feeders' Thicket"] = "Der Fluchwald"

-------------------------------------------------BfA------------------------------------------------

L["Zandalar"] = true
L["Zandalar, Zuldazar"] = true
L["Portal to Zuldazar"] = "Portal nach Zuldazar"
L["Boat to Zuldazar"] = "Schiff nach Zuldazar"
L["Return to Zuldazar"] = "Zurück nach Zuldazar"
L["Boat to Vol'Dun"] = "Schiff nach Vol'Dun"
L["Boat to Nazmir"] = "Schiff nach Nazmir"
L["Portal to Nazjatar"] = "Portal nach Nazjatar"
L["Submarine to Mechagon"] = "U-Boot nach Mechagon"
L["Portal to Silithus"] = "Portal nach Silithus"

L["Kul Tiras"] = true
L["Kul Tiras, Tiragarde Sound"] = "Kul Tiras, Tiragardesund"
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

L["Broken Isles"] = "Die Verheerten Inseln"
L["Broken Isles, Stormheim"] = "Die Verheerten Inseln, Sturmheim"
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
L["Dalaran"] = true
L["Azsuna"] = true
L["Val'sharah"] = true
L["Suramar"] = true
L["Highmountain"] = "Hochberg"
L["Stormheim"] = "Sturmheim"
L["Broken Shore"] = "Die Verheerte Küste"

-------------------------------------------------WoD------------------------------------------------

L["Portal to Warspear"] = "Portal nach Kriegsspeer"
L["Portal to Stormshield"] = "Portal zum Sturmschild"
L["Portal to Vol'mar"] = "Portal nach Vol'mar"
L["Portal to Lion's watch"] = "Portal zur Löwenwacht"
L["Draenor, Tanaan Jungle"] = "Draenor, Tanaandschungel"
L["Draenor, Ashran"] = true

-------------------------------------------------MoP------------------------------------------------

L["Pandaria"] = true
L["Pandaria, Kun-Lai Summit"] = "Pandaria, Kun-Lai Gipfel"
L["Pandaria, Townlong Steppes"] = "Pandaria, Tonlongsteppe"
L["Portal to Jade Forest"] = "Portal zum Jadewald"
L["Portal to Pandaria"] = "Portal nach Pandaria"
L["Portal to Isle of Thunder"] = "Portal zur Insel des Donners"
L["Portal to Shado-Pan Garrison"] = "Portal zur Shado-Pan Garnision"
L["Portal to Peak of Serenity"] = "Portal zum Gipfel der Ruhe"

-------------------------------------------------CATA-----------------------------------------------

L["Maelstrom"] = "Mahlstrom"
L["Maelstrom, Deepholm"] = "Mahlstrom, Tiefenheim"
L["Portal to Deepholm"] = "Portal nach Tiefenheim"
L["Portal to Temple of Earth"] = "Portal zum Tempel der Erde"
L["Portal to Therazane's Throne"] = "Portal zu Therazanes Thron"
L["Portal to Twilight Highlands"] = "Portal ins Schattenhochland"
L["Portal to Tol Barad"] = "Portal nach Tol Barad"
L["Portal to Uldum"] = "Portal nach Uldum"
L["Portal to Vashj'ir"] = "Portal nach Vashj'ir"
L["Portal to Hyjal"] = "Portal zum Hyjal"

------------------------------------------------WotLK-----------------------------------------------

L["Northrend, Crystalsong Forest"] = "Nordend, Kristallsangwald"
L["Portal to the Purple Parlor"] = "Portal zum Purpursalon"
L["Northrend, Howling Fjord"] = "Nordend, Heulender Fjord"
L["Northrend, Vengeance Landing"] = "Nordend, Hafen der Vergeltung"
L["Northrend, Valgarde"] = "Nordend, Valgarde"
L["Boat to Howling Fjord"] = "Schiff in den Heulenden Fjord"
L["Boat to Kamagua"] = "Schiff nach Kamagua"
L["Portal to Howling Fjord"] = "Portal zum Heulenden Fjord"
L["Northrend, Borean Tundra"] = "Nordend, Boreanische Tundra"
L["Northrend, Warsong Hold"] = "Nordend, Kriegshymnenfeste"
L["Northrend, Valiance Keep"] = "Nordend, Valianzfeste"
L["Boat to Borean Tundra"] = "Schiff in die Boreanische Tundra"
L["Boat to Unu'Pe"] = "Schiff nach Unu'pe"
L["Zeppelin to Borean Tundra"] = "Zeppelin in die Boreanische Tundra"
L["Northrend, Dragonblight"] = "Nordend, Drachenöde"
L["Boat to Moa'Ki Harbor"] = "Schiff zum Hafen Moa'ki"

-------------------------------------------------BC-------------------------------------------------

L["Outland"] = "Scherbenwelt"
L["Outland, Terokkar Forest"] = "Scherbenwelt, Wälder von Terokkar"
L["Portal to Hellfire Peninsula"] = "Portal zur Höllenfeuerhalbinsel"
L["Portal to Shattrath"] = "Portal nach Shattrath"
L["Portal to Isle of Quel'Danas"] = "Portal zur Insel von Quel'Danas"
L["Kalimdor, Azuremyst Isle"] = "Kalimdor, Azurmythosinsel"
L["Portal to Exodar"] = "Portal zur Exodar"
L["in Exodar"] = true
L["Boat to Exodar"] = "Schiff zur Exodar"

-----------------------------------------------VANILLA----------------------------------------------

L["Eastern Kingdoms"] = "Die Östlichen Königreiche"
L["Eastern Kingdoms, Wetlands"] = "Die Östlichen Königreiche, Sumpfland"
L["Boat to Menethil Harbor"] = "Schiff zum Hafen von Menethil"

L["Eastern Kingdoms, Eversong Woods"] = "Die Östlichen Königreiche, Immersangwald"
L["Portal to Silvermoon"] = "Portal nach Silbermond"

L["Eastern Kingdoms, Tirisfal Glades"] = "Die Östlichen Königreiche, Tirisfal"
L["Portal to Undercity"] = "Portal nach Unterstadt"
L["Orb of translocation"] = "Translokationskugel"
L["in Undercity Magic Quarter"] = "in Unterstadt im Magieviertel"

L["Eastern Kingdoms, Stranglethorn Vale"] = "Die Östlichen Königreiche, Schlingendorntal"
L["Eastern Kingdoms, Grom'gol Base Camp"] = "Die Östlichen Königreiche, Basislager Grom'gol"
L["Zeppelin to Stranglethorn Vale"] = "Zeppelin ins Schlingendorntal"
L["Portal to Stranglethorn Vale"] = "Portal zum Schlingendorntal"
L["Boat to Booty Bay"] = "Schiff nach Beutebucht"

L["Eastern Kingdoms, Elwynn Forest"] = "Die Östlichen Königreiche, Wald von Elwynn"
L["Portal to Stormwind"] = "Portal nach Sturmwind"
L["Boat to Stormwind"] = "Schiff nach Sturmwind"
L["Deeprun Tram to Stormwind"] = "Tiefenbahn nach Sturmwind"

L["Eastern Kingdoms, Dun Morogh"] = "Die Östlichen Königreiche, Dun Morogh"
L["Portal to Ironforge"] = "Portal nach Eisenschmiede"
L["Deeprun Tram to Ironforge"] = "Tiefenbahn nach Eisenschmiede"

L["Kalimdor"] = true
L["Kalimdor, Durotar"] = true
L["Portal to Orgrimmar"] = "Portal nach Orgrimmar"
L["Zeppelin to Orgrimmar"] = "Zeppelin nach Orgrimmar"

L["Kalimdor, Mulgore"] = true
L["Portal to Thunder Bluff"] = "Portal nach Donnerfels"
L["Zeppelin to Thunder Bluff"] = "Zeppelin nach Donnerfels"

L["Kalimdor, Teldrassil"] = true
L["Portal to Darnassus"] = "Portal nach Darnassus"

L["Kalimdor, Northern Barrens"] = "Kalimdor, Nördliches Brachland"
L["Boat to Ratchet"] = "Schiff nach Ratchet"

L["Kalimdor, Dustwallow Marsh"] = "Kalimdor, Düstermarschen"
L["Boat to Theramore"] = "Schiff nach Theramore"

L["Kalimdor, Tanaris"] = true
L["Portal to Caverns of Time"] = "Portal zu den Höhlen der Zeit"

L["Eastern Kingdoms, Arathi Highlands"] = "Die Östlichen Königreiche, Arathihochland"
L["Kalimdor, Darkshore"] = "Kalimdor, Dunkelküste"

L["Portal to Dalaran Crater"] = "Portal zum Dalaran Krater"
L["Eastern Kingdoms, Hillsbrad Foothills"] = "Die Östlichen Königreiche, Vorgebirge des Hügellands"
L["Portal to Tombs"] = "Portal zum Grabmal"
L["Eastern Kingdoms, Silverpine Forest"] = "Die Östlichen Königreiche, Silberwald"
end