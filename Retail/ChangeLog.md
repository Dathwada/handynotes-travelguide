## Revision History:

#### v2.5.1 (March 27, 2021)
-------------------------------
* Fixed leaked variables
* Fixed the mixed portal warfront notes
* Added / Updated .toc localization notes
* Updated frFR by [shaiandra](https://www.curseforge.com/members/shaiandra)

#### v2.5.0 (March 10, 2021)
-------------------------------
* Added the missing Venthyr portal to oribos
* Added Latin American Spanish by [Irakua](https://www.curseforge.com/members/Irakua) and [dogstryker](https://www.curseforge.com/members/dogstryker)
* Updated ruRU by [Golowolom](https://www.curseforge.com/members/golowolom) and [dadec666](https://www.curseforge.com/members/dadec666)
* Updated esES by [Irakua](https://www.curseforge.com/members/Irakua), deDE, frFR, ptBR
* Background changes (individual scale and alpha options)
* Bump .toc to 90005

#### v2.4.0 (December 20, 2020)
-------------------------------
* Fixed Kalimdor and Eastern Kingdoms localization [#4](https://github.com/Dathwada/handynotes-travelguide/issues/4)
* Updated Traditional Chinese translation by [lostindark0](https://www.curseforge.com/members/lostindark0)
* Background changes with requirements and warfront states and notes

#### v2.3.0 (November 18 , 2020)
-------------------------------
* Added new teleport platforms in Oribos
* Added the new travel network tier 3 covenant sanctum Portal to Oribos
* More background changes
* Bump .toc to 90002

#### v2.2.1 (November 09 , 2020)
-------------------------------
* Updated AceTimer-3.0
* Updated zhTW (95,85%) and zhCN (90,67%) (thanks [lostindark0](https://www.curseforge.com/members/lostindark0))
* Fixed the icon behavior for portals with quest and/or level requirements
* Added some level requirements for portals
* Some background changes in DB.lua and handler.lua for multilabels with and without notes and timetravel
* Removed the Covenant Travel Network (because Blizzard has added it to the map.)

#### v2.2.0 (October 14, 2020)
-------------------------------
* Finally found a way to track the timezones for Darkshore, Arathi Highlands, Tirisfal Glades and Sillithus
* Added some new Shadowlands stuff
    * Portal to Oribos in Orgrimmar and Stormwind
    * Portals and Teleport platforms in Oribos
    * Anima Gateways to Hero's rest in Bastion
    * Covenant Travel Network
* Added new icons for the new stuff
* Added new options to toggle the new stuff
* Rework config
    * Added Tabs: General and Scale / Alpha
    * Added faction requirement for toggle zeppelin, horde zeppelin and alliance boat
    * Added individual scale and alpha options for portals, boats, zeppelins, covenant and others
    * Added a requirement for the Easy Waypoints function
* Added Simplified Chinese (zhCN) localization from [mmk5](https://www.curseforge.com/members/mmk5) (83,03%)
* Added Traditional Chinese (zhTW) localization from [lostindark0](https://www.curseforge.com/members/lostindark0) (59,63%)
* Added Spanish (esES) localization created with [WoW.tools Tables](https://wow.tools/dbc/) (36,24%)
* Added French (frFR) localization created with [WoW.tools Tables](https://wow.tools/dbc/) and ingame reviews (72,48%)
* Added Russian (ruRU) localization created with [WoW.tools Tables](https://wow.tools/dbc/) (45,87%)
* Tooltip should now refresh after RETRIEVING DATA... (for quest names)
* Added new requirement notes for time travel and the covenant travel network

#### v2.1.5 (August 26, 2020)
-----------------------------
* Added Brazilian Portuguese (ptBR) localization from [angel333119](https://www.curseforge.com/members/angel333119)
* Added mage order hall portals that are activated through the order advancement "teleportation nexus"
    * 3 new lines (needs review for ptBR)

#### v2.1.4 (July 22, 2020)
---------------------------
* new feature: easy waypoints allows you to set a waypoint by right-clicking any POI (point of interest) and access to more options by CTRL + right-clicking (ON by default you can turn it off in the settings)
* new boat icon for uncompleted quests

#### v2.1.3 (January 19, 2020)
------------------------------
* Bumped version number for WoW 8.3
* removed a copie file from Handler.lua
* edited german translation
* fixed Warfrontportals when both portals are active for one faction.
* added Portal to Orgrimmar (horde) and Portal to Stormwind (allianz) in the new vale of eternal blossoms (Pandaria)

#### v2.1.2 (Dezember 05, 2019)
-------------------------------
* Added warfront portal locations.
* Added option to toggle warfront portals.
* Added request which warfront portal is currently available.
* Added Libs folder (AceTimer-3.0, not included in Handynotes)
* Added Portal to Dalaran (Vindikaar / Argus)
* Added new lines to enUS.lua, deDE.lua, blank.lua
* Bumped version number for WoW 8.2.5
* fixed warrior orderhall portal in Thunder Totem (Highmountain, Broken Isle)
* fixed portal in helheim (Stormheim, Broken Isle)
* removed factions requirement from 2 Portals in Kalimdor.
    * You can use Portal to Exodar and Portal to Darnassus as horde too.

#### v2.1.1 (September 15, 2019)
--------------------------------
* removed Libs folder (LibBabble-SubZone-3.0)
* Added more quest requirements to portals
* Added portals for all legion class order halls
    * Added new icon for Warrior portals
* Added option to toggle order hall portals
* Added new lines to enUS.lua, deDE.lua, blank.lua

#### v2.1.0 (July 31, 2019)
---------------------------
* Now you can toggle the notes from portals, boats and zeppelins with more than one destinations
* Added level and quest check to display unusable portals with a red portal.
* Added level and quest info for unusable portals.
* Added new lines to deDE.lua, enUS.lua and blank.lua
* Added Portal to
    * Orgrimmar and Stormwind in Azsuna and Broken Isle
    * Boralus in Sillithus and Kalimdor (only Alliance)
    * Stormheim in Helheim
* Removed Gyrocopter to Mechagon
* Corrected portal to Undercity in Northend (Howling Fjord)
* Better icons for horde zepplins, neutral and alliance boats
* Deeprun Tram now has its own icon
* Added option to show/hide Deeprun Tram
* The area in the tooltip of notes and spells was swapped
* Updated .toc
* removed .png images

#### v2.0.0 (July 20, 2019) NEW MAINTAINER
----------------------------------------------
* removed portals that no longer exist from DB.lua.
* added new portals to DB.lua.
* added Horde Zeppelins for Alliance (new Icon)
* added Alliance Boats for Horde (new Icon)
* overhauled Handler.lua to the new BFA UiMapIDs
* overhauled the DB.lua to the new BFA UiMapIDs
* edited Constants.lua
* edited Config.lua
* edited deDE.lua (german localization) tested in EU - Germanclient
* edited enUS.lua tested in EU - englishclient
* edited blank.lua
* edited Locales.xml
* edited .toc
* TomTom Support (set Waypoints) is working now.

#### v1.9.3 (Apr 12, 2018)
--------------------------
* added Dalaran and Pandaria portals to Stormwind
* updated deDE.lua and applied fix to other locale .lua's
* updated DB.lua
* renamed enUS.lua to enEN.lua
* fixed spelling errors

#### v1.9.2 (Apr 10, 2018)
--------------------------
* fixed enUS.lua file
* added blank locale file for future translations
* fixed spelling errors

#### v1.9.1 (Apr 8, 2018)
-------------------------
* added German (de lib) contributed by Dathwada

#### v1.9 (Apr 7, 2018)
-----------------------
* added various missed portals
* added Warlords of Draenor data
* fixed spelling errors
* neatened DB.lua

#### v1.8 (Mar 6, 2018)
-----------------------
* added portals in Dalaran-Northrend
* adjusted string in Handler.lua forcing English string instead of localized

#### v1.7 (Feb 11, 2018)
------------------------
* updated for 7.3.5
* fixed spelling errors and inaccurate database links
* added portal and zeppelin coordinates to Orgrimmar, Thunder Bluff, Undercity, and connected zones
* added various Horde portals

#### v1.6 (Sep 01, 2017)
------------------------
* updated for 7.3

#### v1.5 (June 12, 2017)
-------------------------
* added Stormwind portal to Ashran
* updated for 7.2.5

#### v1.4 (May 22, 2017)
------------------------
* added druid portals in Class Hall/ Val'sharah
* added Dalaran portals to Broken Isles map for Alliance and Horde

#### v1.3 (May 18, 2017)
------------------------
* adjusted locations for Isle of Thunder portals in Townlong Steppes
* added portal from Isle of Thunder to Townlong Steppes

#### v1.2 (May 16, 2017)
------------------------
* Fixed an issue when right clicking portals or boats displayed improper addon name

#### v1.1 (May 13, 2017)
------------------------
* Added placeholders for Horde zeppelins and portals

#### v1.0 (May 12, 2017)
------------------------
* Added Alliance and neutral boat locations in Azeroth
* Added portals in Stormwind, Ironforge, Darnassus, Exodar, Shattrath, Vale of Eternal Blossoms, Dalaran-Northrend, and Dalaran-Broken Isles
* Added portals in non major zones (Mount Hyjal, Deepholm, Tol Barad)
* Created links for zeppelins and faction air vehicles
