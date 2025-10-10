local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_TravelGuide", "ruRU", false, true)

if not L then return end
-- Russian translation by Golowolom ( https://www.curseforge.com/members/golowolom )
-- and dadec666 ( https://www.curseforge.com/members/dadec666 )
-- and Hollicsh ( https://www.curseforge.com/members/hollicsh )
-- Last udpate: 21/03/2023
if L then
----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

L["config_plugin_name"] = "Путеводитель"
L["config_plugin_desc"] = "Отображает местоположение порталов, дирижаблей, кораблей и лодок на карте мира и миникарте."

L["config_tab_general"] = "Общие настройки"
L["config_tab_scale_alpha"] = "Масштаб / Прозрачность"
--L["config_scale_alpha_desc"] = "PH"
L["config_icon_scale"] = "Масштаб значка"
L["config_icon_scale_desc"] = "Размер значков"
L["config_icon_alpha"] = "Прозрачность значка"
L["config_icon_alpha_desc"] = "Прозрачность значков"
L["config_what_to_display"] = "Что отображать?"
L["config_what_to_display_desc"] = "Эти настройки определяют, какие значки будут отображаться."

L["config_portal"] = "Портал"
L["config_portal_desc"] = "Показать расположение порталов."

L["config_order_hall_portal"] = "Портал Зала Ордена"
L["config_order_hall_portal_desc"] = "Показать расположение портала Зала Ордена."

L["config_warfront_portal"] = "Портал фронта"
L["config_warfront_portal_desc"] = "Показать расположение портала фронта."

L["config_petbattle_portal"] = "Портал Битвы питомцев"
L["config_petbattle_portal_desc"] = "Показать расположение порталов Битвы питомцев."

L["config_ogreWaygate"] = "Путевые врата Огров"
L["config_ogreWaygate_desc"] = "Показать расположение Путевых врат Огров."

L["config_show_reflectivePortal"] = "Отражающий портал"
L["config_show_reflectivePortal_desc"] = "Показать расположение Отражающего портала."

L["config_boat"] = "Корабль"
L["config_boat_desc"] = "Показать расположение кораблей."
L["config_boat_alliance"] = "Корабль Альянса"
L["config_boat_alliance_desc"] = "Показать расположение кораблей Альянса."

L["config_zeppelin"] = "Дирижабль"
L["config_zeppelin_desc"] = "Показать расположение дирижаблей."
L["config_zeppelin_horde"] = "Дирижабль Орды"
L["config_zeppelin_horde_desc"] = "Показать расположение Дирижаблей Орды."

L["config_tram"] = "Подземный поезд"
L["config_tram_desc"] = "Показать Подземный поезд из Штормград в Стальгорн."

L["config_molemachine"] = "Буровая установка"
L["config_molemachine_desc"] = "Показать направления для Буровой установки."

L["config_note"] = "Заметка"
L["config_note_desc"] = "Показать дополнительные заметки узла, когда они доступны."

L["config_remove_unknown"] = "Удалить неизвестные направления"
L["config_remove_unknown_desc"] = "Это скроет пункты назначения с невыполненными требованиями на карте мира."

-- L["config_remove_AreaPois"] = "Remove Blizzard's POIs for destinations"
-- L["config_remove_AreaPois_desc"] = "This will remove the Points of Interest (POIs) set by Blizzard for destinations on the world map."

L["config_easy_waypoints"] = "Легкие точки маршрута"
L["config_easy_waypoints_desc"] = "Активирует упрощенное создание точек маршрута.\nПозволяет Вам установить путевую точку, щелкнув ПКМ, и получить доступ к дополнительным параметрам, нажав CTRL + ПКМ."
L["config_waypoint_dropdown"] = "Выбор"
L["config_waypoint_dropdown_desc"] = "Выберите способ создания точки маршрута."
L["Blizzard"] = true
L["TomTom"] = true
L["Both"] = "Оба"

L["config_teleportPlatform"] = "Телепортационные платформы в Орибосе"
L["config_teleportPlatform_desc"] = "Показать расположение телепортационных платформ в Орибосе."

L["config_animaGateway"] = "Врата анимы в Обитель героев"
L["config_animaGateway_desc"] = "Показать расположение Врат анимы в Обитель героев."

L["config_others"] = "Другое"
L["config_others_desc"] = "Показать все остальные точки."

L["config_restore_nodes"] = "Восстановить скрытые узлы"
L["config_restore_nodes_desc"] = "Восстановить все узлы, которые были скрыты через контекстное меню."
L["config_restore_nodes_print"] = "Все скрытые узлы восстановлены"

----------------------------------------------------------------------------------------------------
-------------------------------------------------DEV------------------------------------------------
----------------------------------------------------------------------------------------------------

L["dev_config_tab"] = "РАЗРАБОТКА"

L["dev_config_force_nodes"] = "Силовые узлы"
L["dev_config_force_nodes_desc"] = "Принудительно отображать все узлы независимо от класса, фракции или ковенанта."

L["dev_config_show_prints"] = "Показать печать()"
L["dev_config_show_prints_desc"] = "Показывать сообщения print() в окне чата."

----------------------------------------------------------------------------------------------------
-----------------------------------------------HANDLER----------------------------------------------
----------------------------------------------------------------------------------------------------

--==========================================CONTEXT_MENU==========================================--

L["handler_context_menu_addon_name"] = "HandyNotes: Путеводитель"
L["handler_context_menu_add_tomtom"] = "Добавить в TomTom"
L["handler_context_menu_add_map_pin"] = "Установить на карте точку маршрута"
L["handler_context_menu_hide_node"] = "Скрыть этот узел"

--============================================TOOLTIPS============================================--

L["handler_tooltip_requires"] = "Требуется"
L["handler_tooltip_sanctum_feature"] = "улучшение святилища"
L["handler_tooltip_data"] = "ИЗВЛЕЧЕНИЕ ДАННЫХ..."
L["handler_tooltip_quest"] = "Разблокировано с квестом"
L["handler_tooltip_rep"] = "Требуется репутация с"
L["handler_tooltip_toy"] = "Требуется игрушка"
L["handler_tooltip_requires_level"] = "Требуется уровень игрока не ниже"
L["handler_tooltip_TNTIER"] = "%s уровень транспортной сети."
L["handler_tooltip_not_available"] = "в данный момент НЕдоступно"
L["handler_tooltip_available"] = "в настоящее время доступно"
L["handler_tooltip_not_discovered"] = "еще не обнаружен"

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

-------------------------------------------------TWW------------------------------------------------

L["Portal to Dragonblight"] = "Портал в Драконий Погост"
L["Portal to Dustwallow Marsh"] = "Портал в Пылевые топи"
L["Portal to Searing Gorge"] = "Портал в Тлеющее ущелье"
L["Portal to Dornogal"] = "Портал в Дорногал"
L["Portal to Azj-Kahet"] = "Портал в Аз-Кахет"
L["Elevator to Isle of Dorn"] = ""
L["Elevator to Ringing Deeps"] = ""
L["Portal to Ardenweald"] = "Портал в Арденвельд"
L["Portal to Bastion"] = "Портал в Бастион"
L["Portal to Tiragarde Sound"] = "Портал в Тирагардское поморье"
L["Portal to Twilight Highlands"] = "Портал в Сумеречное нагорье"
L["Zeppelin to Siren Isle"] = "Дирижабль на Остров Сирен"
L["Zeppelin to Dornogal"] = "Дирижабль в Дорногал"
L["Mole Machine to Siren Isle"] = "Буровая установка на Остров Сирен"
L["Mole Machine to Gundargaz"] = "Буровая установка в Гундаргаз"
L["Rocket Drill to Undermine"] = "Ракетный бур в Нижнюю Шахту"
L["Rocket Drill to Ringing Deeps"] = "Ракетный бур в Гулкие глубины"
L["Rocket Drill to Kaja'Coast"] = "Ракетный бур в Каджа-кост"
L["Teleporter to Undermine"] = "Телепорт в Нижнюю Шахту"
L["Teleporter to Dornogal"] = "Телепорт в Дорногал"
L["Portal to K'aresh"] = "Портал в К'ареш"
L["Portal to Tazavesh"] = "Портал на Тазавеш"
L["Portal to Revendreth"] = "Портал в Ревендрет"
L["Delver's Headquarters"] = "Штаб исследователей"

--==========================================DRAGONFLIGHT==========================================--

L["Portal to Valdrakken"] = "Портал в Вальдраккен"
L["Boat to Dragon Isle"] = "Корабль на Драконьи острова"
L["Zeppelin to Dragon Isle"] = "Дирижабль на Драконьи острова"
L["Teleport to Seat of the Aspects"] = "Телепорт к Престолу Аспектов"
L["Portal to Badlands"] = "Портал в Бесплодные земли"
L["Portal to Emerald Dream"] = "Портал в Изумрудный Сон"
L["Portal to Ohn'ahran Plains"] = "Портал на Равнины Он'ары"
L["Portal to Central Encampment"] = "Портал в центральный лагерь"
L["Portal to The Timeways"] = "Портал в Потоки Времени"
L["Portal to Bel'ameth"] = "Портал в Бел'амет"
L["Portal to Feathermoon Stronghold"] = "Портал в Крепость Оперенной Луны"
L["Portal to Mount Hyjal"] = "Портал на Гору Хиджал"
L["Boat to Belanaar"] = "Корабль в Беланаар"
L["Boat to Stormglen"] = "Корабль в Грозовой Перевал"
L["Portal to The Nighthold"] = "Портал в Цитадель Ночи"
L["Portal to Shal'Aran"] = "Портал в Шал'Аран"
L["Rift to Dalaran"] = "Разлом в Даларан"
L["Rift to Telogrus"] = "Разлом в Телогрус"
L["Portal to Thunder Totem"] = "Портал в Громовой Тотем"

--==========================================SHADOWLANDS===========================================--

L["Portal to Oribos"] = "Портал в Орибос"
L["Waystone to Oribos"] = "Путевой камень в Орибос"
L["To Ring of Fates"] = "К Кольцу судеб"
L["To Ring of Transference"] = "К Кольцу переноса"
L["Into the Maw"] = "В Утробу"
L["To Keeper's Respite"] = "В Приют Хранителя"
L["Portal to Torghast"] = "Портал в Торгаст"
L["Portal to Zereth Mortis"] = "Портал в Зерет Мортис"

--============================================Bastion=============================================--

L["Anima Gateway to Hero's rest"] = "Врата анимы в Обитель героев"

-------------------------------------------------BfA------------------------------------------------

L["Portal to Zuldazar"] = "Портал в Зулдазар"
L["Boat to Zuldazar"] = "Корабль в Зулдазар"
L["Return to Zuldazar"] = "Возвращение в Зулдазар"
L["Boat to Vol'dun"] = "Корабль в Вол'Дун"
L["Boat to Nazmir"] = "Корабль в Назмир"
L["Portal to Nazjatar"] = "Портал в Назжатар"
L["Submarine to Mechagon"] = "Подводная лодка в Мехагон"
L["Portal to Silithus"] = "Портал в Силитус"

L["Portal to Boralus"] = "Портал в Боралус"
L["Boat to Boralus"] = "Корабль в Боралус"
L["Return to Boralus"] = "Возвращение в Боралус"
L["Boat to Drustvar"] = "Корабль в Друствар"
L["Boat to Stormsong Valley"] = "Корабль в Долину Штормов"
L["Boat to Tiragarde Sound"] = "Корабль в Тирагардское поморье"

L["Portal to Arathi Highlands"] = "Портал в Нагорье Арати"
L["Portal to Port of Zandalar"] = "Портал в порт Зандалара"
L["Portal to Darkshore"] = "Портал на Темные берега"
L["Portal to Port of Boralus"] = "Портал в порт Боралуса"
L["Boat to Echo Isles"] = "Портал в Острова Эха"

-----------------------------------------------LEGION-----------------------------------------------

L["Portal to Stormheim"] = "Портал в Штормхейм"
L["Portal to Helheim"] = "Портал в Хельхейм"
L["Portal to Dalaran"] = "Портал в Даларан"
L["Portal to Azsuna"] = "Портал в Азсуну"
L["Portal to Val'sharah"] = "Портал в Валь'шару"
L["Portal to Emerald Dreamway"] = "Портал в Изумрудный Путь Снов"
L["Portal to Suramar"] = "Портал в Сурамар"
L["Portal to Highmountain"] = "Портал в Крутогорье"
L["Great Eagle to Trueshot Lodge"] = "Большой орел в Приют стрелка"
L["Jump to Skyhold"] = "Прыжок в Небесную Цитадель"
L["Portal to Duskwood"] = "Портал в Сумеречный лес"
L["Portal to Feralas"] = "Портал в Фералас"
L["Portal to Grizzly Hills"] = "Портал в Седые холмы"
L["Portal to Hinterlands"] = "Портал во Внутренние земли"
L["Portal to Moonglade"] = "Портал в Лунную поляну"
L["Portal to Dreamgrove"] = "Портал в Рощу Снов"
L["Portal to Wyrmrest Temple"] = "Портал в храм Драконьего Покоя"
L["Portal to Karazhan"] = "Портал в Каражан"

-------------------------------------------------WoD------------------------------------------------

L["Portal to Warspear"] = "Портал в Копье Войны"
L["Portal to Stormshield"] = "Портал в Преграду Ветров"
L["Portal to Vol'mar"] = "Портал в Вол'мар"
L["Portal to Lion's watch"] = "Портал в Львиный дозор"
L["Ogre Waygate"] = "Путевые врата Огров"
L["Reflective Portal"] = "Отражающий портал"

-------------------------------------------------MoP------------------------------------------------

L["Portal to Jade Forest"] = "Портал в Нефритовый лес"
L["Portal to Pandaria"] = "Портал в Пандарию"
L["Portal to Isle of Thunder"] = "Портал на Остров Грома"
L["Portal to Shado-Pan Garrison"] = "Портал в Гарнизон Шадо-Пан"
L["Portal to Shan'ze Dao"] = "Портал на Шань'цзэ Дао"
L["Portal to Peak of Serenity"]= "Портал на Вершину Кунь-Лай"

-------------------------------------------------CATA-----------------------------------------------

L["Portal to Deepholm"] = "Портал в Подземье"
L["Portal to Temple of Earth"] = "Портал в Храм Земли"
L["Portal to Therazane's Throne"] = "Портал к трону Теразан"
L["Portal to Twilight Highlands"] = "Портал в Сумеречное нагорье"
L["Portal to Tol Barad"] = "Портал в Тол Барад"
L["Portal to Uldum"] = "Портал в Ульдум"
L["Portal to Vashj'ir"] = "Портал в Вайш'ир"
L["Portal to Hyjal"] = "Портал в Хиджал"
L["Portal to the Firelands"] = "Портал в Огненные Просторы"

------------------------------------------------WotLK-----------------------------------------------

L["Portal to the Purple Parlor"] = "Портал в Аметистовую гостиную"
L["Boat to Howling Fjord"] = "Корабль в Ревущий Фьорд"
L["Boat to Kamagua"] = "Корабль в Камагуа"
L["Portal to Howling Fjord"] = "Портал в Ревущий Фьорд"
L["Boat to Borean Tundra"] = "Корабль в Борейскую тундру"
L["Boat to Unu'pe"] = "Корабль в Уну'Пэ"
L["Zeppelin to Borean Tundra"] = "Дирижабль в Борейскую тундру"
L["Boat to Moa'ki Harbor"] = "Корабль в гавань Моа'ки"
L["Waygate to Sholazar Basin"] = "Врата в Низину Шолазар"

-------------------------------------------------BC-------------------------------------------------

L["Portal to Hellfire Peninsula"] = "Портал на Полуостров Адского Пламени"
L["Portal to Shattrath"] = "Портал в Шаттрат"
L["Portal to Isle of Quel'Danas"] = "Портал на Остров Кель'Данас"
L["Portal to Exodar"] = "Портал в Экзодар"
L["in Exodar"] = "в Экзодар"
L["Boat to Exodar"] = "Корабль в Экзодар"
L["Speak with Zephyr"] = "Поговорите с Зефиром"

-----------------------------------------------VANILLA----------------------------------------------

L["Boat to Menethil Harbor"] = "Корабль в Гавань Менетилов"

L["Portal to Silvermoon"] = "Портал в Луносвет"

L["Portal to Undercity"] = "Портал в Подгород"
L["Orb of translocation"] = "Сфера транслокации"
L["in Undercity Magic Quarter"] = "в Магический квартал Подгорода"

L["Zeppelin to Stranglethorn Vale"] = "Дирижабль в Тернистую долину"
L["Portal to Stranglethorn Vale"] = "Портал в Тернистую долину"
L["Boat to Booty Bay"] = "Корабль в Пиратскую бухту"

L["Portal to Stormwind"] = "Портал в Штормград"
L["Boat to Stormwind"] = "Корабль в Штормград"
L["Deeprun Tram to Stormwind"] = "Подземный поезд в Штормград"

L["Portal to Ironforge"] = "Портал в Стальгорн"
L["Deeprun Tram to Ironforge"] = "Подземный поезд в Стальгорн"

L["Portal to Orgrimmar"] = "Портал в Оргриммар"
L["Zeppelin to Orgrimmar"] = "Дирижабль в Оргриммар"

L["Portal to Thunder Bluff"] = "Портал в Громовой Утес"
L["Zeppelin to Thunder Bluff"] = "Дирижабль в Громовой Утес"

L["Portal to Darnassus"] = "Портал в Дарнас"

L["Boat to Ratchet"] = "Корабль в Кабестан"

L["Boat to Theramore Isle"] = "Корабль на остров Терамор"

L["Portal to Caverns of Time"] = "Портал в Пещеры Времени"

L["Portal to Dalaran Crater"] = "Портал в кратер Даларана"
L["Portal to the Sepulcher"] = "Портал в Гробницу"

L["Waygate to Un'Goro Crater"] = "Врата к кратеру Ун'Горо"
L["The Masonary"] = "Каменоломня"
L["inside the Blackrock Mountain"] = "внутри Черной горы"

L["Revealed Portal to Naxxramas"] = "Открытый портал в Наксрамас"
end
