----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...
local L = private.locale

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local function GetMapNames(id1, id2)
    if (id1 and id2) then
        return format("%s, %s", C_Map.GetMapInfo(id1).name, C_Map.GetMapInfo(id2).name)
    else
        return C_Map.GetMapInfo(id1).name
    end
end

local GetAreaInfo = C_Map.GetAreaInfo

----------------------------------------------------------------------------------------------------

local EasternKingdoms = GetMapNames(1415)
local Kalimdor = GetMapNames(1414)
local ElwynnForest = GetMapNames(1415, 1429)
local DrTtoIF = L["Deeprun Tram to Ironforge"]

local DunMorogh = GetMapNames(1415, 1426)
local DrTtoSW = L["Deeprun Tram to Stormwind"]

local Durotar = GetMapNames(1414, 1411)
local ZtoOG = L["Zeppelin to Orgrimmar"]

local Tirisfal = GetMapNames(1415, 1420)
local ZtoUC = L["Zeppelin to Undercity"]
local PtoUC = L["Portal to Undercity"]
local Orboftranslocation = L["Orb of translocation"]

local Barrens = GetMapNames(1414, 1413)
local BtoBootyBay = L["Boat to Booty Bay"]

local Wetlands = GetMapNames(1415, 1437)
local BtoMenethilHarbor = L["Boat to Menethil Harbor"]

local GromgolBaseCamp = GetMapNames(1415)..", "..GetAreaInfo(117)
local ZtoStranglethornVale = L["Zeppelin to Stranglethorn Vale"]
local BtoRatchet = L["Boat to Ratchet"]

local DustwallowMarsh = GetMapNames(1414, 1445)
local BtoTheramore = L["Boat to Theramore Isle"]

local Teldrassil = GetMapNames(1414, 1438)
local BtoDarnassus = L["Boat to Darnassus"]

local EversongWoods = GetMapNames(1415, 1941)
local PtoSM = L["Portal to Silvermoon"]

local Mulgore = GetMapNames(1414, 1412)
local SPtoOG = L["Shattrath Portal to Orgrimmar"]

local AzuremystIsle = GetMapNames(1414, 1943)
local BtoExodar = L["Boat to Exodar"]
local SPtoSW = L["Shattrath Portal to Stormwind"]

local SPtoIoQD = L["Shattrath Portal to Isle of Quel'Danas"]

local PtoExodar = L["Portal to Exodar"]
local PtoDarnassus = L["Portal to Darnassus"]

------------------------------------------------WotLK-----------------------------------------------

local PtotPurpleParlor = L["Portal to the Purple Parlor"]
local BoreanTundra = GetMapNames(113, 114)
local ZtoBoreanTundra = L["Zeppelin to Borean Tundra"]
local BtoBoreanTundra = L["Boat to Borean Tundra"]
local WarsongHold = GetMapNames(113)..", "..GetAreaInfo(4129)
local ValianceKeep = GetMapNames(113)..", "..GetAreaInfo(4032)
local BtoUnuPe = L["Boat to Unu'pe"]
local Dragonblight = GetMapNames(113, 115)
local BtoMoaKiHarbor = L["Boat to Moa'ki Harbor"]
local HowlingFjord = GetMapNames(113, 117)
local VengeanceLanding = GetMapNames(113)..", "..GetAreaInfo(4000)
local BtoHowlingFjord = L["Boat to Howling Fjord"]
local Valgarde = GetMapNames(113)..", "..GetAreaInfo(3981)
local BtoKamagua = L["Boat to Kamagua"]
local Northrend = GetMapNames(113)
local WtoSholazarBasin = L["Waygate to Sholazar Basin"]
local WtoUngoroCrater = L["Waygate to Un'Goro Crater"]
local ZtoTB = L["Zeppelin to Thunder Bluff"]

local PtoSW = L["Portal to Stormwind"]
local BtoSW = L["Boat to Stormwind"]
local PtoOG = L["Portal to Orgrimmar"]
local ZtoHF = L["Zeppelin to Howling Fjord"]
local PtoBL = L["Portal to Blasted Lands"]
local DPtoCavernsOfTime = L["Dalaran Portal to Caverns of Time"]
local ToCavernsofTime = L["To Caverns of Time"]
local Tanaris = GetMapNames(1414, 1446)

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
local StranglethornCape = GetMapNames(1415, 210)
local NorthernBarrens = GetMapNames(1414, 1413)
local PtoDalaCrater = L["Portal to Dalaran Crater"]
local HillsbradFoothills = GetMapNames(1415, 1424)
local PtoSepulcher = L["Portal to the Sepulcher"]
local SilverpineForest = GetMapNames(1415, 1421)

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

local DB = {}

private.DB = DB

DB.points = {
-- MAPID from https://wow.gamepedia.com/UiMapID/Classic
-- or collected with /dump WorldMapFrame:GetMapID()

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
            },
            faction       = ["FACTION"],        -- shows only for selected faction
            class         = [CLASS NAME],       -- shows only for selected class
        },
    },
]]

---------------------------------------------------------Vanilla---------------------------------------------------------

    [1429] = { -- Elwynn Forest
        [29201782] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        [05413058] = { icon="boat", label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
        [05413057] = { icon="aboat", label=BtoDarnassus, note=Teldrassil, faction="Horde" },
        [03221535] = { icon="boat", label=BtoBoreanTundra, note=ValianceKeep, faction="Alliance" },
        [03221534] = { icon="aboat", label=BtoBoreanTundra, note=ValianceKeep, faction="Horde" },
        [19124614] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Alliance" },
        [31891165] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, requirements={multiquest={[2]=28112, [3]=27123, [4]=25924, [5]=25316, [6]=27537}, multilevel={85}}, faction="Alliance" },
        },
    [1453] = { -- Stormwind
        [69173073] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        [21605625] = { icon="boat", label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
        [21605624] = { icon="aboat", label=BtoDarnassus, note=Teldrassil, faction="Horde" },
        [17442547] = { icon="boat", label=BtoBoreanTundra, note=ValianceKeep, faction="Alliance" },
        [17222582] = { icon="aboat", label=BtoBoreanTundra, note=ValianceKeep, faction="Horde" },
        [48988734] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Alliance" },
        [74501844] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, requirements={multiquest={[2]=28112, [3]=27123, [4]=25924, [5]=25316, [6]=27537}, multilevel={85}}, faction="Alliance" },
        },
    [1456] = { -- Thunderbluff
        [23151351] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" },
        [14482574] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [14482575] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" }
        },
    [1411] = { -- Durotar
        [35587974] = { icon="boat", label=BtoBootyBay, note=StranglethornCape },
        [45550380] = { icon="hzeppelin", multilabel={ZtoTB, ZtoUC, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, Tirisfal, GromgolBaseCamp, WarsongHold}, faction="Alliance" },
        [45550381] = { icon="zeppelin", multilabel={ZtoTB, ZtoUC, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, Tirisfal, GromgolBaseCamp, WarsongHold}, faction="Horde" },
        [40860349] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" }
        },
    [1412] = { -- Mulgore
        [35392133] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde"},
        [33732368] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [33732369] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" }
        },
    [1420] = { -- Tirisfal Glades
        [60695877] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [60695878] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [61885907] = { icon="zeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
        [61885906] = { icon="hzeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance" },
        [59085903] = { icon="zeppelin", label=ZtoHF, note=VengeanceLanding, faction="Horde" },
        [59085904] = { icon="hzeppelin", label=ZtoHF, note=VengeanceLanding, faction="Alliance" },
        [59456744] = { icon="portal", label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
        [65896867] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" }
        },
    [1437] = { -- Wetlands
        [06016237] = { icon="boat", label=BtoTheramore, note=DustwallowMarsh, faction="Alliance" },
        [06016238] = { icon="aboat", label=BtoTheramore, note=DustwallowMarsh, faction="Horde" },
        [04875528] = { icon="boat", label=BtoHowlingFjord, note=Valgarde, faction="Alliance" },
        [04875529] = { icon="aboat", label=BtoHowlingFjord, note=Valgarde, faction="Horde" }
        },
    [1414] = { -- Kalimdor
        [56825626] = { icon="boat", label=BtoBootyBay, note=StranglethornCape },
        [59276853] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [59276854] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [43631888] = { icon="boat", multilabel={BtoSW, BtoExodar}, multinote={ElwynnForest, AzuremystIsle}, faction="Alliance" },
        [43631889] = { icon="aboat", multilabel={BtoSW, BtoExodar}, multinote={ElwynnForest, AzuremystIsle}, faction="Horde" },
        -- [44292533] = { icon="aboat", multilabel={BtoDarnassus, BtoExodar, BtoSW}, multinote={Teldrassil, AzuremystIsle, ElwynnForest}, faction="Horde" },
        -- [44262534] = { icon="boat", multilabel={BtoDarnassus, BtoExodar, BtoSW}, multinote={Teldrassil, AzuremystIsle, ElwynnForest}, faction="Alliance" },
        [58254534] = { icon="zeppelin", multilabel={ZtoTB, ZtoUC, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, Tirisfal, GromgolBaseCamp, WarsongHold}, faction="Horde" },
        [58254535] = { icon="hzeppelin", multilabel={ZtoTB, ZtoUC, ZtoStranglethornVale, ZtoBoreanTundra}, multinote={Mulgore, Tirisfal, GromgolBaseCamp, WarsongHold}, faction="Alliance" },
        [45385636] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [45385637] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [29302792] = { icon="boat", label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
        [29302793] = { icon="aboat", label=BtoDarnassus, note=Teldrassil, faction="Horde" },
        [50007727] = { icon="portal", label=WtoSholazarBasin, note=Northrend, requirements={quest=12613} },
        [57584530] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" },
        [45625602] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" },
        [39561280] = { icon="portal", multilabel={PtoBL, PtoExodar}, multinote={EasternKingdoms, AzuremystIsle}, faction="Alliance" },
        [29992703] = { icon="portal", multilabel={PtoBL, PtoDarnassus}, multinote={EasternKingdoms, Teldrassil}, faction="Alliance" },
        [56122958] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [56222973] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" }
        },
    [1413] = { -- The Barrens
        [70427342] = { icon="boat", label=BtoBootyBay, note=StranglethornCape },
        [75270326] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" }
        },
    [199] = { -- Southern Barrens
        [70152442] = { icon="boat", label=BtoBootyBay, note=StranglethornCape },
        [82188528] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [82188529] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" }
        },
    [1415] = { -- Eastern Kingdom
        [43179374] = { icon="boat", label=BtoRatchet, note=Barrens },
        [43337195] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        [47835898] = { icon="tram", label=DrTtoSW, note=ElwynnForest },
        [43953355] = { icon="zeppelin", multilabel={ZtoOG, ZtoStranglethornVale, ZtoHF}, multinote={Durotar, GromgolBaseCamp, VengeanceLanding}, faction="Horde" },
        [43953356] = { icon="hzeppelin", multilabel={ZtoOG, ZtoStranglethornVale, ZtoHF}, multinote={Durotar, GromgolBaseCamp, VengeanceLanding}, faction="Alliance" },
        [44098694] = { icon="zeppelin", multilabel={ZtoOG, ZtoUC}, multinote={Durotar, Tirisfal}, faction="Horde" },
        [44098693] = { icon="hzeppelin", multilabel={ZtoOG, ZtoUC}, multinote={Durotar, Tirisfal}, faction="Alliance" },
        [46085508] = { icon="aboat", multilabel={BtoTheramore, BtoHowlingFjord}, multinote={DustwallowMarsh, Valgarde}, faction="Horde" },
        [46085509] = { icon="boat", multilabel={BtoTheramore, BtoHowlingFjord}, multinote={DustwallowMarsh, Valgarde}, faction="Alliance" },
        [56041304] = { icon="portal", multilabel={PtoUC, PtoBL}, multinote={Tirisfal..") ("..Orboftranslocation.."", EasternKingdoms}, faction="Horde" },
        [43753451] = { icon="portal", multilabel={PtoSM, PtoBL}, multinote={EversongWoods..") ("..Orboftranslocation.."", EasternKingdoms}, faction="Horde" },
        [41297301] = { icon="boat", multilabel={BtoDarnassus, BtoBoreanTundra}, multinote={Teldrassil, ValianceKeep}, faction="Alliance" },
        [41297302] = { icon="aboat", multilabel={BtoDarnassus, BtoBoreanTundra}, multinote={Teldrassil, ValianceKeep}, faction="Horde" },
        [42467434] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Alliance" },
        [46885813] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Alliance" },
        [60875918] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={quest=27537}, faction="Alliance" },
        [60115603] = { icon="portal", label=PtoOG, note=Durotar, requirements={quest=26798}, faction="Horde" },
        [43557140] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, requirements={multiquest={[2]=28112, [3]=27123, [4]=25924, [5]=25316, [6]=27537}, multilevel={85}}, faction="Alliance" },
        [41003949] = { icon="portal", label=PtoDalaCrater, note=HillsbradFoothills, faction="Horde", requirements={quest=27478} },
        [43674008] = { icon="portal", label=PtoSepulcher, note=SilverpineForest, faction="Horde", requirements={quest=27478} },
        [35224839] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={level=85}, faction="Alliance" },
        [34394957] = { icon="portal", label=PtoOG, note=Durotar, requirements={level=85}, faction="Horde" },
        },
    [1434] = { -- Northern Barrens
        [37015273] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [37015274] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [37485055] = { icon="zeppelin", label=ZtoUC, note=Tirisfal, faction="Horde" },
        [37485056] = { icon="hzeppelin", label=ZtoUC, note=Tirisfal, faction="Alliance" }
        },
    [224] = { -- Stranglethorn Vale
        [36567576] = { icon="boat", label=BtoRatchet, note=Barrens },
        [42253355] = { icon="zeppelin", multilabel={ZtoOG, ZtoUC}, multinote={Durotar, Tirisfal}, faction="Horde" },
        [42253356] = { icon="hzeppelin", multilabel={ZtoOG, ZtoUC}, multinote={Durotar, Tirisfal}, faction="Alliance" }
        },
    [210] = { -- Cape of Stranglethorn
        [38706680] = { icon="boat", label=BtoRatchet, note=NorthernBarrens }
        },
    [1426] = { -- Dun Morogh
        [63432936] = { icon="tram", label=DrTtoSW, note=ElwynnForest },
        [62612036] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Alliance" }
        },
    [1454] = { -- Orgrimmar
        [35466911] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" },
        [47116194] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" },
        [50725559] = { icon="zeppelin", label=ZtoUC, note=Tirisfal, faction="Horde" },
        [50725558] = { icon="hzeppelin", label=ZtoUC, note=Tirisfal, faction="Alliance" },
        [42866518] = { icon="zeppelin", label=ZtoTB, note=Mulgore, faction="Horde" },
        [42866517] = { icon="hzeppelin", label=ZtoTB, note=Mulgore, faction="Alliance" },
        [45306178] = { icon="hzeppelin", label=ZtoBoreanTundra, note=WarsongHold, faction="Alliance" },
        [45306179] = { icon="zeppelin", label=ZtoBoreanTundra, note=WarsongHold, faction="Horde" },
        [52885242] = { icon="hzeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance" },
        [52885243] = { icon="zeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
        [50103773] = { icon="portal", multilabel={PtoTolBarad, PtoUldum, PtoDeepholm, PtoVashjir, PtoHyjal, PtoTwilightHighlands}, multinote={EasternKingdoms, Kalimdor, Maelstrom, EasternKingdoms, Kalimdor, EasternKingdoms}, requirements={multiquest={[2]=28112, [3]=27123, [4]=25924, [5]=25316, [6]=26798}, multilevel={85}}, faction="Horde" },
        },
    [86] = { -- Orgrimmar - The Cleft of Shadow
        [44716789] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" },
        },
    [1455] = { -- Ironforge
        [76985153] = { icon="tram", label=DrTtoSW, note=ElwynnForest },
        [27230704] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Alliance" }
        },
    [1445] = { -- Dustwallow Marsh
        [71805656] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [71805657] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" }
        },
    [1438] = { -- Teldrassil
        [54939404] = { icon="boat", label=BtoSW, note=ElwynnForest, faction="Alliance" },
        [54939405] = { icon="aboat", label=BtoSW, note=ElwynnForest, faction="Horde" },
        [52068947] = { icon="boat", label=BtoExodar, note=AzuremystIsle, faction="Alliance" },
        [52068948] = { icon="aboat", label=BtoExodar, note=AzuremystIsle, faction="Horde" },
        [29395588] = { icon="portal", multilabel={PtoBL, PtoExodar}, multinote={EasternKingdoms, AzuremystIsle}, faction="Alliance" }
        },
    -- [1439] = { -- Darkshore
    --     [33194006] = { icon="boat", label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
    --     [33194007] = { icon="aboat", label=BtoDarnassus, note=Teldrassil, faction="Horde" },
    --     [32404384] = { icon="boat", label=BtoSW, note=ElwynnForest, faction="Alliance" },
    --     [32404383] = { icon="aboat", label=BtoSW, note=ElwynnForest, faction="Horde" },
    --     [30724098] = { icon="boat", label=BtoExodar, note=AzuremystIsle, faction="Alliance" },
    --     [30724097] = { icon="aboat", label=BtoExodar, note=AzuremystIsle, faction="Horde" }
    --     },
    [1457] = { -- Darnassus
        [44117841] = { icon="portal", multilabel={PtoBL, PtoExodar}, multinote={EasternKingdoms, AzuremystIsle}, faction="Alliance" }
        },
    [1449] = { -- Un'Goro Crater
        [50520774] = { icon="portal", label=WtoSholazarBasin, note=Northrend, requirements={quest=12613} }
        },
    [1421] = { -- Silverpine Forest
        [47254337] = { icon="portal", label=PtoDalaCrater, note=HillsbradFoothills, faction="Horde", requirements={quest=27478} }
        },
    [1424] = { -- Hillsbrad Foothills
        [30293662] = { icon="portal", label=PtoSepulcher, note=SilverpineForest, faction="Horde", requirements={quest=27478} }
        },

-----------------------------------------------------------BCC-----------------------------------------------------------

    [1941] = { -- Eversong Forest
        [50993068] = { icon="portal", label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        [53203220] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde"}
        },
    [1954] = { -- Silvermoon
        [49391483] = { icon="portal", label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        [58372100] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde"}
        },
    [1458] = { -- Undercity
        [54851125] = { icon="portal", label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
        [85231702] = { icon="portal", label=PtoBL, note=EasternKingdoms, faction="Horde" }
        },
    [1943] = { -- Azuremyst Isle
        [20355419] = { icon="boat", label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
        [20355420] = { icon="aboat", label=BtoDarnassus, note=Teldrassil, faction="Horde" },
        [26344629] = { icon="portal", multilabel={PtoBL, PtoDarnassus}, multinote={EasternKingdoms, Teldrassil}, faction="Alliance" }
        },
    [1947] = { -- The Exodar
        [47886255] = { icon="portal", multilabel={PtoBL, PtoDarnassus}, multinote={EasternKingdoms, Teldrassil}, faction="Alliance" }
        },
    [1955] = { -- Shattrath
        [56814886] = { icon="portal", label=SPtoOG, note=Durotar, faction="Horde" },
        [57214825] = { icon="portal", label=SPtoSW, note=ElwynnForest, faction="Alliance" },
        [48584203] = { icon="portal", label=SPtoIoQD, note=EasternKingdoms },
        [74803160] = { icon="portal", label=ToCavernsofTime, note=Tanaris..")\n("..L["Speak with Zephyr"], requirements={reputation={989,7} } }
        },
    [1952] = { -- Terokkar Forest
        [30612399] = { icon="portal", multilabel={SPtoOG, SPtoIoQD}, multinote={Durotar, EasternKingdoms}, faction="Horde" },
        [30612398] = { icon="portal", multilabel={SPtoSW, SPtoIoQD}, multinote={ElwynnForest, EasternKingdoms}, faction="Alliance" },
        [35622076] = { icon="portal", label=ToCavernsofTime, note=Tanaris..")\n("..L["Speak with Zephyr"], requirements={reputation={989,7} } }
        },
    [1944] = { -- Hellfire Peninsula
        [88564769] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [88615281] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" }
        },
    [1945] = { -- Outlands
        [43326601] = { icon="portal", multilabel={SPtoOG, SPtoIoQD}, multinote={Durotar, EasternKingdoms}, faction="Horde" },
        [43326600] = { icon="portal", multilabel={SPtoSW, SPtoIoQD}, multinote={ElwynnForest, EasternKingdoms}, faction="Alliance" },
        [44876501] = { icon="portal", label=ToCavernsofTime, note=Tanaris..")\n("..L["Speak with Zephyr"], requirements={reputation={989,7} } },
        [68885138] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [68905289] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" }
        },
    [1951] = { -- Nagrand
        [88065172] = { icon="portal", multilabel={SPtoOG, SPtoIoQD}, multinote={Durotar, EasternKingdoms}, faction="Horde" },
        [88065173] = { icon="portal", multilabel={SPtoSW, SPtoIoQD}, multinote={ElwynnForest, EasternKingdoms}, faction="Alliance" },
        [92964857] = { icon="portal", label=ToCavernsofTime, note=Tanaris..")\n("..L["Speak with Zephyr"], requirements={reputation={989,7} } }
        },

---------------------------------------------------------WotLKC----------------------------------------------------------

    [125] = { -- Dalaran Northrend
        [40086282] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [55302542] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [25974412] = { icon="portal", label=PtotPurpleParlor },
        [25455155] = { icon="portal", label=DPtoCavernsOfTime, note=Tanaris }
        },
    [127] = { -- Crystalsong Forest
        [26194278] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [31223174] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [22123971] = { icon="portal", label=DPtoCavernsOfTime, note=Tanaris }
        },
    [113] = { -- Northrend
        [47874119] = { icon="portal", multilabel={PtoSW, DPtoCavernsOfTime}, multinote={ElwynnForest, Tanaris}, faction="Alliance" },
        [48664124] = { icon="portal", multilabel={PtoOG, DPtoCavernsOfTime}, multinote={Durotar, Tanaris}, faction="Horde" },
        [80768453] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [80768454] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [24607066] = { icon="aboat", label=BtoSW, note=ElwynnForest, faction="Horde" },
        [24607065] = { icon="boat", label=BtoSW, note=ElwynnForest, faction="Alliance" },
        [47106782] = { icon="boat", multilabel={BtoUnuPe, BtoKamagua}, multinote={BoreanTundra, HowlingFjord} },
        [30506590] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [66408188] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [17556488] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [17556489] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [84057266] = { icon="zeppelin", label=ZtoUC, note=Tirisfal, faction="Horde" },
        [84057267] = { icon="hzeppelin", label=ZtoUC, note=Tirisfal, faction="Alliance" },
        [24364962] = { icon="portal", label=WtoUngoroCrater, note=Kalimdor, requirements={quest=12613} }
        },
    [115] = { -- Dragonblight
        [47797887] = { icon="boat", label=BtoUnuPe, note=BoreanTundra },
        [49847853] = { icon="boat", label=BtoKamagua, note=HowlingFjord }
        },
    [114] = { -- Borean Tundra
        [79015410] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [59946946] = { icon="boat", label=BtoSW, note=ElwynnForest, faction="Alliance" },
        [59946947] = { icon="aboat", label=BtoSW, note=ElwynnForest, faction="Horde" },
        [41255344] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [41255345] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" }
        },
    [117] = { -- Howling Fjord
        [23295769] = { icon="boat", label=BtoMoaKiHarbor, note=Dragonblight },
        [61566268] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [61566269] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [77612813] = { icon="zeppelin", label=ZtoUC, note=Tirisfal, faction="Horde" },
        [77612814] = { icon="hzeppelin", label=ZtoUC, note=Tirisfal, faction="Alliance" }
        },
    [119] = { -- Sholazar Basin
        [40348312] = { icon="portal", label=WtoUngoroCrater, note=Kalimdor, requirements={quest=12613} }
        },

----------------------------------------------------------Cata-----------------------------------------------------------

    [198] = { -- Mount Hyjal
        [62612313] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63492444] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        },
    [207] = { -- Deepholm
        [48515381] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [50935310] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" },
        [49325034] = { icon="portal", label=PtoTherazanesThrone, note=Deepholm, requirements={quest=26709} },
        [57211352] = { icon="portal", label=PtoTempleofEarth, note=Deepholm, requirements={quest=26971} }
        },
    [948] = { -- Maelstrom
        [51182842] = { icon="portal", label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [51172840] = { icon="portal", label=PtoOG, note=Durotar, faction="Horde" }
        },
    [241] = { -- Twilight Highlands
        [79517782] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={quest=27537}, faction="Alliance" },
        [73625351] = { icon="portal", label=PtoOG, note=Durotar, requirements={quest=26798}, faction="Horde" }
        },
    [244] = { -- Tol Barad
        [47115193] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={level=30}, faction="Alliance" },
        [47115192] = { icon="portal", label=PtoOG, note=Durotar, requirements={level=30}, faction="Horde" }
        },
    [245] = { -- Tol Barad Peninsula
        [75255887] = { icon="portal", label=PtoSW, note=ElwynnForest, requirements={level=30}, faction="Alliance" },
        [56277966] = { icon="portal", label=PtoOG, note=Durotar, requirements={level=30}, faction="Horde" }
        }
}