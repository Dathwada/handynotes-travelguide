----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...
local L = private.locale

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

----------------------------------------------COVENANT----------------------------------------------

local Kyrian    = 1
local Venthyr   = 2
local Nightfae  = 3
local Necrolord = 4
local PH = L["PH"] -- PLACEHOLDER

--------------------------------------------SHADOWLANDS---------------------------------------------

local Shadowlands = L["Shadowlands"]
local PtoOribos = L["Portal to Oribos"]
local WstoOribos = L["Waystone to Oribos"]
local RingTransference= L["To Ring of Transference"]
local RingFates = L["To Ring of Fates"]
local IntoTheMaw = L["Into the Maw"]
local PtoThorghast = L["Portal to Thorghast"]

local Nurakkir = L["Nurakkir, House of Eyes"]
local Exoramas = L["Exoramas, House of Rituals"]
local Overlook = L["Overlook, Seat of the Primus"]
local Mainhall = L["Main Hall, Seat of the Primus"]
local Zerekriss = L["Zerekriss: Maldraxxus"]
local SeatofthePrimus = L["Seat of the Primus"]

local EternalGateway = L["Eternal Gateway"]
local AnimaGateway = L["Anima Gateway"]
local AGtoHerosrest = L["Anima Gateway to Hero's rest"]

local Random = L["RANDOM LOCATION"]
local Hibernalhollow = L["near Hibernal Hollow"]
local Dreamsangfenn = L["near Dreamsang Fenn"]
local Tirnavaal = L["near Tirna Vaal"]
local Tirnascithe = L["near Tirna Scithe"]
local Shimmerbough = L["Shimmerbough"]
local Darkreach = L["Darkreach"]
local Heartwoodgrove = L["Heartwood Grove"]

local Sanctuary = L["Sanctuary of the Mad"]
local EmberWard = L["Ember Ward"]
local Sinfall = L["Sinfall"]
local TheEternalTerrace = L["The Eternal Terrace"]
local PridefallHamlet = L["Pridefall Hamlet"]
local TheBanewood = L["The Banewood"]
local HallsofAtonement = L["Halls of Atonement"]
local DominanceKeep = L["Dominance Keep"]
local FeedersThicket = L["Feeders' Thicket"]

-------------------------------------------------BfA------------------------------------------------

local Zandalar = L["Zandalar"]
local Zuldazar = L["Zandalar, Zuldazar"]
local PtoZuldazar = L["Portal to Zuldazar"]
local BtoZuldazar = L["Boat to Zuldazar"]
local returntoZuldazar = L["Return to Zuldazar"]
local BtoVolDun = L["Boat to Vol'Dun"]
local BtoNazmir = L["Boat to Nazmir"]
local PtoNazjatar = L["Portal to Nazjatar"]
local StoMechagon = L["Submarine to Mechagon"]
local PtoSilithus = L["Portal to Silithus"]

local KulTiras = L["Kul Tiras"]
local TiragardeSound = L["Kul Tiras, Tiragarde Sound"]
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

local BrokenIsles = L["Broken Isles"]
local Stormheim = L["Broken Isles, Stormheim"]
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
local dalaran = L["Dalaran"]
local azsuna = L["Azsuna"]
local valsharah = L["Val'sharah"]
local suramar = L["Suramar"]
local highmountain = L["Highmountain"]
local stormheim = L["Stormheim"]
local brokenshore = L["Broken Shore"]

-------------------------------------------------WoD------------------------------------------------

local PtoStormshield = L["Portal to Stormshield"]
local PtoLionswatch = L["Portal to Lion's watch"]
local PtoWarspear = L["Portal to Warspear"]
local PtoVolmar = L["Portal to Vol'mar"]
local Ashran = L["Draenor, Ashran"]
local TanaanJungle = L["Draenor, Tanaan Jungle"]

-------------------------------------------------MoP------------------------------------------------

local Pandaria = L["Pandaria"]
local TownlongSteppes = L["Pandaria, Townlong Steppes"]
local PtoIofT = L["Portal to Isle of Thunder"]
local PtoSPG = L["Portal to Shado-Pan Garrison"]
local PtoJadeForest = L["Portal to Jade Forest"]
local PtoPeakofSerenity = L["Portal to Peak of Serenity"]
local KunLaiSummit = L["Pandaria, Kun-Lai Summit"]

-------------------------------------------------CATA-----------------------------------------------

local Maelstrom = L["Maelstrom"]
local Deepholm = L["Maelstrom, Deepholm"]
local PtoTolBarad = L["Portal to Tol Barad"]
local PtoUldum = L["Portal to Uldum"]
local PtoDeepholm = L["Portal to Deepholm"]
local PtoVashjir = L["Portal to Vashj'ir"]
local PtoHyjal = L["Portal to Hyjal"]
local PtoTwilightHighlands = L["Portal to Twilight Highlands"]
local PtoTempleofEarth = L["Portal to Temple of Earth"]
local PtoTherazanesThrone = L["Portal to Therazane's Throne"]

------------------------------------------------WotLK-----------------------------------------------

local CrystalsongForest = L["Northrend, Crystalsong Forest"]
local PtotPurpleParlor = L["Portal to the Purple Parlor"]
local BoreanTundra = L["Northrend, Borean Tundra"]
local ZtoBoreanTundra = L["Zeppelin to Borean Tundra"]
local BtoBoreanTundra = L["Boat to Borean Tundra"]
local WarsongHold = L["Northrend, Warsong Hold"]
local ValianceKeep = L["Northrend, Valiance Keep"]
local BtoUnuPe = L["Boat to Unu'Pe"]
local Dragonblight = L["Northrend, Dragonblight"]
local BtoMoaKiHarbor = L["Boat to Moa'Ki Harbor"]
local HowlingFjord = L["Northrend, Howling Fjord"]
local PtoHowlingFjord = L["Portal to Howling Fjord"]
local VengeanceLanding = L["Northrend, Vengeance Landing"]
local BtoHowlingFjord = L["Boat to Howling Fjord"]
local Valgarde = L["Northrend, Valgarde"]
local BtoKamagua = L["Boat to Kamagua"]

-------------------------------------------------BC-------------------------------------------------

local AzuremystIsle = L["Kalimdor, Azuremyst Isle"]
local PtoExodar = L["Portal to Exodar"]
local inExodar = L["in Exodar"]
local Outland = L["Outland"]
local PtoHellfirePeninsula = L["Portal to Hellfire Peninsula"]
local PtoIofQD = L["Portal to Isle of Quel'Danas"]
local PtoShattrath = L["Portal to Shattrath"]
local TerokkarForest = L["Outland, Terokkar Forest"]

-----------------------------------------------VANILLA----------------------------------------------

local Durotar = L["Kalimdor, Durotar"]
local PtoOG = L["Portal to Orgrimmar"]
local ZtoOG = L["Zeppelin to Orgrimmar"]
local Mulgore = L["Kalimdor, Mulgore"]
local PtoTB = L["Portal to Thunder Bluff"]
local ZtoTB = L["Zeppelin to Thunder Bluff"]
local Tirisfal = L["Eastern Kingdoms, Tirisfal Glades"]
local PtoUC = L["Portal to Undercity"]
local Orboftranslocation = L["Orb of translocation"]
local inUCMq = L["in Undercity Magic Quarter"]
local EversongWoods = L["Eastern Kingdoms, Eversong Woods"]
local PtoSM = L["Portal to Silvermoon"]
local NorthernBarrens = L["Kalimdor, Northern Barrens"]
local BtoRatchet = L["Boat to Ratchet"]
local ElwynnForest = L["Eastern Kingdoms, Elwynn Forest"]
local PtoSW = L["Portal to Stormwind"]
local BtoSW = L["Boat to Stormwind"]
local DrTtoSW = L["Deeprun Tram to Stormwind"]
local Teldrassil = L["Kalimdor, Teldrassil"]
local PtoDarnassus = L["Portal to Darnassus"]
local DunMorogh = L["Eastern Kingdoms, Dun Morogh"]
local PtoIF = L["Portal to Ironforge"]
local DrTtoIF = L["Deeprun Tram to Ironforge"]
local BtoMenethilHarbor = L["Boat to Menethil Harbor"]
local EasternKingdoms = L["Eastern Kingdoms"]
local Wetlands = L["Eastern Kingdoms, Wetlands"]
local ZtoStranglethornVale = L["Zeppelin to Stranglethorn Vale"]
local PtoStranglethornVale = L["Portal to Stranglethorn Vale"]
local StranglethornVale = L["Eastern Kingdoms, Stranglethorn Vale"]
local BtoBootyBay = L["Boat to Booty Bay"]
local GromgolBaseCamp = L["Eastern Kingdoms, Grom'gol Base Camp"]
local Kalimdor = L["Kalimdor"]
local DustwallowMarsh = L["Kalimdor, Dustwallow Marsh"]
local BtoTheramore = L["Boat to Theramore"]
local PtoCavernsofTime = L["Portal to Caverns of Time"]
local Tanaris = L["Kalimdor, Tanaris"]
local ArathiHighlands = L["Eastern Kingdoms, Arathi Highlands"]
local Darkshore = L["Kalimdor, Darkshore"]
local PtoDalaCrater = L["Portal to Dalaran Crater"]
local HillsbradFoothills = L["Eastern Kingdoms, Hillsbrad Foothills"]
local PtoSepulcher = L["Portal to the Sepulcher"]
local SilverpineForest = L["Eastern Kingdoms, Silverpine Forest"]

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

local DB = {}
private.DB = DB

DB.points = {
-- /dump C_Map.GetBestMapForUnit("player")
-- /dump WorldMapFrame:GetMapID()
-- /dump UnitClass("player")
--[[ structure:
    [UiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label         = ["string"],     -- label: text that'll be the label, optional
            labelspell    = [ID],           -- show the spell name as the label
            note          = ["string"],     -- additional notes for this node
            spell         = [ID],           -- show spell in the tooltip
            lvl           = [PLAYERlvl],    -- additional notes for required PLAYERLEVEL
            quest         = [ID],           -- additional notes for required QUEST
            timetravel    = [ID],           -- additional notes for required timetravel
            sanctumtalent = [ID],           -- additional notes for required sanctum upgrade
            faction       = ["FACTION"],    -- shows only for selected faction
            class         = [CLASS NAME],   -- shows only for selected class
            covenant      = [COVENAT NAME], -- shows only for selected covenant
            npc           = [id],           -- related npc id, used to display names in tooltip
            type          = ["string"],     -- the pre-define icon type which can be found in Constant.lua
        },
    },
--]]

------------------------------------------------------------------------------------------SHADOWLANDS------------------------------------------------------------------------------------------

    [1550] = { -- Shadowlands
        [45665085] = { portal=true, label=PtoOG, note=Durotar, faction="Horde", quest=60151 },
        [45665054] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance", quest=60151 },
        [20131380] = { portal=true, label=WstoOribos, lvl=60 }, --located by 23291066
        },
    [1670] = { -- Oribos - Ring of Fates
        [20835477] = { portal=true, label=PtoOG, note=Durotar, faction="Horde", quest=60151 },
        [20894567] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance", quest=60151 },
        [52095784] = { tpplatform=true, label=RingTransference },
        [52094278] = { tpplatform=true, label=RingTransference },
        },
    [1671] = { -- Oribos - Ring of Transference
        [49525107] = { portal=true, label=IntoTheMaw, lvl=60 },
        [49506073] = { tpplatform=true, label=RingFates },
        [49504243] = { tpplatform=true, label=RingFates },
        },
    [1536] = { -- Maldraxxus
        [50407397] = { necroportal=true, covenant=Necrolord, label=Mainhall, sanctumtalent=1050 },          -- Necrolord Reisenetzwerk Stufe 1
        [51631638] = { necroportal=true, covenant=Necrolord, label=SeatofthePrimus, sanctumtalent=1050 },   -- Necrolord Reisenetzwerk Stufe 1
        [28614470] = { necroportal=true, covenant=Necrolord, label=SeatofthePrimus, sanctumtalent=1051 },   -- Necrolord Reisenetzwerk Stufe 2
        [74473364] = { necroportal=true, covenant=Necrolord, label=SeatofthePrimus, sanctumtalent=1052 },   -- Necrolord Reisenetzwerk Stufe 3
        [51407067] = { necroportal=true, covenant=Necrolord, label=Nurakkir.."\n"..format(Overlook.."\n"..Zerekriss.."\n"..Exoramas), multisanctumtalent={1050, 1050, 1051, 1052} },
        },
    [1698] = { -- Seat of the Primus
        [61673783] = { necroportal=true, covenant=Necrolord, label=Nurakkir, sanctumtalent=1050 },  -- Necrolord Reisenetzwerk Stufe 1
        [58812304] = { necroportal=true, covenant=Necrolord, label=Overlook, sanctumtalent=1050 },  -- Necrolord Reisenetzwerk Stufe 1
        [62993430] = { necroportal=true, covenant=Necrolord, label=Zerekriss, sanctumtalent=1051 }, -- Necrolord Reisenetzwerk Stufe 2
        [61593043] = { necroportal=true, covenant=Necrolord, label=Exoramas, sanctumtalent=1052 },  -- Necrolord Reisenetzwerk Stufe 3
        [56373149] = { necroportal=true, covenant=Necrolord, label=PH, sanctumtalent=nil },         -- Necrolord Reisenetzwerk Stufe ?
        [56433702] = { necroportal=true, covenant=Necrolord, label=PH, sanctumtalent=nil },         -- Necrolord Reisenetzwerk Stufe ?
        },
    [1533] = { -- Bastion
        [55985276] = { herosrestgate=true, label=AGtoHerosrest }, --1 --Blizzard marked
        [46964891] = { herosrestgate=true, label=AGtoHerosrest }, --2 --Blizzard marked
        [52983802] = { herosrestgate=true, label=AGtoHerosrest }, --3 --Blizzard marked
        [65951932] = { platform=true, covenant=Kyrian, label=EternalGateway, sanctumtalent=1056 },  -- Kyrian Reisenetzwerk Stufe 1 npc=171036,
        [51754681] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1056 },    -- Kyrian Reisenetzwerk Stufe 1 npc=171037,
        [48337285] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1056 },    -- Kyrian Reisenetzwerk Stufe 1 npc=171091,
        [40715521] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1056 },    -- Kyrian Reisenetzwerk Stufe 1 npc=171097,
        [44163302] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1057 },    -- Kyrian Reisenetzwerk Stufe 2 npc=171101,
        [59427711] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1057 },    -- Kyrian Reisenetzwerk Stufe 2 npc=171102,
        [58373098] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1057 },    -- Kyrian Reisenetzwerk Stufe 2 npc=171103,
        [66594790] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1058 },    -- Kyrian Reisenetzwerk Stufe 3 npc=171104,
        [32322045] = { platform=true, covenant=Kyrian, label=AnimaGateway, sanctumtalent=1058 },    -- Kyrian Reisenetzwerk Stufe 3 npc=171105,
        },
    [1707] = { -- Elysisan Hold
        [48606168] = { platform=true, covenant=Kyrian, label=EternalGateway, sanctumtalent=1056 }, -- Kyrian Reisenetzwerk Stufe 1 npc=171036,
        },
    [1565] = { -- Ardenweald
        [46365116] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1053 }, -- Nightfae Reisenetzwerk Stufe 1
        [65736026] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1053 }, -- Nightfae Reisenetzwerk Stufe 1
        [29513463] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1053 }, -- Nightfae Reisenetzwerk Stufe 1
        [57504259] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1053 }, -- Nightfae Reisenetzwerk Stufe 1
        [44575584] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        [53287905] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        [26445125] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        [49392755] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        [20286695] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1055 }, -- Nightfae Reisenetzwerk Stufe 3
        [41116950] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1055 }, -- Nightfae Reisenetzwerk Stufe 3
        [54229363] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1055 }, -- Nightfae Reisenetzwerk Stufe 3
        [73712521] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1055 }, -- Nightfae Reisenetzwerk Stufe 3
        [50900745] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1055 }, -- Nightfae Reisenetzwerk Stufe 3
        },
    [1701] = { -- Hearth of the Forest - The Trunk
--        [55442673] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1053 }, -- Nightfae Reisenetzwerk Stufe 1
--        [54134136] = { mushroom=true, covenant=Nightfae, labelspell=335702 }, -- Nightfae
        },
    [1702] = { -- Hearth of the Forest - The Roots
        [55442673] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1053 }, -- Nightfae Reisenetzwerk Stufe 1
        [57516562] = { mushroom=true, covenant=Nightfae, labelspell=335702, quest=62624 },                     -- Nightfae The Queen's Conservatory
        },
    [1819] = { -- Ardenweald_Mushroom_A
        [58896232] = { mushroom=true, covenant=Nightfae, labelspell=325602, quest=57583, sanctumtalent=1053 },                      -- Nightfae Reisenetzwerk Stufe 1
        [41936098] = { mushroom=true, covenant=Nightfae, labelspell=325621, quest=57583, sanctumtalent=1053, note=Hibernalhollow }, -- Nightfae Reisenetzwerk Stufe 1
        [41273983] = { mushroom=true, covenant=Nightfae, labelspell=308436, quest=57583, sanctumtalent=1053, note=Dreamsangfenn },  -- Nightfae Reisenetzwerk Stufe 1
        [56383740] = { mushroom=true, covenant=Nightfae, labelspell=325614, quest=57583, sanctumtalent=1053, note=Tirnavaal },      -- Nightfae Reisenetzwerk Stufe 1
        [59965292] = { mushroom=true, covenant=Nightfae, labelspell=325657, quest=57583, sanctumtalent=1054, note=Random },         -- Nightfae Reisenetzwerk Stufe 2
        [51853564] = { mushroom=true, covenant=Nightfae, labelspell=325620, quest=57583, sanctumtalent=1054, note=Tirnascithe },    -- Nightfae Reisenetzwerk Stufe 2
        [38424806] = { mushroom=true, covenant=Nightfae, labelspell=325616, quest=57583, sanctumtalent=1054, note=Shimmerbough },   -- Nightfae Reisenetzwerk Stufe 2
        [52696820] = { mushroom=true, covenant=Nightfae, labelspell=325618, quest=57583, sanctumtalent=1054 },                      -- Nightfae Reisenetzwerk Stufe 2
        [58894369] = { mushroom=true, covenant=Nightfae, labelspell=325619, quest=57583, sanctumtalent=1055 },                      -- Nightfae Reisenetzwerk Stufe 3
        [46703589] = { mushroom=true, covenant=Nightfae, labelspell=325617, quest=57583, sanctumtalent=1055, note=Darkreach },      -- Nightfae Reisenetzwerk Stufe 3
        [38875544] = { mushroom=true, covenant=Nightfae, labelspell=325627, quest=57583, sanctumtalent=1055, note=Random },         -- Nightfae Reisenetzwerk Stufe 3
        [45756677] = { mushroom=true, covenant=Nightfae, labelspell=325607, quest=57583, sanctumtalent=1055, note=Heartwoodgrove }, -- Nightfae Reisenetzwerk Stufe 3
        },
    [1825] = { -- Ardenweald_Mushroom_B
        [50437614] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        },
    [1826] = { -- Ardenweald_Mushroom_C
        [50187317] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        },
    [1827] = { -- Ardenweald_Mushroom_C
        [48247310] = { mushroom=true, covenant=Nightfae, labelspell=308437, quest=57583, sanctumtalent=1054 }, -- Nightfae Reisenetzwerk Stufe 2
        },
    [1525] = { -- Revendreth
        [24855026] = { mirror=true, label=Sanctuary, covenant=Venthyr, quest=57536, sanctumtalent=1047 }, -- Venthyr Reisenetzwerk Stufe 1 spell=329427
        [31964670] = { mirror=true, label=EmberWard, covenant=Venthyr, quest=57536, sanctumtalent=1047 }, -- Venthyr Reisenetzwerk Stufe 1 spell=329427
        [70757546] = { mirror=true, label=Sinfall, covenant=Venthyr, quest=60060, sanctumtalent=1047 },   -- Venthyr Reisenetzwerk Stufe 1
        [56743250] = { mirror=true, label=Sinfall, covenant=Venthyr, quest=60147, sanctumtalent=1047 },   -- Venthyr Reisenetzwerk Stufe 1
        [73624393] = { mirror=true, label=Sinfall, covenant=Venthyr, quest=60159, sanctumtalent=1048 },   -- Venthyr Reisenetzwerk Stufe 2
        [43485709] = { mirror=true, label=Sinfall, covenant=Venthyr, quest=60160, sanctumtalent=1048 },   -- Venthyr Reisenetzwerk Stufe 2
        [25472685] = { mirror=true, label=Sinfall, covenant=Venthyr, quest=60164, sanctumtalent=1049 },   -- Venthyr Reisenetzwerk Stufe 3
        [58246275] = { mirror=true, label=Sinfall, covenant=Venthyr, quest=60165, sanctumtalent=1049 },   -- Venthyr Reisenetzwerk Stufe 3
        },
    [1699] = { -- Sinfall Reaches
        [46054944] = { mirror=true, label=TheEternalTerrace, covenant=Venthyr, quest=60147, sanctumtalent=1047 }, -- Venthyr Reisenetzwerk Stufe 1
        [42073630] = { mirror=true, label=PridefallHamlet, covenant=Venthyr, quest=60060, sanctumtalent=1047 },   -- Venthyr Reisenetzwerk Stufe 1
        },
    [1700] = { -- Sinfall Depths
        [63625343] = { mirror=true, label=HallsofAtonement, covenant=Venthyr, quest=60159, sanctumtalent=1048 }, -- Venthyr Reisenetzwerk Stufe 2      
        [58383662] = { mirror=true, label=TheBanewood, covenant=Venthyr, quest=60160, sanctumtalent=1048 },      -- Venthyr Reisenetzwerk Stufe 2
        [80984895] = { mirror=true, label=DominanceKeep, covenant=Venthyr, quest=60164, sanctumtalent=1049 },    -- Venthyr Reisenetzwerk Stufe 3
        [71841967] = { mirror=true, label=FeedersThicket, covenant=Venthyr, quest=60165, sanctumtalent=1049 },   -- Venthyr Reisenetzwerk Stufe 3
        },
    [1543] = { -- The Maw
        [42374215] = { portal=true, label=WstoOribos, lvl=60 },
        [48183943] = { portal=true, label=PtoThorghast, lvl=60 },
        },

----------------------------------------------------------------------------------------------BfA----------------------------------------------------------------------------------------------

    [875] = { -- Zandalar
        [58206200] = { portal=true, label1=PtoSM.." ("..EversongWoods..")\n"..format(PtoOG.." ("..Durotar..")\n"..PtoTB.." ("..Mulgore..")\n"..PtoSilithus.." ("..Kalimdor..")\n"..PtoNazjatar..""),
                                    label2=PtoSM.."\n"..format(PtoOG.."\n"..PtoTB.."\n"..PtoSilithus.."\n"..PtoNazjatar..""), faction="Horde" },
        [56307065] = { boat=true, label=StoMechagon, note=KulTiras, quest=55651, faction="Horde" },
        [33201921] = { boat=true, label=returntoBoralus, note=TiragardeSound, quest=51229, faction="Alliance" }, -- Vol'Dun Barnard "The Smasher" Baysworth
        [62492642] = { boat=true, label=returntoBoralus, note=TiragardeSound, quest=51088, faction="Alliance" }, -- Nazmir Desha Stormwallow
        [47137856] = { boat=true, label=returntoBoralus, note=TiragardeSound, quest=51359, faction="Alliance" }, -- Zuldazar Daria Smithson
        [58287605] = { boat=true, label1=BtoDrustvar.." ("..KulTiras..")\n"..format(BtoStormsongValley.." ("..KulTiras..")\n"..BtoTiragardeSound.." ("..KulTiras..")"),
                                  label2=BtoDrustvar.."\n"..format(BtoStormsongValley.."\n"..BtoTiragardeSound..""),faction="Horde" },
        [58367208] = { mixedportal=true, label1=PtoArathiHighlands.." ("..EasternKingdoms..")\n"..format(PtoDarkshore.." ("..Kalimdor..")"),
                                         label2=PtoArathiHighlands.."\n"..format(PtoDarkshore..""), lvl=50, faction="Horde", warfront="both" },
        },
    [862] = { -- Zuldazar
        [58304450] = { portal=true, label1=PtoSM.." ("..EversongWoods..")\n"..format(PtoOG.." ("..Durotar..")\n"..PtoTB.." ("..Mulgore..")\n"..PtoSilithus.." ("..Kalimdor..")\n"..PtoNazjatar..""),
                                    label2=PtoSM.."\n"..format(PtoOG.."\n"..PtoTB.."\n"..PtoSilithus.."\n"..PtoNazjatar..""), faction="Horde" },
        [55255824] = { boat=true, label=StoMechagon, note=KulTiras, quest=55651, faction="Horde" },
        [58466293] = { boat=true, label1=BtoDrustvar.." ("..KulTiras..")\n"..format(BtoStormsongValley.." ("..KulTiras..")\n"..BtoTiragardeSound.." ("..KulTiras..")"), 
                                  label2=BtoDrustvar.."\n"..format(BtoStormsongValley.."\n"..BtoTiragardeSound..""), faction="Horde" },
        [58596055] = { mixedportal=true, label1=PtoArathiHighlands.." ("..EasternKingdoms..")\n"..format(PtoDarkshore.." ("..Kalimdor..")"),
                                         label2=PtoArathiHighlands.."\n"..format(PtoDarkshore..""), lvl=50, faction="Horde", warfront="both" },
        },                               -- quest=51340, Drustvar   quest=51532, Stormsong valley   quest=51421, tiragard sound
    [1165] = { -- Dazar'alor
        [51004600] = { portal=true, label1=PtoSM.." ("..EversongWoods..")\n"..format(PtoOG.." ("..Durotar..")\n"..PtoTB.." ("..Mulgore..")\n"..PtoSilithus.." ("..Kalimdor..")\n"..PtoNazjatar..""),
                                    label2=PtoSM.."\n"..format(PtoOG.."\n"..PtoTB.."\n"..PtoSilithus.."\n"..PtoNazjatar..""), faction="Horde" },
        [41808760] = { boat=true, label=StoMechagon, note=KulTiras, quest=55651, faction="Horde" },
        [51859453] = { mixedportal=true, label1=PtoArathiHighlands.." ("..EasternKingdoms..")\n"..format(PtoDarkshore.." ("..Kalimdor..")"),
                                         label2=PtoArathiHighlands.."\n"..format(PtoDarkshore..""), lvl=50, faction="Horde", warfront="both" },
        },
    [1163] = { -- Dazar'alor - The Great Seal
        [73706210] = { portal=true, label=PtoSM, note=EversongWoods, faction="Horde" },
        [73706980] = { portal=true, label=PtoOG, note=Durotar, quest=46931, faction="Horde" },
        [73707730] = { portal=true, label=PtoTB, note=Mulgore, faction="Horde" },
        [73708530] = { portal=true, label=PtoSilithus, note=Kalimdor, lvl=50, quest=46931, faction="Horde" },
        [63008530] = { portal=true, label=PtoNazjatar, quest=55053, faction="Horde" },
        },
    [1355] = { -- Nazjatar
        [47286278] = { portal=true, label=PtoZuldazar, note=Zandalar, quest=55053, faction="Horde" },
        [40005260] = { portal=true, label=PtoBoralus, note=KulTiras, quest=54972, faction="Alliance" },
        },
    [876] = { -- Kul Tiras
        [61404950] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoIF.." ("..DunMorogh..")\n"..PtoExodar.." ("..AzuremystIsle..")\n"..PtoSilithus.." ("..Kalimdor..")\n"..PtoNazjatar..""),
                                    label2=PtoSW.."\n"..format(PtoIF.."\n"..PtoExodar.."\n"..PtoSilithus.."\n"..PtoNazjatar..""), faction="Alliance" },
        [69046516] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=51438, faction="Horde" }, -- Tiragarde Sound speak: Erul Dawnbrook
        [25936716] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=51340, faction="Horde" }, -- Drustvar
        [54371416] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=51696, faction="Horde" }, -- Stormsong Valley 51902450 boat Grok Seahandler
        [54141818] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=51696, faction="Horde" }, -- Stormsong Valley 51403370 Flightmaster Muka Stormbreaker
        [20332457] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=55651, faction="Horde" }, -- Mechagon 
--noboat        [20742783] = { boat=true, label=returntoBoralus, note=TiragardeSound, quest=54992, faction="Alliance" }, --Mechagon --quest=54992,
        [62095274] = { boat=true, label1=BtoVolDun.." ("..Zandalar..")\n"..format(BtoNazmir.." ("..Zandalar..")\n"..BtoZuldazar.." ("..Zandalar..")"),
                                  label2=BtoVolDun.."\n"..format(BtoNazmir.."\n"..BtoZuldazar..""), faction="Alliance" },
        [60855074] = { mixedportal=true, label1=PtoArathiHighlands.." ("..EasternKingdoms..")\n"..format(PtoDarkshore.." ("..Kalimdor..")"),
                                         label2=PtoArathiHighlands.."\n"..format(PtoDarkshore..""), lvl=50, faction="Alliance", warfront="both" },
        },      -- Voldun 51283, nazmir 51088, zuldazar 51308
    [895] = { -- Tiragarde Sound
        [74302350] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoIF.." ("..DunMorogh..")\n"..PtoExodar.." ("..AzuremystIsle..")\n"..PtoSilithus.." ("..Kalimdor..")\n"..PtoNazjatar..""),
                                    label2=PtoSW.."\n"..format(PtoIF.."\n"..PtoExodar.."\n"..PtoSilithus.."\n"..PtoNazjatar..""), faction="Alliance" },
        [73692628] = { boat=true, label1=BtoVolDun.." ("..Zandalar..")\n"..format(BtoNazmir.." ("..Zandalar..")\n"..BtoZuldazar.." ("..Zandalar..")"),
                                  label2=BtoVolDun.."\n"..format(BtoNazmir.."\n"..BtoZuldazar..""), faction="Alliance" },
        [73362568] = { mixedportal=true, label1=PtoArathiHighlands.." ("..EasternKingdoms..")\n"..format(PtoDarkshore.." ("..Kalimdor..")"),
                                         label2=PtoArathiHighlands.."\n"..format(PtoDarkshore..""), lvl=50, faction="Alliance", warfront="both" },

        },
    [942] = { -- Stormsong Valley
        [51902450] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=51696, faction="Horde" }, --Stormsong valley 51902450 boat Grok Seahandler
        [51403370] = { boat=true, label=returntoZuldazar, note=Zandalar, quest=51696, faction="Horde" }, --Stormsong Valley 51403370 Flightmaster Muka Stormbreaker
        },
    [1161] = { -- Boralus
        [70401600] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoIF.." ("..DunMorogh..")\n"..PtoExodar.." ("..AzuremystIsle..")\n"..PtoSilithus.." ("..Kalimdor..")\n"..PtoNazjatar..""),
                                    label2=PtoSW.."\n"..format(PtoIF.."\n"..PtoExodar.."\n"..PtoSilithus.."\n"..PtoNazjatar..""),faction="Alliance" },
        [67952669] = { boat=true, label1=BtoVolDun.." ("..Zandalar..")\n"..format(BtoNazmir.." ("..Zandalar..")\n"..BtoZuldazar.." ("..Zandalar..")"),
                                  label2=BtoVolDun.."\n"..format(BtoNazmir.."\n"..BtoZuldazar..""), faction="Alliance" },
        [66352486] = { mixedportal=true, label1=PtoArathiHighlands.." ("..EasternKingdoms..")\n"..format(PtoDarkshore.." ("..Kalimdor..")"),
                                         label2=PtoArathiHighlands.."\n"..format(PtoDarkshore..""), lvl=50, faction="Alliance", warfront="both" }, --quest=53194,
        },

--------------------------------------------------------------------------------------------LEGION---------------------------------------------------------------------------------------------

    [619] = { -- Broken Isles
        [30712543] = { orderhall=true, label1=PtoDala.." ("..BrokenIsles..")\n"..format(PtoEmeraldDreamway),
                                       label2=PtoDala.."\n"..format(PtoEmeraldDreamway), class="DRUID" },
        [63326940] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="DEATHKNIGHT" },
        [45406523] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [46086351] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [33675793] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [33675788] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [52082914] = { portal=true, label=PtoDala, note=BrokenIsles },
        [65492873] = { portal=true, label=PtoHelheim, note=Stormheim },
        [41702157] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="HUNTER" }, -- quest=40953, ????
        [52597039] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Broken Shore
        [61353269] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Stormheim
        [34544019] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Val'sharah
        [46022488] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Highmountain
        [33995326] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Azsuna
        [43944460] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" }, -- Suramar
        },
    [627] = { -- Dalaran Broken Isles
        [39506320] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [55302400] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [72854121] = { flightmaster=true, label=GEtoTrueshotLodge, note=Durotar, class="HUNTER" }, --quest=40953, ????
        },
    [630] = { -- Azsuna
        [46664141] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [46644121] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
--coord [46664141] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [82135737] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [47582809] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [634] = { -- Stormheim
        [30084070] = { portal=true, label=PtoDala, note=BrokenIsles },
        [73633938] = { portal=true, label=PtoHelheim, note=Stormheim },
        [60175223] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [649] = { -- Stormheim - Helheim
        [66584793] = { portal=true, label=PtoStormheim, note=Stormheim },
        },
    [650] = { -- Highmountain
        [34585114] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="HUNTER" }, --quest=40953, ????
        [46115996] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [750] = { -- Highmountain - Thunder Totem
        [39834206] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [641] = { -- Val'sharah
        [41742385] = { orderhall=true, label1=PtoDala.." ("..BrokenIsles..")\n"..format(PtoEmeraldDreamway),
                                       label2=PtoDala.."\n"..format(PtoEmeraldDreamway), class="DRUID" },
        [54707490] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [680] = { -- Suramar
        [33094822] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [646] = { -- Broken Shore
        [44816132] = { worderhall=true, label=JtoSkyhold, note=BrokenIsles, class="WARRIOR" },
        },
    [830] = { -- Krokuun
        [62008694] = { portal=true, label=PtoDala, note=BrokenIsles },
        },
    [832] = { -- Krokuun Vindikaar
        [43272508] = { portal=true, label=PtoDala, note=BrokenIsles },
        },
    [882] = { -- Mac'Aree
        [51668722] = { portal=true, label=PtoDala, note=BrokenIsles },
        },
    [884] = { -- Mac'Aree Vindikaar
        [49332529] = { portal=true, label=PtoDala, note=BrokenIsles },
        },
    [885] = { -- Antorische Ödnis
        [75893732] = { portal=true, label=PtoDala, note=BrokenIsles },
        },
    [887] = { -- Antorische Ödnis Vindikaar
        [33785600] = { portal=true, label=PtoDala, note=BrokenIsles },
        },

-------------------------------------------------------------------------------------------ORDERHALL-------------------------------------------------------------------------------------------

    [747] = { -- The Dreamgrove *DRUID*
        [56604310] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="DRUID" },
        [55502200] = { orderhall=true, label=PtoEmeraldDreamway, class="DRUID" },
        },
    [648] = { -- Acherus: The Ebon Hold - Hall of Command *DEATHKNIGHT*
        [24703370] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="DEATHKNIGHT" },
        },
    [720] = { -- Mardum, the Shattered Abyss - Upper Command Center *DEMONHUNTER*
        [59269182] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="DEMONHUNTER" }, --quest=42872, access to orderhall
        [58361658] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="DEMONHUNTER" },
        },
    [734] = { -- Hall of the Guardian *MAGE*
        [57299056] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="MAGE" },
        [66784670] = { orderhall=true, spell=223413, label=PtoValsharah, note=BrokenIsles, class="MAGE" },
        [67214172] = { orderhall=true, spell=223413, label=PtoStormheim, note=BrokenIsles, class="MAGE" },
        [60235191] = { orderhall=true, spell=223413, label=PtoSuramar, note=BrokenIsles, class="MAGE" },
        [54684456] = { orderhall=true, spell=223413, label=PtoHighmountain, note=BrokenIsles, class="MAGE" },
        [54993963] = { orderhall=true, spell=223413, label=PtoAzsuna, note=BrokenIsles, class="MAGE" },
        },
    [726] = { -- The Maelstrom *SHAMAN*
        [29835200] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="SHAMAN" },
        },
    [24] = { -- Light's Hope Chapel *PALADIN*
        [37646407] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="PALADIN" },
--      in Eastern Plaguelands and Eastern Kingdoms another portal POI
        },
    [717] = { -- Dreadscar Rift *WARLOCK*
        [74333750] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="WARLOCK" },
        },
    [702] = { -- Netherlight Temple *PRIEST*
        [49798075] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="PRIEST" },
        },
    [695] = { -- Skyhold *WARRIOR*
--      [58322500] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="WARRIOR" },
        [58322500] = { worderhall=true, label=dalaran.."\n"..format(stormheim.."\n"..azsuna.."\n"..valsharah.."\n"..highmountain.."\n"..suramar.."\n"..brokenshore..""), note=BrokenIsles, class="WARRIOR" },
        },
    [709] = { -- The Wandering Isle *MONK*
        [52405714] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="MONK" },
        [50055441] = { orderhall=true, label=PtoPeakofSerenity, note=KunLaiSummit, class="MONK" },
        },
    [739] = { -- Trueshotlodge *HUNTER*
        [48634352] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="HUNTER" }, --quest=40953, access to orderhall ???
        },
        
----------------------------------------------------------------------------------------------WoD----------------------------------------------------------------------------------------------

    [572] = { -- Draenor
        [73004300] = { portal=true, label1=PtoOG.." ("..Durotar..")\n"..format(PtoVolmar.." ("..TanaanJungle..")"),
                                    label2=PtoOG.."\n"..format(PtoVolmar..""), faction="Horde"},
        [73014305] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoLionswatch.." ("..TanaanJungle..")"),
                                    label2=PtoSW.."\n"..format(PtoLionswatch..""), faction="Alliance"},
        [34683698] = { portal=true, label=PtoWarspear, note=Ashran, quest=36614, faction="Horde"},
        [53556087] = { portal=true, label=PtoStormshield, note=Ashran, quest=36615, faction="Alliance"},
        [60424563] = { portal=true, label=PtoWarspear, note=Ashran, quest=37935, faction="Horde"},
        [59594867] = { portal=true, label=PtoStormshield, note=Ashran, quest=38445, faction="Alliance"},
        },
    [588] = { -- Ashran
        [44001300] = { portal=true, label1=PtoOG.." ("..Durotar..")\n"..format(PtoVolmar.." ("..TanaanJungle..")"),
                                    label2=PtoOG.."\n"..format(PtoVolmar..""), faction="Horde"},
        [40009000] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoLionswatch.." ("..TanaanJungle..")"),
                                    label2=PtoSW.."\n"..format(PtoLionswatch..""), faction="Alliance"},
        },
    [590] = { -- Frostwall (Garrison)
        [75104890] = { portal=true, label=PtoWarspear, note=Ashran, quest=36614, faction="Horde"},
        },
    [525] = { -- Frostfire Ridge
        [51496593] = { portal=true, label=PtoWarspear, note=Ashran, quest=36614, faction="Horde"},
        },
    [582] = { -- Lunarfall (Garrison)
        [70102750] = { portal=true, label=PtoStormshield, note=Ashran, quest=36615, faction="Alliance"},
        },
    [539] = { -- Shadowmoon Valley
        [32871553] = { portal=true, label=PtoStormshield, note=Ashran, quest=36615, faction="Alliance"},
        },
    [534] = { -- Tanaan Jungle
        [61004734] = { portal=true, label=PtoWarspear, note=Ashran, quest=37935, faction="Horde"},
        [57446050] = { portal=true, label=PtoStormshield, note=Ashran, quest=38445, faction="Alliance"},
        },
    [624] = { -- Warspear (Ashran)
        [60705160] = { portal=true, label=PtoOG, note=Durotar, faction="Horde"},
        [53104390] = { portal=true, label=PtoVolmar, note=TanaanJungle, quest=37935, faction="Horde"},
        },
    [622] = { -- Stormshield (Ashran)
        [60903800] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance"},
        [36314116] = { portal=true, label=PtoLionswatch, note=TanaanJungle, quest=38445, faction="Alliance"},
        },

----------------------------------------------------------------------------------------------MoP----------------------------------------------------------------------------------------------

    [424] = { -- Pandaria
        [29534767] = { portal=true, label=PtoIofT, note=Pandaria, quest=32680, faction="Horde" },
        [29144595] = { portal=true, label=PtoIofT, note=Pandaria, quest=32681, faction="Alliance" },
        [19100943] = { portal=true, label=PtoSPG, note=TownlongSteppes, quest=32212, faction="Horde" },
        [24331611] = { portal=true, label=PtoSPG, note=TownlongSteppes, quest=32644, faction="Alliance" },
        [55215658] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [67816760] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [59883557] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [50784779] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [44792782] = { orderhall=true, label=PtoOG, note=Durotar, class="MONK", faction="Horde" },
        [44972774] = { orderhall=true, label=PtoSW, note=ElwynnForest, class="MONK", faction="Alliance" },
        },
    [390] = { -- Vale of Eternal Blossoms
        [90876620] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63461261] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [1530] = { -- Vale of Eternal Blossoms BFA Vision of N'Zoth
        [91606427] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63720988] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [392] = { -- Shrine of Two Moons - The Imperial Mercantile
        [73304270] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [394] = { -- Shrine of Seven Stars - The Imperial Exchange
        [71703570] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [388] = { -- Townlong Steppes
        [49746867] = { portal=true, label=PtoIofT, note=Pandaria, quest=32681, faction="Alliance" },
        [50607340] = { portal=true, label=PtoIofT, note=Pandaria, quest=32680, faction="Horde" },
        },
    [379] = { -- Kun-Lai Summit
        [48534357] = { orderhall=true, label=PtoOG, note=Durotar, class="MONK", faction="Horde" },
        [48964336] = { orderhall=true, label=PtoSW, note=ElwynnForest, class="MONK", faction="Alliance" },
        },
--[[    [371] = { -- The Jade Forest
        [28501401] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
]]--
    [504] = { -- Isle of Thunder
        [64707348] = { portal=true, label=PtoSPG, note=TownlongSteppes, quest=32644, faction="Alliance" },
        [33213269] = { portal=true, label=PtoSPG, note=TownlongSteppes, quest=32212, faction="Horde" },
        },

---------------------------------------------------------------------------------------------CATA----------------------------------------------------------------------------------------------

    [198] = { -- Mount Hyjal
        [62602310] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [63492444] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [207] = { -- Deepholm
        [48515381] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [50935310] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [49325034] = { portal=true, label=PtoTherazanesThrone, note=Deepholm, quest=26709 },
        [57211352] = { portal=true, label=PtoTempleofEarth, note=Deepholm, quest=26971 },
        },
    [948] = { -- Maelstrom
        [51182842] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [51172840] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [241] = { -- Twilight Highlands
        [79517782] = { portal=true, label=PtoSW, note=ElwynnForest, quest=27537, faction="Alliance" },
        [73625351] = { portal=true, label=PtoOG, note=Durotar, quest=26798, faction="Horde" },
        },
    [244] = { -- Tol Barad
        [47115193] = { portal=true, label=PtoSW, note=ElwynnForest, lvl=30, faction="Alliance" },
        [47115192] = { portal=true, label=PtoOG, note=Durotar, lvl=30, faction="Horde" },
        },
    [245] = { -- Tol Barad Peninsula
        [75255887] = { portal=true, label=PtoSW, note=ElwynnForest, lvl=30, faction="Alliance" },
        [56277966] = { portal=true, label=PtoOG, note=Durotar, lvl=30, faction="Horde" },
        },
        
---------------------------------------------------------------------------------------------WotLK---------------------------------------------------------------------------------------------

    [125] = { -- Dalaran Northrend
        [40086282] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [55302542] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [25634785] = { portal=true, label=PtotPurpleParlor },
        },
    [127] = { -- Crystalsong Forest
        [26194278] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [31223174] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [113] = { -- Northrend
        [47874119] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [48664124] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [78858355] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [78858356] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [24607066] = { aboat=true, label=BtoSW, note=ElwynnForest, faction="Horde" },
        [24607065] = { boat=true, label=BtoSW, note=ElwynnForest, faction="Alliance" },
        [47106782] = { boat=true, label1= BtoUnuPe.." ("..BoreanTundra..")\n"..format(BtoKamagua.." ("..HowlingFjord..")"),
                                  label2= BtoUnuPe.."\n"..format(BtoKamagua..""), },
        [30506590] = { boat=true, label=BtoMoaKiHarbor, note=Dragonblight },
        [66408188] = { boat=true, label=BtoMoaKiHarbor, note=Dragonblight },
        [17556488] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
        [17556489] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        [84057266] = { portal=true, label=PtoUC, note=Tirisfal, faction="Horde" },
        },
    [115] = { -- Dragonblight
        [47797887] = { boat=true, label=BtoUnuPe, note=BoreanTundra },
        [49847853] = { boat=true, label=BtoKamagua, note=HowlingFjord },
        },
    [114] = { -- Borean Tundra
        [79015410] = { boat=true, label=BtoMoaKiHarbor, note=Dragonblight },
        [59946947] = { aboat=true, label=BtoSW, note=ElwynnForest, faction="Horde" },
        [41255344] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
        [41255345] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [117] = { -- Howling Fjord
        [23295769] = { boat=true, label=BtoMoaKiHarbor, note=Dragonblight },
        [61506270] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [77612813] = { portal=true, label=PtoUC, note=Tirisfal, faction="Horde" },
        },

----------------------------------------------------------------------------------------------BC-----------------------------------------------------------------------------------------------

    [100] = { -- Hellfire Peninsula
        [89225101] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [89234946] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [111] = { -- Shattrath City
        [57224827] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [48594200] = { portal=true, label=PtoIofQD, note=EasternKingdoms, },
        [56834888] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [101] = { -- Outland
        [43886598] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoIofQD.." ("..EasternKingdoms..")"),
                                    label2=PtoSW.."\n"..format(PtoIofQD..""), faction="Alliance" },
        [43886599] = { portal=true, label1=PtoOG.." ("..Durotar..")\n"..format(PtoIofQD.." ("..EasternKingdoms..")"),
                                    label2=PtoOG.."\n"..format(PtoIofQD..""), faction="Horde" },
        [69075236] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [69075190] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        },
    [108] = { -- Terokkar Forest
        [30252350] = { portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoIofQD.." ("..EasternKingdoms..")"),
                                    label2=PtoSW.."\n"..format(PtoIofQD..""), faction="Alliance" },
        [30252350] = { portal=true, label1=PtoOG.." ("..Durotar..")\n"..format(PtoIofQD.." ("..EasternKingdoms..")"),
                                    label2=PtoOG.."\n"..format(PtoIofQD..""), faction="Horde" },
        },
    [103] = { -- Exodar
        [48306290] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [97] = { -- Azuremyst Isle
        [20335407] = { spell=290245, timetravel=54411, portal=true, label=PtoDarnassus, note=Teldrassil },
        [26364616] = { portal=true, label=PtoSW, note=ElwynnForest..")\n("..inExodar.."", faction="Alliance" },
        },
    [110] = { -- Silvermoon City
        [49401510] = { portal=true, label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        [58501890] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" }, 
        },
    [94] = { -- Eversong Woods
        [52803270] = { portal=true, label1=PtoUC.." ("..Tirisfal..")\n"..format(PtoOG.." ("..Durotar..")"),
                                    label2=PtoUC.."\n"..format(PtoOG..""), faction="Horde" },
        },

--------------------------------------------------------------------------------------------Vanilla--------------------------------------------------------------------------------------------

    [12] = { -- Kalimdor
        [59236650] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [59246651] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [56835629] = { boat=true, label=BtoBootyBay, note=StranglethornVale },
        [43561640] = { spell=290245, timetravel=54411, portal=true, label1=PtoSW.." ("..ElwynnForest..")\n"..format(PtoExodar.." ("..AzuremystIsle..")"),
                                                                    label2=PtoSW.."\n"..format(PtoExodar..""),faction="Alliance" },
        [39401090] = { spell=290245, timetravel=54411, portal=true, label1=PtoExodar.." ("..AzuremystIsle..")\n"..format(PtoHellfirePeninsula.." ("..Outland..")"),
                                                                    label2=PtoExodar.."\n"..format(PtoHellfirePeninsula..""), faction="Alliance" },
        [43211616] = { spell=290245, timetravel=54411, portal=true, label=PtoExodar, note=Teldrassil, faction="Horde" },
        [29922620] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [59468340] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [59448340] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [56122758] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [56222774] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [29332713] = { spell=290245, timetravel=54411, portal=true, label=PtoDarnassus, note=Teldrassil },
        [45405420] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
        [45405421] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        [58154245] = { zeppelin=true, label1=ZtoTB.." ("..Mulgore..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")\n"..ZtoBoreanTundra.." ("..WarsongHold..")"),
                                      label2=ZtoTB.."\n"..format(ZtoStranglethornVale.."\n"..ZtoBoreanTundra..""), faction="Horde" },
        [58154246] = { hzeppelin=true, label1=ZtoTB.." ("..Mulgore..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")\n"..ZtoBoreanTundra.." ("..WarsongHold..")"),
                                       label2=ZtoTB.."\n"..format(ZtoStranglethornVale.."\n"..ZtoBoreanTundra..""),faction="Alliance" },
        [42857909] = { spell=255152, timetravel=50659, ttturn=true, portal=true, label=PtoZuldazar, note=Zandalar, lvl=50, quest=46931, faction="Horde" },
        [42847905] = { spell=255152, timetravel=50659, ttturn=true, portal=true, label=PtoBoralus, note=TiragardeSound, lvl=50, faction="Alliance" },
        [59414237] = { portal=true, label1=PtoTolBarad.." ("..EasternKingdoms..")\n"..format(PtoUldum.." ("..Kalimdor..")\n"..PtoDeepholm.." ("..Maelstrom..")\n"..PtoVashjir.." ("..EasternKingdoms..")\n"..PtoHyjal.." ("..Kalimdor..")\n"..PtoTwilightHighlands.." ("..EasternKingdoms..")\n"..PtoUC.." ("..Tirisfal..")\n"..PtoDala.." ("..CrystalsongForest..")\n"..PtoJadeForest.." ("..Pandaria..")\n"..PtoZuldazar.." ("..Zandalar..")\n"..PtoAzsuna.." ("..BrokenIsles..")\n"..PtoWarspear.." ("..Ashran..")\n"..PtoShattrath.." ("..TerokkarForest..")\n"..PtoCavernsofTime.." ("..Tanaris..")\n"..PtoOribos.." ("..Shadowlands..")"),
                                    label2=PtoTolBarad.."\n"..format(PtoUldum.."\n"..PtoDeepholm.."\n"..PtoVashjir.."\n"..PtoHyjal.."\n"..PtoTwilightHighlands.."\n"..PtoUC.."\n"..PtoDala.."\n"..PtoJadeForest.."\n"..PtoZuldazar.."\n"..PtoAzsuna.."\n"..PtoWarspear.."\n"..PtoShattrath.."\n"..PtoCavernsofTime.."\n"..PtoOribos..""), faction="Horde" },
        [46612303] = { spell=290245, timetravel=54411, portal=true, label=PtoPortofBoralus, note=TiragardeSound, lvl=50, faction="Alliance", warfront="darkshore"},
        [46302282] = { spell=290245, timetravel=54411, portal=true, label=PtoPortofZandalar, note=Zuldazar, lvl=50, faction="Horde", warfront="darkshore" },
        },-- Portal to Oribos quest=60151
    [7] = { -- Mulgore
        [33692368] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
        [33692369] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [88] = { -- Thunder Bluff
        [14222574] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
        [14222575] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [1] = { -- Durotar
        [47881015] = { portal=true, label1=PtoDala.." ("..CrystalsongForest..")\n"..format(PtoJadeForest.." ("..Pandaria..")\n"..PtoZuldazar.." ("..Zandalar..")\n"..PtoAzsuna.." ("..BrokenIsles..")\n"..PtoWarspear.." ("..Ashran..")\n"..PtoShattrath.." ("..TerokkarForest..")\n"..PtoCavernsofTime.." ("..Tanaris..")\n"..PtoOribos.." ("..Shadowlands..")"),
                                    label2=PtoDala.."\n"..format(PtoJadeForest.."\n"..PtoZuldazar.."\n"..PtoAzsuna.."\n"..PtoWarspear.."\n"..PtoShattrath.."\n"..PtoCavernsofTime.."\n"..PtoOribos..""), faction="Horde" },
        [45550380] = { hzeppelin=true, label1=ZtoTB.." ("..Mulgore..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")\n"..ZtoBoreanTundra.." ("..WarsongHold..")"),
                                       label2=ZtoTB.."\n"..format(ZtoStranglethornVale.."\n"..ZtoBoreanTundra..""), faction="Alliance" },
        [45550381] = { zeppelin=true, label1=ZtoTB.." ("..Mulgore..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")\n"..ZtoBoreanTundra.." ("..WarsongHold..")"), 
                                      label2=ZtoTB.."\n"..format(ZtoStranglethornVale.."\n"..ZtoBoreanTundra..""), faction="Horde" },
        [46980375] = { portal=true, label1=PtoTolBarad.." ("..EasternKingdoms..")\n"..format(PtoUldum.." ("..Kalimdor..")\n"..PtoDeepholm.." ("..Maelstrom..")\n"..PtoVashjir.." ("..EasternKingdoms..")\n"..PtoHyjal.." ("..Kalimdor..")\n"..PtoTwilightHighlands.." ("..EasternKingdoms..")\n"..PtoUC.." ("..Tirisfal..")"),
                                    label2=PtoTolBarad.."\n"..format(PtoUldum.."\n"..PtoDeepholm.."\n"..PtoVashjir.."\n"..PtoHyjal.."\n"..PtoTwilightHighlands.."\n"..PtoUC..""), faction="Horde" },
        },
    [85] = { -- Orgrimmar
        [59078945] = { portal=true, label1=PtoDala.." ("..CrystalsongForest..")\n"..format(PtoJadeForest.." ("..Pandaria..")\n"..PtoZuldazar.." ("..Zandalar..")\n"..PtoAzsuna.." ("..BrokenIsles..")\n"..PtoWarspear.." ("..Ashran..")\n"..PtoShattrath.." ("..TerokkarForest..")\n"..PtoCavernsofTime.." ("..Tanaris..")\n"..PtoOribos.." ("..Shadowlands..")"),
                                    label2=PtoDala.."\n"..format(PtoJadeForest.."\n"..PtoZuldazar.."\n"..PtoAzsuna.."\n"..PtoWarspear.."\n"..PtoShattrath.."\n"..PtoCavernsofTime.."\n"..PtoOribos..""), faction="Horde" },
        [50435651] = { portal=true, label=PtoUC, note=Tirisfal, faction="Horde" },
        [43126480] = { zeppelin=true, label=ZtoTB, note=Mulgore, faction="Horde" },
        [43126481] = { hzeppelin=true, label=ZtoTB, note=Mulgore, faction="Alliance" },
        [50103773] = { portal=true, label1=PtoTolBarad.." ("..EasternKingdoms..")\n"..format(PtoUldum.." ("..Kalimdor..")\n"..PtoDeepholm.." ("..Maelstrom..")\n"..PtoVashjir.." ("..EasternKingdoms..")\n"..PtoHyjal.." ("..Kalimdor..")\n"..PtoTwilightHighlands.." ("..EasternKingdoms..")"),
                                    label2=PtoTolBarad.."\n"..format(PtoUldum.."\n"..PtoDeepholm.."\n"..PtoVashjir.."\n"..PtoHyjal.."\n"..PtoTwilightHighlands..""), faction="Horde", },
                                    -- Vashj'ir complete quest 25924
                                    -- TolBarad at lvl 30
                                    -- other portals at lvl ?? Shadowlands
        [45306178] = { hzeppelin=true, label=ZtoBoreanTundra, note=WarsongHold, faction="Alliance" },
        [52885242] = { hzeppelin=true, label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance" },
        },
    [71] = { -- Tanaris
        [65794954] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [65924954] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [74] = { -- Cavern of Time
        [58202660] = { portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [59002670] = { portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        },
    [81] = { -- Silithus
        [41604520] = { spell=255152, timetravel=50659, ttturn=true, portal=true, label =PtoZuldazar, note=Zandalar, lvl=50, quest=46931, faction="Horde" },
        [41474479] = { spell=255152, timetravel=50659, ttturn=true, portal=true, label =PtoBoralus, note=TiragardeSound, lvl=50, faction="Alliance" },
        },
    [70] = { -- Dustwallow Marsh
        [71625648] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [71625647] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        },
    [62] = { -- Darkshore
        [48023627] = { spell=290245, timetravel=54411, portal=true, label=PtoPortofBoralus, note=TiragardeSound, lvl=50, faction="Alliance", warfront="darkshore" },
        [46243511] = { spell=290245, timetravel=54411, portal=true, label=PtoPortofZandalar, note=Zuldazar, lvl=50, faction="Horde", warfront="darkshore" },
        },
    [89] = { -- Darnassus
        [44247867] = { spell=290245, timetravel=54411, portal=true, label1=PtoExodar.." ("..AzuremystIsle..")\n"..format(PtoHellfirePeninsula.." ("..Outland..")"),
                                                                    label2=PtoExodar.."\n"..format(PtoHellfirePeninsula..""), faction="Alliance" },
        },
    [57] = { -- Teldrassil
        [29085646] = { spell=290245, timetravel=54411, portal=true, label1=PtoExodar.." ("..AzuremystIsle..")\n"..format(PtoHellfirePeninsula.." ("..Outland..")"),
                                                                    label2=PtoExodar.."\n"..format(PtoHellfirePeninsula..""), faction="Alliance" },
        [55009370] = { spell=290245, timetravel=54411, portal=true, label=PtoSW, note=ElwynnForest, faction="Alliance" },
        [52048951] = { spell=290245, timetravel=54411, portal=true, label=PtoExodar, note=AzuremystIsle },
        },
    [56] = { -- Wetlands
        [06216261] = { aboat=true, label=BtoTheramore, note=DustwallowMarsh, faction="Horde" },
        [04415718] = { aboat=true, label=BtoHowlingFjord, note=Valgarde, faction="Horde" },
        },
--[[    NOT USED
    [10] = { -- Northern Barrens 
        [70307341] = { boat=true, label=format(BtoBootyBay) },
        },
    [210] = { -- Cape of Stranglethorn
        [38546670] = { boat=true, label=format(BtoRatchet) },
        },
]]--
    [13] = { -- Eastern Kingdom
        [44068694] = { zeppelin=true, label1=ZtoOG.." ("..Durotar..")\n"..format(PtoUC.." ("..Tirisfal..")"),
                                      label2=ZtoOG.."\n"..format(PtoUC..""), faction="Horde" },
        [44068695] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        [41107209] = { aboat=true, label1=BtoBoralus.." ("..KulTiras..")\n"..format(BtoBoreanTundra.." ("..ValianceKeep..")"),
                                   label2=BtoBoralus.."\n"..format(BtoBoreanTundra..""), faction="Horde" },
        [41107210] = { boat=true, label1=BtoBoralus.." ("..TiragardeSound..")\n"..format(BtoBoreanTundra.." ("..ValianceKeep..")\n"..PtoDarnassus.." ("..Teldrassil..")"),
                                  label2=BtoBoralus.."\n"..format(BtoBoreanTundra.."\n"..PtoDarnassus..""), faction="Alliance" },
        [45995488] = { aboat=true, label1=BtoTheramore.." ("..DustwallowMarsh..")\n"..format(BtoHowlingFjord.." ("..Valgarde..")"),
                                   label2=BtoTheramore.."\n"..format(BtoHowlingFjord..""), faction="Horde" },
        [45995482] = { boat=true, label1=BtoTheramore.." ("..DustwallowMarsh..")\n"..format(BtoHowlingFjord.." ("..Valgarde..")"),
                                  label2=BtoTheramore.."\n"..format(BtoHowlingFjord..""), faction="Alliance" },
        [42999362] = { boat=true, label=BtoRatchet, note=NorthernBarrens },
        [56161316] = { portal=true, label1=PtoOG.." ("..Durotar..")\n"..format(PtoUC.." ("..Tirisfal..")"),
                                    label2=PtoOG.."\n"..format(PtoUC..""), faction="Horde" },
        [43637155] = { portal=true, label1=PtoTolBarad.." ("..EasternKingdoms..")\n"..format(PtoUldum.." ("..Kalimdor..")\n"..PtoDeepholm.." ("..Maelstrom..")\n"..PtoVashjir.." ("..EasternKingdoms..")\n"..PtoHyjal.." ("..Kalimdor..")\n"..PtoTwilightHighlands.." ("..EasternKingdoms..")\n"..DrTtoIF.." ("..DunMorogh..")\n"..PtoDarnassus.." ("..Teldrassil..")\n"..PtoDala.." ("..CrystalsongForest..")\n"..PtoJadeForest.." ("..Pandaria..")\n"..PtoBoralus.." ("..TiragardeSound..")\n"..PtoAzsuna.." ("..BrokenIsles..")\n"..PtoStormshield.." ("..Ashran..")\n"..PtoShattrath.." ("..TerokkarForest..")\n"..PtoExodar.." ("..AzuremystIsle..")\n"..PtoCavernsofTime.." ("..Tanaris..")\n"..PtoOribos.." ("..Shadowlands..")"),
                                    label2=PtoTolBarad.."\n"..format(PtoUldum.."\n"..PtoDeepholm.."\n"..PtoVashjir.."\n"..PtoHyjal.."\n"..PtoTwilightHighlands.."\n"..DrTtoIF.."\n"..PtoDarnassus.."\n"..PtoDala.."\n"..PtoJadeForest.."\n"..PtoBoralus.."\n"..PtoAzsuna.."\n"..PtoStormshield.."\n"..PtoShattrath.."\n"..PtoExodar.."\n"..PtoCavernsofTime.."\n"..PtoOribos..""), faction="Alliance" },
        [43337195] = { tram=true, label=DrTtoIF, note=DunMorogh, faction="Horde" },
        [43863354] = { spell=276824, timetravel=52758, portal=true, label1=PtoHowlingFjord.." ("..VengeanceLanding..")\n"..format(PtoOG.." ("..Durotar..")\n"..PtoStranglethornVale.." ("..GromgolBaseCamp..")\n"..PtoSM.." ("..EversongWoods..")\n"..PtoHellfirePeninsula.." ("..Outland..")"),
                                                   label2=PtoHowlingFjord.."\n"..format(PtoOG.."\n"..PtoStranglethornVale.."\n"..PtoSM.."\n"..PtoHellfirePeninsula..""), faction="Horde" },
        [47835898] = { tram=true, label=DrTtoSW, note=ElwynnForest, },
        [60835906] = { portal=true, label=PtoSW, note=ElwynnForest, quest=27537, faction="Alliance" },
        [35224839] = { portal=true, label=PtoSW, note=ElwynnForest, lvl=30, faction="Alliance" },
        [60105603] = { portal=true, label=PtoOG, note=Durotar, quest=26798, faction="Horde" }, --quest=26798,
        [34394957] = { portal=true, label=PtoOG, note=Durotar, lvl=30, faction="Horde" },
        [57663241] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="PALADIN" },
        [49714419] = { spell=276950, timetravel=52781, portal=true, label=PtoPortofZandalar, note=Zuldazar, lvl=50, faction="Horde", warfront="arathi" },
        [49244725] = { spell=276950, timetravel=52781, portal=true, label=PtoPortofBoralus, note=TiragardeSound, lvl=50, faction="Alliance", warfront="arathi" },
        [41003949] = { portal=true, label=PtoDalaCrater, note=HillsbradFoothills, faction="Horde", quest=27478 },
        [43674008] = { portal=true, label=PtoSepulcher, note=SilverpineForest, faction="Horde", quest=27478 },
        },-- Portal to Oribos quest=60151
    [84] = { -- Stormwind City
        [74481841] = { portal=true, label1=PtoTolBarad.." ("..EasternKingdoms..")\n"..format(PtoUldum.." ("..Kalimdor..")\n"..PtoDeepholm.." ("..Maelstrom..")\n"..PtoVashjir.." ("..EasternKingdoms..")\n"..PtoHyjal.." ("..Kalimdor..")\n"..PtoTwilightHighlands.." ("..EasternKingdoms..")"),
                                    label2=PtoTolBarad.."\n"..format(PtoUldum.."\n"..PtoDeepholm.."\n"..PtoVashjir.."\n"..PtoHyjal.."\n"..PtoTwilightHighlands..""), faction="Alliance" },
        [46419032] = { portal=true, label1=PtoDala.." ("..CrystalsongForest..")\n"..format(PtoJadeForest.." ("..Pandaria..")\n"..PtoBoralus.." ("..TiragardeSound..")\n"..PtoAzsuna.." ("..BrokenIsles..")\n"..PtoStormshield.." ("..Ashran..")\n"..PtoShattrath.." ("..TerokkarForest..")\n"..PtoExodar.." ("..AzuremystIsle..")\n"..PtoCavernsofTime.." ("..Tanaris..")\n"..PtoOribos.." ("..Shadowlands..")"),
                                    label2=PtoDala.."\n"..format(PtoJadeForest.."\n"..PtoBoralus.."\n"..PtoAzsuna.."\n"..PtoStormshield.."\n"..PtoShattrath.."\n"..PtoExodar.."\n"..PtoCavernsofTime.."\n"..PtoOribos..""), faction="Alliance" },
        [22015670] = { aboat=true, label=BtoBoralus, note=TiragardeSound, faction="Horde" },
        [17592553] = { aboat=true, label=BtoBoreanTundra, note=ValianceKeep, faction="Horde" },
        [23805620] = { portal=true, label=PtoDarnassus, note=Teldrassil, faction="Alliance" },
        [69403140] = { tram=true, label=DrTtoIF, note=DunMorogh },
        },
    [499] = { -- Deeprun Tram
        [42554350] = { tram=true, label=DrTtoIF, note=DunMorogh, },
        [42556750] = { tram=true, label=DrTtoIF, note=DunMorogh, },
        },
    [37] = { -- Elwynn Forest
        [17804775] = { portal=true, label1=PtoDala.." ("..CrystalsongForest..")\n"..format(PtoJadeForest.." ("..Pandaria..")\n"..PtoBoralus.." ("..TiragardeSound..")\n"..PtoAzsuna.." ("..BrokenIsles..")\n"..PtoStormshield.." ("..Ashran..")\n"..PtoShattrath.." ("..TerokkarForest..")\n"..PtoExodar.." ("..AzuremystIsle..")\n"..PtoCavernsofTime.." ("..Tanaris..")\n"..PtoOribos.." ("..Shadowlands..")"),
                                    label2=PtoDala.."\n"..format(PtoJadeForest.."\n"..PtoBoralus.."\n"..PtoAzsuna.."\n"..PtoStormshield.."\n"..PtoShattrath.."\n"..PtoExodar.."\n"..PtoCavernsofTime.."\n"..PtoOribos..""), faction="Alliance" },
        [06003035] = { aboat=true, label=BtoBoralus, note=TiragardeSound, faction="Horde" },
        [03631530] = { aboat=true, label=BtoBoreanTundra, note=ValianceKeep, faction="Horde" },
        [07253035] = { portal=true, label=PtoDarnassus, note=Teldrassil, faction="Alliance" },
        [31801155] = { portal=true, label1=PtoTolBarad.." ("..EasternKingdoms..")\n"..format(PtoUldum.." ("..Kalimdor..")\n"..PtoDeepholm.." ("..Maelstrom..")\n"..PtoVashjir.." ("..EasternKingdoms..")\n"..PtoHyjal.." ("..Kalimdor..")\n"..PtoTwilightHighlands.." ("..EasternKingdoms..")"),
                                    label2=PtoTolBarad.."\n"..format(PtoUldum.."\n"..PtoDeepholm.."\n"..PtoVashjir.."\n"..PtoHyjal.."\n"..PtoTwilightHighlands..""), faction="Alliance" },
        [29251812] = { tram=true, label=DrTtoIF, note=DunMorogh },
        },
    [90] = { -- Undercity
        [85301700] = { spell= 276824, timetravel=52758, portal=true, label=PtoHellfirePeninsula, note=Outland, faction="Horde" },
        },
    [18] = { -- Tirisfal Glades
        [65906865] = { spell=276824, timetravel=52758, portal=true, label=PtoHellfirePeninsula, note=Outland..")\n("..inUCMq.."", faction="Horde" },
        [59416743] = { spell=276824, timetravel=52758, portal=true, label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
        [60475885] = { spell=276824, timetravel=52758, portal=true, label=PtoOG, note=Durotar, faction="Horde" },
        [62035926] = { spell=276824, timetravel=52758, portal=true, label=PtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
        [58875901] = { spell=276824, timetravel=52758, portal=true, label=PtoHowlingFjord, note=VengeanceLanding, faction="Horde" },
        },
    [21] = { -- Silverpine Forest
        [47254337] = { portal=true, label=PtoDalaCrater, note=HillsbradFoothills, faction="Horde", quest=27478 },
        },
    [25] = { -- Hillsbrad Foothills
        [30293662] = { portal=true, label=PtoSepulcher, note=SilverpineForest, faction="Horde", quest=27478 },
        },
    [14] = { -- Arathi Highlands
        [27432937] = { spell=276950, timetravel=52781, portal=true, label=PtoPortofZandalar, note=Zuldazar, lvl=50, faction="Horde", warfront="arathi" },
        [21956514] = { spell=276950, timetravel=52781, portal=true, label=PtoPortofBoralus, note=TiragardeSound, lvl=50, faction="Alliance", warfront="arathi" },
        },
    [50] = { -- Northern Stranglethorn
        [37195161] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [224] = { -- Stranglethorn Vale
        [41403390] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
        },
    [23] = { -- Eastern Plaguelands
        [75234942] = { orderhall=true, label=PtoDala, note=BrokenIsles, class="PALADIN" },
        },
    [27] = { -- Dun Morogh
        [70452731] = { tram=true, label=DrTtoSW, note=ElwynnForest, },
        },
    [87] = { -- Ironforge
        [76205120] = { tram=true, label=DrTtoSW, note=ElwynnForest, },
        },

}