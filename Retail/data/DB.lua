----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...
local L = private.locale

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local function GetMapNames(id1, id2)
    if id1 and id2 then
        return format("%s, %s", C_Map.GetMapInfo(id1).name, C_Map.GetMapInfo(id2).name)
    end
    return C_Map.GetMapInfo(id1).name
end

----------------------------------------------COVENANT----------------------------------------------

local Kyrian    = 1
local Venthyr   = 2
local Nightfae  = 3
local Necrolord = 4
local PH = L["PH"] -- PLACEHOLDER

--------------------------------------------SHADOWLANDS---------------------------------------------

local Shadowlands = GetMapNames(1550)
local PtoOribos = L["Portal to Oribos"]
local WstoOribos = L["Waystone to Oribos"]
local RingTransference= L["To Ring of Transference"]
local RingFates = L["To Ring of Fates"]
local IntoTheMaw = L["Into the Maw"]
local PtoTorghast = L["Portal to Torghast"]

local AGtoHerosrest = L["Anima Gateway to Hero's rest"]

-------------------------------------------------BfA------------------------------------------------

local Zandalar = GetMapNames(875)
local Zuldazar = GetMapNames(875, 862)
local PtoZuldazar = L["Portal to Zuldazar"]
local BtoZuldazar = L["Boat to Zuldazar"]
local returntoZuldazar = L["Return to Zuldazar"]
local BtoVolDun = L["Boat to Vol'Dun"]
local BtoNazmir = L["Boat to Nazmir"]
local PtoNazjatar = L["Portal to Nazjatar"]
local StoMechagon = L["Submarine to Mechagon"]
local PtoSilithus = L["Portal to Silithus"]

local KulTiras = GetMapNames(876)
local TiragardeSound = GetMapNames(876, 895)
local PtoBoralus = L["Portal to Boralus"]
local BtoBoralus = L["Boat to Boralus"]
local returntoBoralus = L["Return to Boralus"]
local BtoDrustvar = L["Boat to Drustvar"]
local BtoStormsongValley = L["Boat to Stormsong Valley"]
local BtoTiragardeSound = L["Boat to Tiragarde Sound"]

local PtoArathiHighlands = L["Portal to Arathi Highlands"]
local PtoPortofZandalar = L["Portal to Port of Zandalar"]
local PtoDarkshore = L["Portal to Darkshore"]
local PtoPortofBoralus = L["Portal to Port of Boralus"]

-----------------------------------------------LEGION-----------------------------------------------

local BrokenIsles = GetMapNames(619)
local Stormheim = GetMapNames(619, 634)
local PtoStormheim = L["Portal to Stormheim"]
local PtoHelheim = L["Portal to Helheim"]
local PtoDala = L["Portal to Dalaran"]
local PtoAzsuna = L["Portal to Azsuna"]
local PtoValsharah = L["Portal to Val'sharah"]
local PtoEmeraldDreamway = L["Portal to Emerald Dreamway"]
local PtoSuramar = L["Portal to Suramar"]
local PtoHighmountain = L["Portal to Highmountain"]
local GEtoTrueshotLodge = L["Great Eagle to Trueshot Lodge"]
local JtoSkyhold = L["Jump to Skyhold"]
local dalaran = GetMapNames(627)
local azsuna = GetMapNames(630)
local valsharah = GetMapNames(641)
local suramar = GetMapNames(680)
local highmountain = GetMapNames(650)
local stormheim = GetMapNames(634)
local brokenshore = GetMapNames(646)

-------------------------------------------------WoD------------------------------------------------

local PtoStormshield = L["Portal to Stormshield"]
local PtoLionswatch = L["Portal to Lion's watch"]
local PtoWarspear = L["Portal to Warspear"]
local PtoVolmar = L["Portal to Vol'mar"]
local Ashran = GetMapNames(572, 588)
local TanaanJungle = GetMapNames(572, 534)

-------------------------------------------------MoP------------------------------------------------

local Pandaria = GetMapNames(424)
local TownlongSteppes = GetMapNames(424, 388)
local PtoIofT = L["Portal to Isle of Thunder"]
local PtoSPG = L["Portal to Shado-Pan Garrison"]
local PtoJadeForest = L["Portal to Jade Forest"]
local KunLaiSummit = GetMapNames(424, 379)
local PtoPeakofSerenity = L["Portal to Peak of Serenity"]

-------------------------------------------------CATA-----------------------------------------------

local Maelstrom = GetMapNames(948)
local Deepholm = GetMapNames(948, 207)
local PtoTolBarad = L["Portal to Tol Barad"]
local PtoUldum = L["Portal to Uldum"]
local PtoDeepholm = L["Portal to Deepholm"]
local PtoVashjir = L["Portal to Vashj'ir"]
local PtoHyjal = L["Portal to Hyjal"]
local PtoTwilightHighlands = L["Portal to Twilight Highlands"]
local PtoTempleofEarth = L["Portal to Temple of Earth"]
local PtoTherazanesThrone = L["Portal to Therazane's Throne"]

------------------------------------------------WotLK-----------------------------------------------

local CrystalsongForest = GetMapNames(113, 127)
local PtotPurpleParlor = L["Portal to the Purple Parlor"]
local BoreanTundra = GetMapNames(113, 114)
local ZtoBoreanTundra = L["Zeppelin to Borean Tundra"]
local BtoBoreanTundra = L["Boat to Borean Tundra"]
local WarsongHold = GetMapNames(113)..", "..C_Map.GetAreaInfo(4129)
local ValianceKeep = GetMapNames(113)..", "..C_Map.GetAreaInfo(4032)
local BtoUnuPe = L["Boat to Unu'Pe"]
local Dragonblight = GetMapNames(113, 115)
local BtoMoaKiHarbor = L["Boat to Moa'Ki Harbor"]
local HowlingFjord = GetMapNames(113, 117)
local PtoHowlingFjord = L["Portal to Howling Fjord"]
local VengeanceLanding = GetMapNames(113)..", "..C_Map.GetAreaInfo(4000)
local BtoHowlingFjord = L["Boat to Howling Fjord"]
local Valgarde = GetMapNames(113)..", "..C_Map.GetAreaInfo(3981)
local BtoKamagua = L["Boat to Kamagua"]

-------------------------------------------------BC-------------------------------------------------

local AzuremystIsle = GetMapNames(12, 97)
local PtoExodar = L["Portal to Exodar"]
local inExodar = L["in Exodar"]
local Outland = GetMapNames(101)
local PtoHellfirePeninsula = L["Portal to Hellfire Peninsula"]
local PtoIofQD = L["Portal to Isle of Quel'Danas"]
local PtoShattrath = L["Portal to Shattrath"]
local TerokkarForest = GetMapNames(101, 108)

-----------------------------------------------VANILLA----------------------------------------------

local Durotar = GetMapNames(12, 1)
local PtoOG = L["Portal to Orgrimmar"]
local ZtoOG = L["Zeppelin to Orgrimmar"]
local Mulgore = GetMapNames(12, 7)
local PtoTB = L["Portal to Thunder Bluff"]
local ZtoTB = L["Zeppelin to Thunder Bluff"]
local Tirisfal = GetMapNames(13, 18)
local PtoUC = L["Portal to Undercity"]
local inUCMq = L["in Undercity Magic Quarter"]
local Orboftranslocation = L["Orb of translocation"]
local EversongWoods = GetMapNames(13, 94)
local PtoSM = L["Portal to Silvermoon"]
local NorthernBarrens = GetMapNames(12, 10)
local BtoRatchet = L["Boat to Ratchet"]
local ElwynnForest = GetMapNames(13, 37)
local PtoSW = L["Portal to Stormwind"]
local BtoSW = L["Boat to Stormwind"]
local DrTtoSW = L["Deeprun Tram to Stormwind"]
local Teldrassil = GetMapNames(12, 57)
local PtoDarnassus = L["Portal to Darnassus"]
local DunMorogh = GetMapNames(13, 27)
local PtoIF = L["Portal to Ironforge"]
local DrTtoIF = L["Deeprun Tram to Ironforge"]
local BtoMenethilHarbor = L["Boat to Menethil Harbor"]
local EasternKingdoms = GetMapNames(13)
local Wetlands = GetMapNames(13, 56)
local ZtoStranglethornVale = L["Zeppelin to Stranglethorn Vale"]
local PtoStranglethornVale = L["Portal to Stranglethorn Vale"]
local StranglethornVale = GetMapNames(13, 224)
local BtoBootyBay = L["Boat to Booty Bay"]
local GromgolBaseCamp = GetMapNames(13)..", "..C_Map.GetAreaInfo(117)
local Kalimdor = GetMapNames(12)
local DustwallowMarsh = GetMapNames(12, 70)
local BtoTheramore = L["Boat to Theramore"]
local PtoCavernsofTime = L["Portal to Caverns of Time"]
local Tanaris = GetMapNames(12, 71)
local ArathiHighlands = GetMapNames(13, 14)
local Darkshore = GetMapNames(12, 62)
local PtoDalaCrater = L["Portal to Dalaran Crater"]
local HillsbradFoothills = GetMapNames(13, 25)
local PtoSepulcher = L["Portal to the Sepulcher"]
local SilverpineForest = GetMapNames(13, 21)
local EasternPlaguelands = GetMapNames(13, 23)
local Westfall = GetMapNames(13, 52)
local BurningSteppes = GetMapNames(13, 36)

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

local DB = {}
private.DB = DB

DB.points = {
--[[ structure:
    [UiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            icon          = ["STRING"],         -- specific icon for nodes
            label         = ["STRING"],         -- label for singel destination nodes
            multilabel    = {TABLE},            -- label for multi destination nodes
            note          = ["STRING"],         -- additional destination notes
            multinote     = {TABLE},            -- additional notes for multi destination nodes
            requirements  = {                   -- additional notes for requirements
                TABLE FOR:
                quest         = [ID],           -- additional notes for a required quest
                multiquest    = {TABLE},        -- additional notes for multi required quests
                spell         = [ID],           -- additional notes for a required spell
                level         = [PLAYERLEVEL],  -- additional notes for a required player level
                multilevel    = {TABLE},        -- additional notes for a multi required player levels
                reputation    = {ID, standing}, -- additional notes for a required reputation
                sanctumtalent = [ID],           -- additional notes for a required sanctum upgrade
                warfront      = [ID],           -- additional notes for warfront nodes
                timetravel    = {               -- additional requirement for nodes
                TABLE FOR:
                    quest = [ID],               -- hidden quest id to track the timezone from Zidormi
                    spell = [ID],               -- time travel spell id
                    turn = [BOOLEAN]            -- to turn the timezone in Sillithus
                },
            },
            faction       = ["FACTION"],        -- shows only for selected faction
            class         = [CLASS NAME],       -- shows only for selected class
            covenant      = [COVENAT NAME],     -- shows only for selected covenant
        },
    },
]]

------------------------------------------------------------------------------------------SHADOWLANDS------------------------------------------------------------------------------------------

    [1550] = { -- Shadowlands
        [45665085] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde", requirements={quest=60151} },
        [45665054] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance", requirements={quest=60151} },
        [23411094] = { icon="portal", label=WstoOribos },
        [62772775] = { icon="portal", label=PtoOribos, covenant=Necrolord, requirements={sanctumtalent=1052} },
        [76015007] = { icon="portal", label=PtoOribos, covenant=Kyrian, requirements={sanctumtalent=1058} },
        [47928153] = { icon="portal", label=PtoOribos, covenant=Nightfae, requirements={sanctumtalent=1055} },
        [20535087] = { icon="portal", label=PtoOribos, covenant=Venthyr, requirements={sanctumtalent=1049} },
        },
    [1670] = { -- Oribos - Ring of Fates
        [20835477] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde", requirements={quest=60151} },
        [20894567] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance", requirements={quest=60151} },
        [52094278] = { icon="teleport_platform", label=RingTransference },
        [57145040] = { icon="teleport_platform", label=RingTransference },
        [52095784] = { icon="teleport_platform", label=RingTransference },
        [47055029] = { icon="teleport_platform", label=RingTransference },
        },
    [1671] = { -- Oribos - Ring of Transference
        [49525107] = { icon="portal", label=IntoTheMaw },
        [49504243] = { icon="teleport_platform", label=RingFates },
        [55735162] = { icon="teleport_platform", label=RingFates },
        [49506073] = { icon="teleport_platform", label=RingFates },
        [43375150] = { icon="teleport_platform", label=RingFates },
        },
    [1536] = { -- Maldraxxus
        [51147034] = { icon="portal", label=PtoOribos, covenant=Necrolord, requirements={sanctumtalent=1052} },
        },
    [1698] = { -- Seat of the Primus
        [56373149] = { icon="portal", label=PtoOribos, covenant=Necrolord, requirements={sanctumtalent=1052} },
        },
    [1533] = { -- Bastion
        [55985276] = { icon="anima_gateway", label=AGtoHerosrest }, --1 --Blizzard marked
        [46964891] = { icon="anima_gateway", label=AGtoHerosrest }, --2 --Blizzard marked
        [52983802] = { icon="anima_gateway", label=AGtoHerosrest }, --3 --Blizzard marked
        [65581959] = { icon="portal", label=PtoOribos, covenant=Kyrian, requirements={sanctumtalent=1058} },
        },
    [1707] = { -- Elysian Hold
        [48816478] = { icon="portal", label=PtoOribos, covenant=Kyrian, requirements={sanctumtalent=1058} },
        },
    [1565] = { -- Ardenweald
        [46605126] = { icon="portal", label=PtoOribos, covenant=Nightfae, requirements={sanctumtalent=1055} },
        },
    [1702] = { -- Hearth of the Forest - The Roots
        [59972842] = { icon="portal", label=PtoOribos, covenant=Nightfae, requirements={sanctumtalent=1055} },
        },
    [1525] = { -- Revendreth
        [32134043] = { icon="portal", label=PtoOribos, covenant=Venthyr, requirements={sanctumtalent=1049} },
        },
    [1699] = { -- Sinfall Reaches
        [62052630] = { icon="portal", label=PtoOribos, covenant=Venthyr, requirements={sanctumtalent=1049} },
        },
    [1543] = { -- The Maw
        [42374215] = { icon="portal", label=WstoOribos },
        [48183943] = { icon="portal", label=PtoTorghast, requirements={level=60} },
        },

----------------------------------------------------------------------------------------------BfA----------------------------------------------------------------------------------------------

    [875] = { -- Zandalar
        [58206200] = { icon="portal", multilabel={PtoSM, PtoOG, PtoTB, PtoSilithus, PtoNazjatar}, multinote={EversongWoods, Durotar, Mulgore, Kalimdor}, requirements={multiquest={[2]=46931, [4]=46931, [5]=55053}, multilevel={[4]=50}}, faction="Horde" },
        [56307065] = { icon="boat", label=StoMechagon, note=KulTiras, requirements={quest=55651}, faction="Horde" },
        [33201921] = { icon="boat", label=returntoBoralus, note=TiragardeSound, requirements={quest=51229}, faction="Alliance" }, -- Vol'Dun Barnard "The Smasher" Baysworth
        [62492642] = { icon="boat", label=returntoBoralus, note=TiragardeSound, requirements={quest=51088}, faction="Alliance" }, -- Nazmir Desha Stormwallow
        [47137856] = { icon="boat", label=returntoBoralus, note=TiragardeSound, requirements={quest=51359}, faction="Alliance" }, -- Zuldazar Daria Smithson
        [58287605] = { icon="boat", multilabel={BtoDrustvar, BtoStormsongValley, BtoTiragardeSound}, multinote={KulTiras, KulTiras, KulTiras}, requirements={multiquest={51340, 51532, 51421}}, faction="Horde" },
        [58367208] = { icon="mixedportal", multilabel={PtoArathiHighlands, PtoDarkshore}, multinote={EasternKingdoms, Kalimdor}, requirements={level=50}, faction="Horde" },
        [59285897] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}}, faction="Horde" },
        },
    [862] = { -- Zuldazar
        [58304450] = { icon="portal", multilabel={PtoSM, PtoOG, PtoTB, PtoSilithus, PtoNazjatar}, multinote={EversongWoods, Durotar, Mulgore, Kalimdor}, requirements={multiquest={[2]=46931, [4]=46931, [5]=55053}, multilevel={[4]=50}}, faction="Horde" },
        [55255824] = { icon="boat", label=StoMechagon, note=KulTiras, requirements={quest=55651}, faction="Horde" },
        [58466293] = { icon="boat", multilabel={BtoDrustvar, BtoStormsongValley, BtoTiragardeSound}, multinote={KulTiras, KulTiras, KulTiras}, requirements={multiquest={51340, 51532, 51421}}, faction="Horde" },
        [58596055] = { icon="mixedportal", multilabel={PtoArathiHighlands, PtoDarkshore}, multinote={EasternKingdoms, Kalimdor}, requirements={level=50}, faction="Horde" },
        [60073938] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}}, faction="Horde" },
        },
    [1165] = { -- Dazar'alor
        [51004600] = { icon="portal", multilabel={PtoSM, PtoOG, PtoTB, PtoSilithus, PtoNazjatar}, multinote={EversongWoods, Durotar, Mulgore, Kalimdor}, requirements={multiquest={[2]=46931, [4]=46931, [5]=55053}, multilevel={[4]=50}}, faction="Horde" },
        [41808760] = { icon="boat", label=StoMechagon, note=KulTiras, requirements={quest=55651}, faction="Horde" },
        [51859453] = { icon="mixedportal", multilabel={PtoArathiHighlands, PtoDarkshore}, multinote={EasternKingdoms, Kalimdor}, requirements={level=50}, faction="Horde" },
        [56323090] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}}, faction="Horde" },
        },
    [1163] = { -- Dazar'alor - The Great Seal
        [73706210] = { icon="portal", label=PtoSM, note=EversongWoods, faction="Horde" },
        [73706980] = { icon="portal", label=PtoOG, note=Durotar, requirements={quest=46931}, faction="Horde" },
        [73707730] = { icon="portal", label=PtoTB, note=Mulgore, faction="Horde" },
        [73708530] = { icon="portal", label=PtoSilithus, note=Kalimdor, requirements={quest=46931,level=50}, faction="Horde" },
        [63008530] = { icon="portal", label=PtoNazjatar, requirements={quest=55053, level=50}, faction="Horde" },
        },
    [1355] = { -- Nazjatar
        [47286278] = { icon="portal", label=PtoZuldazar, note=Zandalar, requirements={quest=55053, level=50}, faction="Horde" },
        [40005260] = { icon="portal", label=PtoBoralus, note=KulTiras, requirements={quest=54972, level=50}, faction="Alliance" },
        },
    [876] = { -- Kul Tiras
        [61404950] = { icon="portal", multilabel={PtoSW, PtoIF, PtoExodar, PtoSilithus, PtoNazjatar}, multinote={ElwynnForest, DunMorogh, AzuremystIsle, Kalimdor}, requirements={multiquest={47186, 47186, 47186, 47186, 54972}, multilevel={[4]=50}}, faction="Alliance" },
        [69046516] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=51438}, faction="Horde" }, -- Tiragarde Sound speak: Erul Dawnbrook
        [25936716] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=51340}, faction="Horde" }, -- Drustvar
        [54371416] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=51696}, faction="Horde" }, -- Stormsong Valley 51902450 boat Grok Seahandler
        [54141818] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=51696}, faction="Horde" }, -- Stormsong Valley 51403370 Flightmaster Muka Stormbreaker
        [20332457] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=55651}, faction="Horde" }, -- Mechagon
--noboat        [20742783] = { icon="boat", label=returntoBoralus, note=TiragardeSound, quest=54992, faction="Alliance" }, --Mechagon --quest=54992,
        [62095274] = { icon="boat", multilabel={BtoVolDun, BtoNazmir, BtoZuldazar}, multinote={Zandalar, Zandalar, Zandalar}, requirements={multiquest={51283, 51088, 51308}}, faction="Alliance" },
        [60855074] = { icon="mixedportal", multilabel={PtoArathiHighlands, PtoDarkshore}, multinote={EasternKingdoms, Kalimdor}, requirements={level=50}, faction="Alliance" },
        [58635379] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}}, faction="Alliance" },
        },
    [895] = { -- Tiragarde Sound
        [74302350] = { icon="portal", multilabel={PtoSW, PtoIF, PtoExodar, PtoSilithus, PtoNazjatar}, multinote={ElwynnForest, DunMorogh, AzuremystIsle, Kalimdor}, requirements={multiquest={47186, 47186, 47186, 47186, 54972}, multilevel={[4]=50}}, faction="Alliance" },
        [73692628] = { icon="boat", multilabel={BtoVolDun, BtoNazmir, BtoZuldazar}, multinote={Zandalar, Zandalar, Zandalar}, faction="Alliance" },
        [73362568] = { icon="mixedportal", multilabel={PtoArathiHighlands, PtoDarkshore}, multinote={EasternKingdoms, Kalimdor}, requirements={level=50}, faction="Alliance" },
        [69453107] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}}, faction="Alliance" },
        },
    [942] = { -- Stormsong Valley
        [51902450] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=51696}, faction="Horde" }, --Stormsong valley 51902450 boat Grok Seahandler
        [51403370] = { icon="boat", label=returntoZuldazar, note=Zandalar, requirements={quest=51696}, faction="Horde" }, --Stormsong Valley 51403370 Flightmaster Muka Stormbreaker
        },
    [1161] = { -- Boralus
        [70401600] = { icon="portal", multilabel={PtoSW, PtoIF, PtoExodar, PtoSilithus, PtoNazjatar}, multinote={ElwynnForest, DunMorogh, AzuremystIsle, Kalimdor}, requirements={multiquest={47186, 47186, 47186, 47186, 54972}, multilevel={[4]=50}}, faction="Alliance" },
        [67952669] = { icon="boat", multilabel={BtoVolDun, BtoNazmir, BtoZuldazar}, multinote={Zandalar, Zandalar, Zandalar}, faction="Alliance" },
        [66352486] = { icon="mixedportal", multilabel={PtoArathiHighlands, PtoDarkshore}, multinote={EasternKingdoms, Kalimdor}, requirements={level=50}, faction="Alliance" }, --quest=53194,
        [50044669] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}}, faction="Alliance" },
        },

--------------------------------------------------------------------------------------------LEGION---------------------------------------------------------------------------------------------

    [619] = { -- Broken Isles
        [30712543] = { icon="orderhall", multilabel={PtoDala, PtoEmeraldDreamway}, multinote={BrokenIsles}, class="DRUID" },
        [63326940] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="DEATHKNIGHT" },
        [45406523] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [46086351] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [33675793] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [33675788] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [52082914] = { icon="portal", label=PtoDala, note=BrokenIsles },
        [65492873] = { icon="portal", label=PtoHelheim, note=Stormheim },
        [41702157] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="HUNTER" }, -- quest=40953, ????
        [52597039] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Broken Shore
        [61353269] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Stormheim
        [34544019] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Val'sharah
        [46022488] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Highmountain
        [33995326] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Azsuna
        [43944460] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Suramar
        },
    [627] = { -- Dalaran Broken Isles
        [39506320] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [55302400] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [58613934] = { icon="petbattleportal", multilabel={244506, 244502, 286079, 301941, 314215}, multinote={NorthernBarrens, Westfall, DunMorogh, EasternPlaguelands, BurningSteppes}, requirements={multiquest={45423, 46291, 54185, 56491, 58457}} },
        [72854121] = { icon="flightmaster", label=GEtoTrueshotLodge, note=BrokenIsles..", "..highmountain, class="HUNTER" }, --quest=40953, ????
        },
    [630] = { -- Azsuna
        [46664141] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [46644121] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [82135737] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [47582809] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [634] = { -- Stormheim
        [30084070] = { icon="portal", label=PtoDala, note=BrokenIsles },
        [73633938] = { icon="portal", label=PtoHelheim, note=Stormheim },
        [60175223] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [649] = { -- Stormheim - Helheim
        [66584793] = { icon="portal", label=PtoStormheim, note=Stormheim },
        },
    [650] = { -- Highmountain
        [34585114] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="HUNTER" }, --quest=40953, ????
        [46115996] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [750] = { -- Highmountain - Thunder Totem
        [39834206] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [641] = { -- Val'sharah
        [41742385] = { icon="orderhall", multilabel={PtoDala, PtoEmeraldDreamway}, multinote={BrokenIsles}, class="DRUID" },
        [54707490] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [680] = { -- Suramar
        [33094822] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [646] = { -- Broken Shore
        [44816132] = { icon="worderhall", label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [830] = { -- Krokuun
        [62008694] = { icon="portal", label=PtoDala, note=BrokenIsles },
        },
    [832] = { -- Krokuun Vindikaar
        [43272508] = { icon="portal", label=PtoDala, note=BrokenIsles },
        },
    [882] = { -- Mac'Aree
        [51668722] = { icon="portal", label=PtoDala, note=BrokenIsles },
        },
    [884] = { -- Mac'Aree Vindikaar
        [49332529] = { icon="portal", label=PtoDala, note=BrokenIsles },
        },
    [885] = { -- Antorische Ödnis
        [75893732] = { icon="portal", label=PtoDala, note=BrokenIsles },
        },
    [887] = { -- Antorische Ödnis Vindikaar
        [33785600] = { icon="portal", label=PtoDala, note=BrokenIsles },
        },

-------------------------------------------------------------------------------------------ORDERHALL-------------------------------------------------------------------------------------------

    [747] = { -- The Dreamgrove *DRUID*
        [56604310] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="DRUID" },
        [55502200] = { icon="orderhall", label=PtoEmeraldDreamway, class="DRUID" },
        },
    [648] = { -- Acherus: The Ebon Hold - Hall of Command *DEATHKNIGHT*
        [24703370] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="DEATHKNIGHT" },
        },
    [720] = { -- Mardum, the Shattered Abyss - Upper Command Center *DEMONHUNTER*
        [59269182] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="DEMONHUNTER" }, --quest=42872, access to orderhall
        [58361658] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="DEMONHUNTER" },
        },
    [734] = { -- Hall of the Guardian *MAGE*
        [57299056] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="MAGE" },
        [66784670] = { icon="orderhall", requirements={spell=223413}, label=PtoValsharah, note=BrokenIsles, class="MAGE" },
        [67214172] = { icon="orderhall", requirements={spell=223413}, label=PtoStormheim, note=BrokenIsles, class="MAGE" },
        [60235191] = { icon="orderhall", requirements={spell=223413}, label=PtoSuramar, note=BrokenIsles, class="MAGE" },
        [54684456] = { icon="orderhall", requirements={spell=223413}, label=PtoHighmountain, note=BrokenIsles, class="MAGE" },
        [54993963] = { icon="orderhall", requirements={spell=223413}, label=PtoAzsuna, note=BrokenIsles, class="MAGE" },
        },
    [726] = { -- The Maelstrom *SHAMAN*
        [29835200] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="SHAMAN" },
        },
    [24] = { -- Light's Hope Chapel *PALADIN*
        [37646407] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="PALADIN" },
--      in Eastern Plaguelands and Eastern Kingdoms another portal POI
        },
    [717] = { -- Dreadscar Rift *WARLOCK*
        [74333750] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="WARLOCK" },
        },
    [702] = { -- Netherlight Temple *PRIEST*
        [49798075] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="PRIEST" },
        },
    [695] = { -- Skyhold *WARRIOR*
--      [58322500] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="WARRIOR" },
        [58322500] = { icon="worderhall", multilabel={dalaran, stormheim, azsuna, valsharah, highmountain, suramar, brokenshore}, note=BrokenIsles, class="WARRIOR" },
        },
    [709] = { -- The Wandering Isle *MONK*
        [52405714] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="MONK" },
        [50055441] = { icon="orderhall", label=PtoPeakofSerenity, note=KunLaiSummit, class="MONK" },
        },
    [739] = { -- Trueshotlodge *HUNTER*
        [48634352] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="HUNTER" }, --quest=40953, access to orderhall ???
        },

----------------------------------------------------------------------------------------------WoD----------------------------------------------------------------------------------------------

    [572] = { -- Draenor
        [73004300] = { icon="portal", multilabel={PtoOG, PtoVolmar}, multinote={Durotar, TanaanJungle}, requirements={multiquest={[2]=37935}}, faction="Horde" },
        [73014305] = { icon="portal", multilabel={PtoSW, PtoLionswatch}, multinote={ElwynnForest, TanaanJungle}, requirements={multiquest={[2]=38445}}, faction="Alliance" },
        [34683698] = { icon="portal", label=PtoWarspear, note=Ashran, requirements={quest=36614}, faction="Horde" },
        [53556087] = { icon="portal", label=PtoStormshield, note=Ashran, requirements={quest=36615}, faction="Alliance" },
        [60424563] = { icon="portal", label=PtoWarspear, note=Ashran, requirements={quest=37935}, faction="Horde" },
        [59594867] = { icon="portal", label=PtoStormshield, note=Ashran, requirements={quest=38445}, faction="Alliance" },
        },
    [588] = { -- Ashran
        [44001300] = { icon="portal", multilabel={PtoOG, PtoVolmar}, multinote={Durotar, TanaanJungle}, requirements={multiquest={[2]=37935}}, faction="Horde" },
        [40009000] = { icon="portal", multilabel={PtoSW, PtoLionswatch}, multinote={ElwynnForest, TanaanJungle}, requirements={multiquest={[2]=38445}}, faction="Alliance" },
        },
    [590] = { -- Frostwall (Garrison)
        [75104890] = { icon="portal", label=PtoWarspear, note=Ashran, requirements={quest=36614}, faction="Horde" },
        },
    [525] = { -- Frostfire Ridge
        [51496593] = { icon="portal", label=PtoWarspear, note=Ashran, requirements={quest=36614}, faction="Horde" },
        },
    [582] = { -- Lunarfall (Garrison)
        [70102750] = { icon="portal", label=PtoStormshield, note=Ashran, requirements={quest=36615}, faction="Alliance" },
        },
    [539] = { -- Shadowmoon Valley
        [32871553] = { icon="portal", label=PtoStormshield, note=Ashran, requirements={quest=36615}, faction="Alliance" },
        },
    [534] = { -- Tanaan Jungle
        [61004734] = { icon="portal", label=PtoWarspear, note=Ashran, requirements={quest=37935}, faction="Horde" },
        [57446050] = { icon="portal", label=PtoStormshield, note=Ashran, requirements={quest=38445}, faction="Alliance" },
        },
    [624] = { -- Warspear (Ashran)
        [60705160] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [53104390] = { icon="portal", label=PtoVolmar, note=TanaanJungle, requirements={quest=37935}, faction="Horde" },
        },
    [622] = { -- Stormshield (Ashran)
        [60903800] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [36314116] = { icon="portal", label=PtoLionswatch, note=TanaanJungle, requirements={quest=38445}, faction="Alliance" },
        },

----------------------------------------------------------------------------------------------MoP----------------------------------------------------------------------------------------------

    [424] = { -- Pandaria
        [29534767] = { icon="portal", label=PtoIofT, note=Pandaria, requirements={quest=32680}, faction="Horde" },
        [29144595] = { icon="portal", label=PtoIofT, note=Pandaria, requirements={quest=32681}, faction="Alliance" },
        [19100943] = { icon="portal", label=PtoSPG, note=TownlongSteppes, requirements={quest=32212}, faction="Horde" },
        [24331611] = { icon="portal", label=PtoSPG, note=TownlongSteppes, requirements={quest=32644}, faction="Alliance" },
        [55215658] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [67816760] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [59883557] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [50784779] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [44792782] = { icon="orderhall", label=PtoOG, note=Durotar, class="MONK", faction="Horde" },
        [44972774] = { icon="orderhall", label=PtoSW, note=ElwynnForest, class="MONK", faction="Alliance" },
        },
    [390] = { -- Vale of Eternal Blossoms
        [90876620] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63461261] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [1530] = { -- Vale of Eternal Blossoms BFA Vision of N'Zoth
        [91606427] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63720988] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [392] = { -- Shrine of Two Moons - The Imperial Mercantile
        [73304270] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [394] = { -- Shrine of Seven Stars - The Imperial Exchange
        [71703570] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [388] = { -- Townlong Steppes
        [49746867] = { icon="portal", label=PtoIofT, note=Pandaria, requirements={quest=32681}, faction="Alliance" },
        [50607340] = { icon="portal", label=PtoIofT, note=Pandaria, requirements={quest=32680}, faction="Horde" },
        },
    [379] = { -- Kun-Lai Summit
        [48534357] = { icon="orderhall", label=PtoOG, note=Durotar, class="MONK", faction="Horde" },
        [48964336] = { icon="orderhall", label=PtoSW, note=ElwynnForest, class="MONK", faction="Alliance" },
        },
--[[    [371] = { -- The Jade Forest
        [28501401] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
]]--
    [504] = { -- Isle of Thunder
        [64707348] = { icon="portal", label=PtoSPG, note=TownlongSteppes, requirements={quest=32644}, faction="Alliance" },
        [33213269] = { icon="portal", label=PtoSPG, note=TownlongSteppes, requirements={quest=32212}, faction="Horde" },
        },

---------------------------------------------------------------------------------------------CATA----------------------------------------------------------------------------------------------

    [198] = { -- Mount Hyjal
        [62602310] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63492444] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [207] = { -- Deepholm
        [48515381] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [50935310] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [49325034] = { icon="portal", label=PtoTherazanesThrone, note=Deepholm, requirements={quest=26709} },
        [57211352] = { icon="portal", label=PtoTempleofEarth, note=Deepholm, requirements={quest=26971} },
        },
    [948] = { -- Maelstrom
        [51182842] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [51172840] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [241] = { -- Twilight Highlands
        [79517782] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={quest=27537}, faction="Alliance" },
        [73625351] = { icon="portal", label=PtoOG, note=Durotar, requirements={quest=26798}, faction="Horde" },
        },
    [244] = { -- Tol Barad
        [47115193] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={level=30}, faction="Alliance" },
        [47115192] = { icon="portal", label=PtoOG, note=Durotar, requirements={level=30}, faction="Horde" },
        },
    [245] = { -- Tol Barad Peninsula
        [75255887] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={level=30}, faction="Alliance" },
        [56277966] = { icon="portal", label=PtoOG, note=Durotar, requirements={level=30}, faction="Horde" },
        },

---------------------------------------------------------------------------------------------WotLK---------------------------------------------------------------------------------------------

    [125] = { -- Dalaran Northrend
        [40086282] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [55302542] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [25634785] = { icon="portal", label=PtotPurpleParlor },
        },
    [127] = { -- Crystalsong Forest
        [26194278] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [31223174] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [113] = { -- Northrend
        [47874119] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [48664124] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [78858355] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [78858356] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [24607066] = { icon="aboat", label=BtoSW, note=ElwynnForest, faction="Horde" },
        [24607065] = { icon="boat", label=BtoSW, note=ElwynnForest, faction="Alliance" },
        [47106782] = { icon="boat", multilabel={BtoUnuPe, BtoKamagua}, multinote={BoreanTundra, HowlingFjord} },
        [30506590] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [66408188] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [17556488] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [17556489] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [84057266] = { icon="portal", label=PtoUC, note=Tirisfal, faction="Horde" },
        },
    [115] = { -- Dragonblight
        [47797887] = { icon="boat", label=BtoUnuPe, note=BoreanTundra },
        [49847853] = { icon="boat", label=BtoKamagua, note=HowlingFjord },
        },
    [114] = { -- Borean Tundra
        [79015410] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [59946947] = { icon="aboat", label=BtoSW, note=ElwynnForest, faction="Horde" },
        [41255344] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [41255345] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [117] = { -- Howling Fjord
        [23295769] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [61506270] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [77612813] = { icon="portal", label=PtoUC, note=Tirisfal, faction="Horde" },
        },

----------------------------------------------------------------------------------------------BC-----------------------------------------------------------------------------------------------

    [100] = { -- Hellfire Peninsula
        [89225101] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [89234946] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [111] = { -- Shattrath City
        [57224827] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [48594200] = { icon="portal", label=PtoIofQD, note=EasternKingdoms },
        [56834888] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [74803160] = { icon="portal", label=PtoCavernsofTime, note=Tanaris..")\n("..L["Speak with Zephyr"], requirements={reputation={989,7} } }
        },
    [101] = { -- Outland
        [43886598] = { icon="portal", multilabel={PtoSW, PtoIofQD}, multinote={ElwynnForest, EasternKingdoms}, faction="Alliance" },
        [43886599] = { icon="portal", multilabel={PtoOG, PtoIofQD}, multinote={Durotar, EasternKingdoms}, faction="Horde" },
        [69075236] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [69075190] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [108] = { -- Terokkar Forest
        [30252350] = { icon="portal", multilabel={PtoSW, PtoIofQD}, multinote={ElwynnForest, EasternKingdoms}, faction="Alliance" },
        [30252350] = { icon="portal", multilabel={PtoOG, PtoIofQD}, multinote={Durotar, EasternKingdoms}, faction="Horde" },
        },
    [103] = { -- Exodar
        [48306290] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [97] = { -- Azuremyst Isle
        [20335407] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, label=PtoDarnassus, note=Teldrassil },
        [26364616] = { icon="portal", label=PtoSW, note=ElwynnForest..")\n("..inExodar.."", faction="Alliance" },
        },
    [110] = { -- Silvermoon City
        [49401510] = { icon="portal", label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        [58501890] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [94] = { -- Eversong Woods
        [52803270] = { icon="portal", multilabel={PtoUC, PtoOG}, multinote={Tirisfal, Durotar}, faction="Horde" },
        },

--------------------------------------------------------------------------------------------Vanilla--------------------------------------------------------------------------------------------

    [12] = { -- Kalimdor
        [59236650] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [59246651] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [56835629] = { icon="boat", label=BtoBootyBay, note=StranglethornVale },
        [43561640] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, multilabel={PtoSW, PtoExodar}, multinote={ElwynnForest, AzuremystIsle},faction="Alliance" },
        [39401090] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, multilabel={PtoExodar, PtoHellfirePeninsula}, multinote={AzuremystIsle, Outland}, faction="Alliance" },
        [43211616] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, label=PtoExodar, note=Teldrassil, faction="Horde" },
        [29922620] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [59468340] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [59448340] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [56122758] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [56222774] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [29332713] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, label=PtoDarnassus, note=Teldrassil },
        [45405420] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [45405421] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [58154245] = { icon="zeppelin", multilabel={ZtoTB, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, GromgolBaseCamp, WarsongHold}, faction="Horde" },
        [58154246] = { icon="hzeppelin", multilabel={ZtoTB, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, GromgolBaseCamp, WarsongHold}, faction="Alliance" },
        [42857909] = { icon="portal", requirements={quest=46931, level=50, timetravel={quest=50659, spell=255152, turn=true}}, label=PtoZuldazar, note=Zandalar, faction="Horde" },
        [42847905] = { icon="portal", requirements={level=50, timetravel={quest=50659, spell=255152, turn=true}}, label=PtoBoralus, note=TiragardeSound, faction="Alliance" },
        [59414237] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands, PtoUC, PtoDala, PtoJadeForest, PtoZuldazar, PtoAzsuna, PtoWarspear, PtoShattrath, PtoCavernsofTime, PtoOribos},
                                      multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms, Tirisfal, CrystalsongForest, Pandaria, Zandalar, BrokenIsles, Ashran, TerokkarForest, Tanaris, Shadowlands},
                                      requirements={multiquest={[4]=25924, [6]=26798, [10]=46931, [15]=60151}}, faction="Horde" },
        [46612303] = { icon="portal", requirements={level=50, warfront=118, timetravel={quest=54411, spell=290245}}, label=PtoPortofBoralus, note=TiragardeSound, faction="Alliance" },
        [46302282] = { icon="portal", requirements={level=50, warfront=118, timetravel={quest=54411, spell=290245}}, label=PtoPortofZandalar, note=Zuldazar, faction="Horde" },
        },
    [7] = { -- Mulgore
        [33692368] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [33692369] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [88] = { -- Thunder Bluff
        [14222574] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [14222575] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [1] = { -- Durotar
        [47881015] = { icon="portal", multilabel={PtoDala, PtoJadeForest, PtoZuldazar, PtoAzsuna, PtoWarspear, PtoShattrath, PtoCavernsofTime, PtoOribos},
                                    multinote={CrystalsongForest, Pandaria, Zandalar, BrokenIsles, Ashran, TerokkarForest, Tanaris, Shadowlands},
                                    requirements={multiquest={[3]=46931, [8]=60151}}, faction="Horde" },
        [45550380] = { icon="hzeppelin", multilabel={ZtoTB, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, GromgolBaseCamp, WarsongHold}, faction="Alliance" },
        [45550381] = { icon="zeppelin", multilabel={ZtoTB, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, GromgolBaseCamp, WarsongHold}, faction="Horde" },
        [46980375] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands, PtoUC}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms, Tirisfal}, requirements={multiquest={[4]=25924, [6]=26798}}, faction="Horde" },
        },
    [85] = { -- Orgrimmar
        [59078945] = { icon="portal", multilabel={PtoDala, PtoJadeForest, PtoZuldazar, PtoAzsuna, PtoWarspear, PtoShattrath, PtoCavernsofTime, PtoOribos}, multinote={CrystalsongForest, Pandaria, Zandalar, BrokenIsles, Ashran, TerokkarForest, Tanaris, Shadowlands}, requirements={multiquest={[3]=46931, [8]=60151}}, faction="Horde" },
        [50435651] = { icon="portal", label=PtoUC, note=Tirisfal, faction="Horde" },
        [43126480] = { icon="zeppelin", label=ZtoTB, note=Mulgore, faction="Horde" },
        [43126481] = { icon="hzeppelin", label=ZtoTB, note=Mulgore, faction="Alliance" },
        [50103773] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, requirements={multiquest={[4]=25924, [6]=26798}}, faction="Horde" },
                                    -- TolBarad at level 30
                                    -- other portals at level ?? Shadowlands
        [45306178] = { icon="hzeppelin", label=ZtoBoreanTundra, note=WarsongHold, faction="Alliance" },
        [52885242] = { icon="hzeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance" },
        },
    [71] = { -- Tanaris
        [65794954] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [65924954] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [74] = { -- Cavern of Time
        [58202660] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [59002670] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [81] = { -- Silithus
        [41604520] = { icon="portal", requirements={quest=46931, level=50, timetravel={quest=50659, spell=255152, turn=true}}, label=PtoZuldazar, note=Zandalar, faction="Horde" },
        [41474479] = { icon="portal", requirements={level=50, timetravel={quest=50659, spell=255152, turn=true}}, label=PtoBoralus, note=TiragardeSound, faction="Alliance" },
        },
    [70] = { -- Dustwallow Marsh
        [71625648] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [71625647] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        },
    [62] = { -- Darkshore
        [48023627] = { icon="portal", requirements={level=50, warfront=118, timetravel={quest=54411, spell=290245}}, label=PtoPortofBoralus, note=TiragardeSound, faction="Alliance" },
        [46243511] = { icon="portal", requirements={level=50, warfront=118, timetravel={quest=54411, spell=290245}}, label=PtoPortofZandalar, note=Zuldazar, faction="Horde" },
        },
    [89] = { -- Darnassus
        [44247867] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, multilabel={PtoExodar, PtoHellfirePeninsula}, multinote={AzuremystIsle, Outland}, faction="Alliance" },
        },
    [57] = { -- Teldrassil
        [29085646] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, multilabel={PtoExodar, PtoHellfirePeninsula}, multinote={AzuremystIsle, Outland}, faction="Alliance" },
        [55009370] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [52048951] = { icon="portal", requirements={timetravel={quest=54411, spell=290245}}, label=PtoExodar, note=AzuremystIsle },
        },
    [56] = { -- Wetlands
        [06216261] = { icon="aboat", label=BtoTheramore, note=DustwallowMarsh, faction="Horde" },
        [04415718] = { icon="aboat", label=BtoHowlingFjord, note=Valgarde, faction="Horde" },
        },
--[[    NOT USED
    [10] = { -- Northern Barrens
        [70307341] = { icon="boat", label=format(BtoBootyBay) },
        },
    [210] = { -- Cape of Stranglethorn
        [38546670] = { icon="boat", label=format(BtoRatchet) },
        },
]]--
    [13] = { -- Eastern Kingdom
        [44068694] = { icon="zeppelin", multilabel={ZtoOG, PtoUC}, multinote={Durotar, Tirisfal}, faction="Horde" },
        [44068695] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [41107209] = { icon="aboat", multilabel={BtoBoralus, BtoBoreanTundra}, multinote={KulTiras, ValianceKeep}, faction="Horde" },
        [41107210] = { icon="boat", multilabel={BtoBoralus, BtoBoreanTundra, PtoDarnassus}, multinote={TiragardeSound, ValianceKeep, Teldrassil}, faction="Alliance" },
        [45995488] = { icon="aboat", multilabel={BtoTheramore, BtoHowlingFjord}, multinote={DustwallowMarsh, Valgarde}, faction="Horde" },
        [45995482] = { icon="boat", multilabel={BtoTheramore, BtoHowlingFjord}, multinote={DustwallowMarsh, Valgarde}, faction="Alliance" },
        [42999362] = { icon="boat", label=BtoRatchet, note=NorthernBarrens },
        [56161316] = { icon="portal", multilabel={PtoOG, PtoUC}, multinote={Durotar, Tirisfal}, faction="Horde" },
        [43637155] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands, DrTtoIF, PtoDarnassus, PtoDala, PtoJadeForest, PtoBoralus, PtoAzsuna, PtoStormshield, PtoShattrath, PtoExodar, PtoCavernsofTime, PtoOribos},
                                    multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms, DunMorogh, Teldrassil, CrystalsongForest, Pandaria, TiragardeSound, BrokenIsles, Ashran, TerokkarForest, AzuremystIsle, Tanaris, Shadowlands},
                                    requirements={multiquest={[11]=47186, [17]=60151}}, faction="Alliance" },
        [43337195] = { icon="tram", label=DrTtoIF, note=DunMorogh, faction="Horde" },
        [43863354] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, multilabel={PtoHowlingFjord, PtoOG, PtoStranglethornVale, PtoSM, PtoHellfirePeninsula}, multinote={VengeanceLanding, Durotar, GromgolBaseCamp, EversongWoods, Outland}, faction="Horde" },
        [47835898] = { icon="tram", label=DrTtoSW, note=ElwynnForest },
        [60835906] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={quest=27537}, faction="Alliance" },
        [35224839] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={level=30}, faction="Alliance" },
        [60105603] = { icon="portal", label=PtoOG, note=Durotar, requirements={quest=26798}, faction="Horde" }, --quest=26798,
        [34394957] = { icon="portal", label=PtoOG, note=Durotar, requirements={level=30}, faction="Horde" },
        [57663241] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="PALADIN" },
        [49714419] = { icon="portal", requirements={level=50, warfront=11, timetravel={quest=52781, spell=276950}}, label=PtoPortofZandalar, note=Zuldazar, faction="Horde" },
        [49244725] = { icon="portal", requirements={level=50, warfront=11, timetravel={quest=52781, spell=276950}}, label=PtoPortofBoralus, note=TiragardeSound, faction="Alliance" },
        [41003949] = { icon="portal", label=PtoDalaCrater, note=HillsbradFoothills, faction="Horde", requirements={quest=27478} },
        [43674008] = { icon="portal", label=PtoSepulcher, note=SilverpineForest, faction="Horde", requirements={quest=27478} },
        },
    [84] = { -- Stormwind City
        [74481841] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, faction="Alliance" },
        [46419032] = { icon="portal", multilabel={PtoDala, PtoJadeForest, PtoBoralus, PtoAzsuna, PtoStormshield, PtoShattrath, PtoExodar, PtoCavernsofTime, PtoOribos},
                                    multinote={CrystalsongForest, Pandaria, TiragardeSound, BrokenIsles, Ashran, TerokkarForest, AzuremystIsle, Tanaris, Shadowlands}, faction="Alliance" },
        [22015670] = { icon="aboat", label=BtoBoralus, note=TiragardeSound, faction="Horde" },
        [17592553] = { icon="aboat", label=BtoBoreanTundra, note=ValianceKeep, faction="Horde" },
        [23805620] = { icon="portal", label=PtoDarnassus, note=Teldrassil, faction="Alliance" },
        [69403140] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        },
    [499] = { -- Deeprun Tram
        [42554350] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        [42556750] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        },
    [37] = { -- Elwynn Forest
        [17804775] = { icon="portal", multilabel={PtoDala, PtoJadeForest, PtoBoralus, PtoAzsuna, PtoStormshield, PtoShattrath, PtoExodar, PtoCavernsofTime, PtoOribos},
                                    multinote={CrystalsongForest, Pandaria, TiragardeSound, BrokenIsles, Ashran, TerokkarForest, AzuremystIsle, Tanaris, Shadowlands}, faction="Alliance" },
        [06003035] = { icon="aboat", label=BtoBoralus, note=TiragardeSound, faction="Horde" },
        [03631530] = { icon="aboat", label=BtoBoreanTundra, note=ValianceKeep, faction="Horde" },
        [07253035] = { icon="portal", label=PtoDarnassus, note=Teldrassil, faction="Alliance" },
        [31801155] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, faction="Alliance" },
        [29251812] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        },
    [90] = { -- Undercity
        [85301700] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, label=PtoHellfirePeninsula, note=Outland, faction="Horde" },
        },
    [18] = { -- Tirisfal Glades
        [65906865] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, label=PtoHellfirePeninsula, note=Outland..")\n("..inUCMq.."", faction="Horde" },
        [59416743] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
        [60475885] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, label=PtoOG, note=Durotar, faction="Horde" },
        [62035926] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, label=PtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
        [58875901] = { icon="portal", requirements={timetravel={quest=52758, spell=276824}}, label=PtoHowlingFjord, note=VengeanceLanding, faction="Horde" },
        },
    [21] = { -- Silverpine Forest
        [47254337] = { icon="portal", label=PtoDalaCrater, note=HillsbradFoothills, faction="Horde", requirements={quest=27478} },
        },
    [25] = { -- Hillsbrad Foothills
        [30293662] = { icon="portal", label=PtoSepulcher, note=SilverpineForest, faction="Horde", requirements={quest=27478} },
        },
    [14] = { -- Arathi Highlands
        [27432937] = { icon="portal", requirements={level=50, warfront=11, timetravel={quest=52781, spell=276950}}, label=PtoPortofZandalar, note=Zuldazar, faction="Horde" },
        [21956514] = { icon="portal", requirements={level=50, warfront=11, timetravel={quest=52781, spell=276950}}, label=PtoPortofBoralus, note=TiragardeSound, faction="Alliance" },
        },
    [50] = { -- Northern Stranglethorn
        [37195161] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [224] = { -- Stranglethorn Vale
        [41403390] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [23] = { -- Eastern Plaguelands
        [75234942] = { icon="orderhall", label=PtoDala, note=BrokenIsles, class="PALADIN" },
        },
    [27] = { -- Dun Morogh
        [70452731] = { icon="tram", label=DrTtoSW, note=ElwynnForest },
        },
    [87] = { -- Ironforge
        [76205120] = { icon="tram", label=DrTtoSW, note=ElwynnForest },
        },

}