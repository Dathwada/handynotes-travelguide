local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_TravelGuide", "zhCN", false, true)

if not L then return end
-- Simplified Chinese translation by mmk5 ( https://www.curseforge.com/members/mmk5 )
--  zhCN client: (NGA-男爵凯恩)
--  Last update: 2024/12/19
if L then
----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

L["config_plugin_name"] = "旅行指南"
L["config_plugin_desc"] = "在世界地图和小地图上显示传送门、飞艇、港口图标。"

L["config_tab_general"] = "通用"
L["config_tab_scale_alpha"] = "缩放/透明度"
--L["config_scale_alpha_desc"] = "PH"
L["config_icon_scale"] = "图标大小"
L["config_icon_scale_desc"] = "调整图标的大小"
L["config_icon_alpha"] = "图标透明度"
L["config_icon_alpha_desc"] = "修改图标透明度"
L["config_what_to_display"] = "显示什么？"
L["config_what_to_display_desc"] = "在这里设置显示哪些类型的图标。"

L["config_portal"] = "传送门"
L["config_portal_desc"] = "显示传送门的位置。"

L["config_order_hall_portal"] = "职业大厅"
L["config_order_hall_portal_desc"] = "显示职业大厅传送门的位置。"

L["config_warfront_portal"] = "战争前线传送门"
L["config_warfront_portal_desc"] = "显示战争前线传送门的位置。"

L["config_petbattle_portal"] = "宠物对战传送门"
L["config_petbattle_portal_desc"] = "显示宠物对战传送门的位置。"

L["config_ogreWaygate"] = "食人魔传送门"
L["config_ogreWaygate_desc"] = "显示食人魔传送门的位置。"

L["config_show_reflectivePortal"] = "反射传送门"
L["config_show_reflectivePortal_desc"] = "显示反射传送门的位置，需要玩具：[百变之镜]。"

L["config_boat"] = "船"
L["config_boat_desc"] = "显示船的位置。"
L["config_boat_alliance"] = "船-联盟"
L["config_boat_alliance_desc"] = "显示所有联盟船只的位置。"

L["config_zeppelin"] = "飞艇"
L["config_zeppelin_desc"] = "显示飞艇位置。"
L["config_zeppelin_horde"] = "飞艇-部落"
L["config_zeppelin_horde_desc"] = "显示所有部落飞艇的位置。"

L["config_tram"] = "矿道地铁"
L["config_tram_desc"] = "显示暴风城和铁炉堡的矿道地铁位置。"

L["config_molemachine"] = "钻探机[黑铁矮人]"
L["config_molemachine_desc"] = "显示钻探机[黑铁矮人]目的地。"

L["config_note"] = "图标"
L["config_note_desc"] = "当图标（船/传送点）可用时，显示相关的注释。"

L["config_remove_unknown"] = "屏蔽未知的目的地标注"
L["config_remove_unknown_desc"] = "这将屏蔽在世界地图上没有满足要求的目的地标注。"

L["config_remove_AreaPois"] = "屏蔽暴雪目的地标注"
L["config_remove_AreaPois_desc"] = "这将屏蔽暴雪在世界地图上设置的目的地的标注点（POI）。"

L["config_easy_waypoints"] = "简易导航点"
L["config_easy_waypoints_desc"] = "创建简易导航点。\n右键点击设置导航，CTRL + 右键更多选项。"
L["config_waypoint_dropdown"] = "选择"
L["config_waypoint_dropdown_desc"] = "选择如何建立导航点"
L["Blizzard"] = "暴雪原生"
L["TomTom"] = true
L["Both"] = "同时显示"

L["config_teleportPlatform"] = "奥利波斯传送平台"
L["config_teleportPlatform_desc"] = "显示奥利波斯传送平台位置."

L["config_animaGateway"] = "显示心能传送门"
L["config_animaGateway_desc"] = "显示心能传送门位置。"

L["config_others"] = "其它"
L["config_others_desc"] = "显示所有其它POI。"

L["config_restore_nodes"] = "恢复所有隐藏图标"
L["config_restore_nodes_desc"] = "显示所有被你隐藏的图标。"
L["config_restore_nodes_print"] = "所有隐藏图标已还原"

----------------------------------------------------------------------------------------------------
-------------------------------------------------DEV------------------------------------------------
----------------------------------------------------------------------------------------------------

L["dev_config_tab"] = "DEV"

L["dev_config_force_nodes"] = "强制显示"
L["dev_config_force_nodes_desc"] = "无论你的职业或阵营, 强制显示所有的点."

L["dev_config_show_prints"] = "显示标记()"
L["dev_config_show_prints_desc"] = "在聊天窗口中显示标记() 的信息."

----------------------------------------------------------------------------------------------------
-----------------------------------------------HANDLER----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================CONTEXT_MENU==========================================--

L["handler_context_menu_addon_name"] = "HandyNotes: 旅行指南"
L["handler_context_menu_add_tomtom"] = "添加到TomTom"
L["handler_context_menu_add_map_pin"] = "设置航点"
L["handler_context_menu_hide_node"] = "隐藏图标"

--============================================TOOLTIPS============================================--

L["handler_tooltip_requires"] = "需要"
L["handler_tooltip_sanctum_feature"] = "圣所升级"
L["handler_tooltip_data"] = "接收数据中..."
L["handler_tooltip_quest"] = "需要解锁任务"
L["handler_tooltip_requires_level"] = "需要玩家等级"
L["handler_tooltip_rep"] = "需要声望"
L["handler_tooltip_toy"] = "需要玩具"
L["handler_tooltip_TNTIER"] = "旅行网络的第 %s 层."
L["handler_tooltip_not_available"] = "当前不可用"
-- L["currently available"] = "目前可用"
L["handler_tooltip_not_discovered"] = "尚未发现"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

-------------------------------------------------TWW------------------------------------------------

L["Portal to Dragonblight"] = "通往龙骨荒野的传送门"
L["Portal to Dustwallow Marsh"] = "通往尘泥沼泽的传送门"
L["Portal to Searing Gorge"] = "通往灼热峡谷的传送门"
L["Portal to Dornogal"] = "通往多恩诺嘉尔的传送门"
L["Portal to Azj-Kahet"] = "通往艾基-卡赫特的传送门"
L["Elevator to Isle of Dorn"] = "通往多恩岛的电梯"
L["Elevator to Ringing Deeps"] = "通往喧鸣深窟的电梯"
L["Portal to Ardenweald"] = "通往炽蓝仙野的传送门"
L["Portal to Bastion"] = "通往晋升堡垒的传送门"
L["Portal to Tiragarde Sound"] = "通往提拉加德海峡的传送门"
L["Portal to Twilight Highlands"] = "通往暮光高地的传送门"
L["Zeppelin to Siren Isle"] = "前往海妖岛的船（飞艇）"
L["Zeppelin to Dornogal"] = "返回多恩诺嘉尔的船（飞艇）"
L["Mole Machine to Siren Isle"] = "前往海妖岛的钻探机"
L["Mole Machine to Gundargaz"] = "前往冈达加兹的钻探机"
L["Rocket Drill to Undermine"] = "搭乘钻机前往安德麦"
L["Rocket Drill to Ringing Deeps"] = "搭乘钻机前往喧鸣深窟"
L["Rocket Drill to Kaja'Coast"] = "搭乘钻机前往卡亚海滨"
L["Teleporter to Undermine"] = "前往安德麦的传送器"
L["Teleporter to Dornogal"] = "前往多恩诺嘉尔的传送器"
L["Portal to Mechagon Island"] = "通往麦卡贡岛的传送门"
L["Portal to Maldraxxus"] = "通往玛卓克萨斯的传送门"
L["Portal to K'aresh"] = "通往卡雷什的传送门"
L["Portal to Tazavesh"] = "通往塔扎维什的传送门"
L["Portal to Revendreth"] = "通往雷文德斯的传送门"
L["Delver's Headquarters"] = "地下堡行者总部"
L["Portal to Founder's Point"] = "通往创始者之角的传送门"
L["Portal to Razorwind Shores"] = "通往烈风海岸的传送门"

--==========================================DRAGONFLIGHT==========================================--

L["Portal to Valdrakken"] = "通往瓦德拉肯的传送门"
L["Boat to Dragon Isle"] = "前往巨龙群岛的船"
L["Zeppelin to Dragon Isle"] = "前往巨龙群岛的飞艇"
L["Teleport to Seat of the Aspects"] = "传送到守护巨龙之座"
L["Portal to Badlands"] = "通往荒芜之地的传送门"
L["Portal to Emerald Dream"] = "通往翡翠梦境的传送门"
L["Portal to Ohn'ahran Plains"] = "通往欧恩哈拉平原的传送门"
L["Portal to Central Encampment"] = "通往中心营地的传送门"
L["Portal to The Timeways"] = "通往时间流的传送门"
L["Portal to Bel'ameth"] = "通往贝拉梅斯的传送门"
L["Portal to Feathermoon Stronghold"] = "通往羽月要塞的传送门"
L["Portal to Mount Hyjal"] = "通往海加尔山的传送门"
L["Boat to Belanaar"] = "前往贝拉纳尔（贝拉梅斯）的船"
L["Boat to Stormglen"] = "前往风谷村（吉尔尼斯）的船"
L["Portal to The Nighthold"] = "通往暗夜要塞的传送门"
L["Portal to Shal'Aran"] = "通往沙尔艾兰的传送门"
L["Rift to Dalaran"] = "通往达拉然的裂隙"
L["Rift to Telogrus"] = "前往泰洛古斯的裂隙"
L["Portal to Thunder Totem"] = "通往雷霆图腾的传送门"

--==========================================SHADOWLANDS===========================================--

L["Portal to Oribos"] = "通往奥利波斯的传送门"
L["Waystone to Oribos"] = "前往奥利波斯的道标石"
L["To Ring of Transference"] = "前往转移之环"
L["To Ring of Fates"] = "前往命运之环"
L["Into the Maw"] = "进入噬渊"
L["To Keeper's Respite"] = "前往刻希亚的传送门"
L["Portal to Torghast"] = "通往托加斯特的传送门"
L["Portal to Zereth Mortis"] = "前往扎雷殁提斯的传送门"

--============================================Bastion=============================================--

L["Anima Gateway to Hero's rest"] = "心能传送门"

-------------------------------------------------BfA------------------------------------------------

L["Portal to Zuldazar"] = "通往祖达萨的传送门"
L["Boat to Zuldazar"] = "前往达萨罗（祖达萨）的船"
L["Return to Zuldazar"] = "返回祖达萨"
L["Boat to Vol'dun"] = "前往沃顿的船"
L["Boat to Nazmir"] = "前往纳兹米尔的船"
L["Portal to Nazjatar"] = "通往纳沙塔尔的传送门"
L["Submarine to Mechagon"] = "前往麦卡贡的潜艇"
L["Portal to Silithus"] = "通往希利苏斯的传送门"
L["Boat to Echo Isles"] = "前往回声群岛（杜隆塔尔）的船"

L["Portal to Boralus"] = "通往伯拉勒斯的传送门"
L["Boat to Boralus"] = "前往伯拉勒斯（提拉加德海峡）的船"
L["Return to Boralus"] = "返回伯拉勒斯"
L["Boat to Drustvar"] = "前往德鲁斯瓦的船"
L["Boat to Stormsong Valley"] = "前往斯托颂谷地的船"
L["Boat to Tiragarde Sound"] = "前往提拉加德海峡的船"

L["Portal to Arathi Highlands"] = "通往阿拉希高地的传送门"
L["Portal to Port of Zandalar"] = "通往赞达拉港的传送门"
L["Portal to Darkshore"] = "通往黑海岸的传送门"
L["Portal to Port of Boralus"] = "通往伯拉勒斯的传送门"

-----------------------------------------------LEGION-----------------------------------------------

L["Portal to Stormheim"] = "通往风暴峡湾的传送门"
L["Portal to Helheim"] = "通往冥狱深渊的传送门"
L["Portal to Dalaran"] = "通往达拉然（晶歌森林）的传送门"
L["Portal to Azsuna"] = "通往阿苏纳的传送门"
L["Portal to Val'sharah"] = "通往瓦尔莎拉的传送门"
L["Portal to Emerald Dreamway"] = "通往翡翠梦境的传送门"
L["Portal to Suramar"] = "通往苏拉玛的传送门"
L["Portal to Highmountain"] = "通往至高岭的传送门"
L["Great Eagle to Trueshot Lodge"] = "前往神射手营地的巨鹰"
L["Jump to Skyhold"] = "前往苍穹要塞，跳！"
L["Portal to Duskwood"] = "通往暮色森林的传送门"
L["Portal to Feralas"] = "通往菲拉斯的传送门"
L["Portal to Grizzly Hills"] = "通往灰熊丘陵的传送门"
L["Portal to Hinterlands"] = "通往辛特兰的传送门"
L["Portal to Moonglade"] = "通往月光林地的传送门"
L["Portal to Dreamgrove"] = "通往梦境林地的传送门"
L["Portal to Wyrmrest Temple"] = "通往龙眠神殿的传送门"
L["Portal to Karazhan"] = "通往卡拉赞的传送门"

-------------------------------------------------WoD------------------------------------------------

L["Portal to Warspear"] = "通往战争之矛（阿什兰）的传送门"
L["Portal to Stormshield"] = "通往暴风之盾（阿什兰）的传送门"
L["Portal to Vol'mar"] = "通往沃马尔的传送门"
L["Portal to Lion's watch"] = "通往雄狮岗哨的传送门"
L["Ogre Waygate"] = "食人魔传送门"
L["Reflective Portal"] = "反射传送门[百变之镜]"

-------------------------------------------------MoP------------------------------------------------

L["Portal to Jade Forest"] = "通往翡翠林的传送门"
L["Portal to Pandaria"] = "通往潘达利亚的传送门"
L["Portal to Isle of Thunder"] = "通往雷神岛的传送门"
L["Portal to Shado-Pan Garrison"] = "通往影踪卫戍营的传送门"
L["Portal to Shan'ze Dao"] = "通往山泽岛的传送门"
L["Portal to Peak of Serenity"] = "通往晴日峰（昆莱山）的传送门"

-------------------------------------------------CATA-----------------------------------------------

L["Portal to Deepholm"] = "通往深岩之洲的传送门"
L["Portal to Temple of Earth"] = "通往大地神殿的传送门"
L["Portal to Therazane's Throne"] = "通往塞拉赞恩的王座的传送门"
L["Portal to Twilight Highlands"] = "通往暮光高地的传送门"
L["Portal to Tol Barad"] = "通往托尔巴拉德的传送门"
L["Portal to Uldum"] = "通往奥丹姆的传送门"
L["Portal to Vashj'ir"] = "通往瓦丝琪尔的传送门"
L["Portal to Hyjal"] = "通往海加尔的传送门"
L["Portal to the Firelands"] = "到火焰之地的传送门"

------------------------------------------------WotLK-----------------------------------------------

L["Portal to the Purple Parlor"] = "通往紫色天台的传送门"
L["Boat to Howling Fjord"] = "前往匕鞘湾（嚎风峡湾）的船"
L["Boat to Kamagua"] = "前往卡玛古（嚎风峡湾）的船"
L["Portal to Howling Fjord"] = "通往嚎风峡湾的传送门"
L["Boat to Borean Tundra"] = "前往无畏要塞（北风苔原）的船"
L["Boat to Unu'pe"] = "前往乌努比（北风苔原）的船"
L["Zeppelin to Borean Tundra"] = "前往战歌要塞（北风苔原）的飞艇"
L["Boat to Moa'ki Harbor"] = "前往莫亚基港口（龙骨荒野）的船"
L["Waygate to Sholazar Basin"] = "通往索拉查盆地"

-------------------------------------------------BC-------------------------------------------------

L["Portal to Hellfire Peninsula"] = "通往地狱火半岛的传送门"
L["Portal to Shattrath"] = "通往沙塔斯的传送门"
L["Portal to Isle of Quel'Danas"] = "通往奎尔丹纳斯岛的传送门"
L["Portal to Exodar"] = "通往埃索达的传送门"
L["in Exodar"] = "埃索达内部"
L["Boat to Exodar"] = "前往埃索达的船"
L["Speak with Zephyr"] = "和塞菲尔对话-传送"

-----------------------------------------------VANILLA----------------------------------------------

L["Boat to Menethil Harbor"] = "前往米奈希尔港（湿地）的船"

L["Portal to Silvermoon"] = "通往银月城的传送门"

L["Portal to Undercity"] = "通往幽暗城的传送门"
L["Orb of translocation"] = "传送宝珠"
L["in Undercity Magic Quarter"] = "幽暗城魔法区内部"

L["Zeppelin to Stranglethorn Vale"] = "前往格罗姆高（荆棘谷）的飞艇"
L["Portal to Stranglethorn Vale"] = "通往荆棘谷的传送门"
L["Boat to Booty Bay"] = "前往藏宝海湾（荆棘谷）的船"

L["Portal to Stormwind"] = "通往暴风城的传送门"
L["Boat to Stormwind"] = "前往暴风城的船"
L["Deeprun Tram to Stormwind"] = "前往暴风城的矿道地铁"

L["Portal to Ironforge"] = "通往铁炉堡的传送门"
L["Deeprun Tram to Ironforge"] = "前往铁炉堡的矿道地铁"

L["Portal to Orgrimmar"] = "通往奥格瑞玛的传送门"
L["Zeppelin to Orgrimmar"] = "前往奥格瑞玛的飞艇"

L["Portal to Thunder Bluff"] = "通往雷霆崖的传送门"
L["Zeppelin to Thunder Bluff"] = "前往雷霆崖的飞艇"

L["Portal to Darnassus"] = "通往达纳苏斯的传送门"

L["Boat to Ratchet"] = "前往棘齿城（北贫瘠之地）的船"

L["Boat to Theramore Isle"] = "前往塞拉摩岛（尘泥沼泽）的船"

L["Portal to Caverns of Time"] = "通往时光之穴的传送门"

L["Portal to Dalaran Crater"] = "通往达拉然巨坑的传送门"
L["Portal to the Sepulcher"] = "通往墓地的传送门"

L["Waygate to Un'Goro Crater"] = "通往安戈洛环形山"
L["The Masonary"] = "石匠区"
L["inside the Blackrock Mountain"] = "在黑石山内部"

L["Revealed Portal to Naxxramas"] = "显现出的通往纳克萨玛斯的传送门"
end
