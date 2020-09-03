local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_TravelGuide", "deDE", false, true)

if not L then return end
--German Translation by Dathwada EU-Eredar
if L then
--config.options
L["HandyNotes: TravelGuide"] = true
L["Icon settings"] = "Symboleinstellungen"
L["These settings control the look and feel of the icon."] = "Diese Einstellungen legen das Aussehen der Symbole fest."
L["Icon Scale"] = "Symbolgröße"
L["The scale of the icons"] = "Die größe der Symbole"
L["Icon Alpha"] = "Symboltranzparenz"
L["The alpha transparency of the icons"] = "Die Transparenz der Symbole"
L["What to display?"] = "Was soll angezeigt werden?"
L["These settings control what type of icons to be displayed."] = "Diese Einstellungen legen fest welche Symbole auf der Welt- und Minimap angezeigt werden sollen."

L["Boat"] = "Schiffe"
L["Show the boat locations."] = "Zeigt die Positionen von Schiffen an."
L["Horde Boat"] = "Horde Schiffe"
L["Show the Horde boat locations."] = "Zeigt die Positionen von Horde Schiffen an."
L["Alliance Boat"] = "Allianz Schiffe"
L["Show the Alliance boat locations."] = "Zeigt die Positionen von Allianz Schiffen an."

L["Zeppelin"] = "Zeppeline"
L["Show the Zeppelin locations."] = "Zeigt die Positionen von Zeppelinen an."
L["Horde Zeppelin"] = "Horde Zeppeline"
L["Show the Horde Zeppelin locations."] = "Zeigt die Positionen von Horde Zeppelinen an."
L["Alliance Zeppelin"] = "Allianz Zeppeline"
L["Show the Alliance Zeppelin locations."] = "Zeigt die Positionen von Allianz Zeppelinen an."

L["Portal"] = "Portale"
L["Show the portal locations."] = "Zeigt die Positionen von Portalen an."

L["Order Hall portal"] = "Ordenshallenportale"
L["Show the Order Hall portal locations."] = "Zeigt die Positionen von Ordenshallenportalen an."

L["Warfront portal"] = "Kriegsfrontportale"
L["Show the Warfront portal locations."] = "Zeigt die Positionen von Kriegsfrontportalen an."

L["Deeprun Tram"] = "Tiefenbahn"
L["Show the Deeprun Tram locations in Stormwind and Ironforge."] = "Zeigt die Positionen der Tiefenbahn in Sturmwind und Eisenschmiede an."

L["Note"] = "Notizen"
L["Show the node's additional notes when it's available."] = "Zeigt zusätzliche Notizen an wenn diese verfügbar sind."

L["Easy waypoints"] = "Vereinfachte Wegpunkte"
L["easy_waypoints_desc"] = "Aktiviert die vereinfachte Wegpunkterstellung. \nErlaubt es per Rechtsklick einen Wegpunkt zu setzen und per STRG + Rechtsklick mehr Optionen aufzurufen."

L["Others"] = "Anderes"
L["Show all the other POIs."] = "Zeige alle anderen POIs."

--Plugin_config
L["AddOn Settings"] = "AddOn Einstellungen"
L["Query from server"] = "Abfrage vom Server"
L["Send query request to server to lookup localized name. May be a little bit slower for the first time lookup but would be very fast once the name is found and cached."] = "Senden Sie eine Abfrageanforderung an den Server, um den lokalisierten Namen zu suchen. Kann beim ersten Mal ein wenig langsamer sein, ist aber schneller sobald der Name gefunden und zwischengespeichert wurde."
L["Restore hidden nodes"] = "Versteckte Punkte wiederherstellen"
L["Show all nodes that you have manually hidden by right-clicking on them and choosing \"Hide this node\"."] = "Zeigt wieder alle Symbole an die mit rechtsklick --> \"Verstecke diesen Punkt\" manuell ausgeblendet worden sind."
L["All hidden nodes have been restored"] = "Alle Versteckten Punkte wurden wiederhergestellt."

--Handler
L["Shows the portal, zepplin and boat locations on the World Map and the MiniMap."] = "Zeigt die Positionen von Portalen, Zeppelinen und Schiffen auf der Worldmap und der Minimap an."
L["TravelGuide"] = "TravelGuide"
L["Requires at least player level: "] = "Benötigt min. Spielerlevel: "
L["Unlocked with quest: ["] = "Freigeschaltet mit der Quest: ["
L["RETRIEVING DATA..."] = "DATEN ABRUFEN..."
L["Add to TomTom"] = "Zu TomTom hinzufügen"
L["Hide this node"] = "Verstecke diesen Punkt"
L["Requires"] = "Benötigt"

--DB
--Shadowlands
L["Shadowlands"] = "Schattenlande"
L["Portal to Oribos"] = "Portal nach Oribos"
--L["inside the Seat of the Primus"] = "innerhalb vom Sitz des Primus"
L["Gate to Revendreth"] = "Tor nach Revendreth" --review Blizzard translation
L["Gate to Maldraxxus"] = "Tor nach Maldraxxus" --review Blizzard translation
L["Gate to Ardenweald"] = "Tor in den Ardenwald" --review Blizzard translation
L["Gate to Bastion"] = "Tor nach Bastion" --review Blizzard translation
L["Anima Gateway to Hero's rest"] = "Animator nach Heldenrast" --review Blizzard translation

L["wyrm"] = true
L["wyrm_desc"] = true
--BFA
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
L["currently NOT available"] = "zurzeit NICHT Verfügbar"--"ZURZEIT NICHT VERFÜGBAR"
--L["currently available"] = "zurzeit Verfügbar"--"ZURZEIT VERFÜGBAR"

--Legion
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

--WoD
L["Portal to Warspear"] = "Portal nach Kriegsspeer"
L["Portal to Stormshield"] = "Portal zum Sturmschild"
L["Portal to Vol'mar"] = "Portal nach Vol'mar"
L["Portal to Lion's watch"] = "Portal zur Löwenwacht"
L["Draenor, Tanaan Jungle"] = "Draenor, Tanaandschungel"
L["Draenor, Ashran"] = true

--MoP
L["Pandaria"] = true
L["Pandaria, Kun-Lai Summit"] = "Pandaria, Kun-Lai Gipfel"
L["Pandaria, Townlong Steppes"] = "Pandaria, Tonlongsteppe"
L["Portal to Jade Forest"] = "Portal zum Jadewald"
L["Portal to Pandaria"] = "Portal nach Pandaria"
L["Portal to Isle of Thunder"] = "Portal zur Insel des Donners"
L["Portal to Shado-Pan Garrison"] = "Portal zur Shado-Pan Garnision"
L["Portal to Peak of Serenity"] = "Portal zum Gipfel der Ruhe"

--Cata
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

--WotLK
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

--BC
L["Outland"] = "Scherbenwelt"
L["Outland, Terokkar Forest"] = "Scherbenwelt, Wälder von Terokkar"
L["Portal to Hellfire Peninsula"] = "Portal zur Höllenfeuerhalbinsel"
L["Portal to Shattrath"] = "Portal nach Shattrath"
L["Portal to Isle of Quel'Danas"] = "Portal zur Insel von Quel'Danas"
L["Kalimdor, Azuremyst Isle"] = "Kalimdor, Azurmythosinsel"
L["Portal to Exodar"] = "Portal zur Exodar"
L["in Exodar"] = true
L["Boat to Exodar"] = "Schiff zur Exodar"

--Vanilla
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