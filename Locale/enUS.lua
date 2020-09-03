local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("HandyNotes_TravelGuide", "enUS", true, true)


if L then
--config.options
L["HandyNotes: TravelGuide"] = true
L["Icon settings"] = true
L["These settings control the look and feel of the icon."] = true
L["Icon Scale"] = true
L["The scale of the icons"] = true
L["Icon Alpha"] = true
L["The alpha transparency of the icons"] = true
L["What to display?"] = true
L["These settings control what type of icons to be displayed."] = true

L["Boat"] = true
L["Show the boat locations."] = true
L["Horde Boat"] = true
L["Show the Horde boat locations."] = true
L["Alliance Boat"] = true
L["Show the Alliance boat locations."] = true

L["Zeppelin"] = true
L["Show the Zeppelin locations."] = true
L["Horde Zeppelin"] = true
L["Show the Horde Zeppelin locations."] = true
L["Alliance Zeppelin"] = true
L["Show the Alliance Zeppelin locations."] = true

L["Portal"] = true
L["Show the portal locations."] = true

L["Order Hall portal"] = true
L["Show the Order Hall portal locations."] = true

L["Warfront portal"] = true
L["Show the Warfront portal locations."] = true

L["Deeprun Tram"] = true
L["Show the Deeprun Tram locations in Stormwind and Ironforge."] = true

L["Note"] = true
L["Show the node's additional notes when it's available."] = true

L["Easy waypoints"] = true
L["easy_waypoints_desc"] = "Activates simplified waypoint creation. \nAllows you to set a waypoint by right-clicking and access to more options by CTRL + right-clicking."

L["Others"] = true
L["Show all the other POIs."] = true

--Plugin_config
L["AddOn Settings"] = true
L["Query from server"] = true
L["Send query request to server to lookup localized name. May be a little bit slower for the first time lookup but would be very fast once the name is found and cached."] = true
L["Restore hidden nodes"] = true
L["Show all nodes that you have manually hidden by right-clicking on them and choosing \"Hide this node\"."] = true
L["All hidden nodes have been restored"] = true

--Handler
L["Shows the portal, zepplin and boat locations on the World Map and the MiniMap."] = true
L["TravelGuide"] = true
L["Requires at least player level: "] = true
L["Unlocked with quest: ["] = true
L["RETRIEVING DATA..."] = true
L["Add to TomTom"] = true
L["Hide this node"] = true
L["Requires"] = true

--DB
--Shadowlands
L["Shadowlands"] = true
L["Portal to Oribos"] = true
L["inside the Seat of the Primus"] = true
L["Gate to Revendreth"] = true
L["Gate to Maldraxxus"] = true
L["Gate to Ardenweald"] = true
L["Gate to Bastion"] = true
L["Anima Gateway to Hero's rest"] = "Anima Gateway to Hero's rest"

L["wyrm"] = true
L["wyrm_desc"] = true
--BFA
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
L["currently NOT available"] = true
--L["currently available"] = true

--Legion
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

--WoD
L["Portal to Warspear"] = true
L["Portal to Stormshield"] = true
L["Portal to Vol'mar"] = true
L["Portal to Lion's watch"] = true
L["Draenor, Tanaan Jungle"] = true
L["Draenor, Ashran"] = true

--MoP
L["Pandaria"] = true
L["Pandaria, Kun-Lai Summit"] = true
L["Pandaria, Townlong Steppes"] = true
L["Portal to Jade Forest"] = true
L["Portal to Pandaria"] = true
L["Portal to Isle of Thunder"] = true
L["Portal to Shado-Pan Garrison"] = true
L["Portal to Peak of Serenity"]= true

--Cata
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

--WotLK
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

--BC
L["Outland"] = true
L["Outland, Terokkar Forest"] = true
L["Portal to Hellfire Peninsula"] = true
L["Portal to Shattrath"] = true
L["Portal to Isle of Quel'Danas"] = true
L["Kalimdor, Azuremyst Isle"] = true
L["Portal to Exodar"] = true
L["in Exodar"] = true
L["Boat to Exodar"] = true

--Vanilla
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
L["Portal to Tombs"] = true
L["Eastern Kingdoms, Silverpine Forest"] = true
end