local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_TravelGuide", "ruRU", false, true)

if not L then return end
-- Russian translation by Кеаллах RU-Змейталак https://www.curseforge.com/members/arrogant_dreamer
-- and Hollicsh ( https://www.curseforge.com/members/hollicsh )
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

L["config_note"] = "Заметка"
L["config_note_desc"] = "Показать дополнительные заметки узла, когда они доступны."

L["config_easy_waypoints"] = "Легкие точки маршрута"
L["config_easy_waypoints_desc"] = "Активирует упрощенное создание точек маршрута.\nПозволяет Вам установить путевую точку, щелкнув ПКМ, и получить доступ к дополнительным параметрам, нажав CTRL + ПКМ."
L["config_easy_waypoints_requires"] = "Требуется"

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
L["handler_context_menu_hide_node"] = "Скрыть этот узел"

--============================================TOOLTIPS============================================--

L["handler_tooltip_data"] = "ИЗВЛЕЧЕНИЕ ДАННЫХ..."
L["handler_tooltip_requires_quest"] = "Открывается с квестом"
L["handler_tooltip_requires_reputation"] = "Требуется репутация с"
L["handler_tooltip_requires_level"] = "Требуется уровень игрока не ниже"


----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

L["Boat to Menethil Harbor"] = "Корабль в Гавань Менетилов"
L["Zeppelin to Undercity"] = "Дирижабль в Подгород"
L["Zeppelin to Stranglethorn Vale"] = "Дирижабль в Тернистую долину"
L["Boat to Booty Bay"] = "Корабль в Пиратскую бухту"
L["Deeprun Tram to Ironforge"] = "Подземный поезд в Стальгорн"
L["Deeprun Tram to Stormwind"] = "Подземный поезд в Штормград"
L["Zeppelin to Orgrimmar"] = "Дирижабль в Оргриммар"
L["Boat to Darnassus"] = "Корабль в Дарнас"
L["Boat to Ratchet"] = "Корабль в Кабестан"
L["Boat to Theramore Isle"] = "Корабль на остров Терамор"
L["Boat to Auberdine"] = "Корабль в Аубердин"
L["Portal to Silvermoon"] = "Портал в Луносвет"
L["Portal to Undercity"] = "Портал в Подгород"
L["Orb of translocation"] = "Сфера транслокации"
L["Shattrath Portal to Orgrimmar"] = "Шаттратский портал в Оргриммар"
L["Shattrath Portal to Stormwind"] = "Шаттратский портал в Штормград"
L["Boat to Exodar"] = "Корабль в Экзодар"
L["Shattrath Portal to Isle of Quel'Danas"] = "Портал из Шаттрата на остров Кель'Данас"
L["To Caverns of Time"] = "К пещерам Времени"
L["Speak with Zephyr"] = "Поговорите с Зефиром"
L["Portal to Darnassus"] = "Портал в Дарнас"
L["Portal to Exodar"] = "Портал в Экзодар"
L["Boat to Stormwind"] = "Корабль в Штормград"
L["Portal to Stormwind"] = "Портал в Штормград"
L["Portal to Orgrimmar"] = "Портал в Оргриммар"
L["Zeppelin to Thunder Bluff"] = "Дирижабль в Громовой Утес"
L["Portal to the Purple Parlor"] = "Портал в Аметистовую гостиную"
L["Boat to Howling Fjord"] = "Корабль в Ревущий фьорд"
L["Boat to Kamagua"] = "Корабль в Камагуа"
L["Zeppelin to Howling Fjord"] = "Дирижабль в Ревущий фьорд"
L["Boat to Borean Tundra"] = "Корабль в Борейскую тундру"
L["Boat to Unu'Pe"] = "Корабль в Уну'пе"
L["Zeppelin to Borean Tundra"] = "Дирижабль в Борейскую тундру"
L["Boat to Moa'Ki Harbor"] = "Корабль в гавань Моа'ки"
L["Waygate to Sholazar Basin"] = "Связующая спираль в Низине Шолазар"
L["Waygate to Un'Goro Crater"] = "Связующая спираль в Кратере Ун'Горо"
L["Portal to Blasted Lands"] = "Портал в Выжженные земли"
L["Dalaran Portal to Caverns of Time"] = "Даларанский портал к пещерам Времени"
L["Portal to Deepholm"] = "Портал в Подземье"
L["Portal to Hyjal"] = "Портал в Хиджал"
L["Portal to Temple of Earth"] = "Портал в Храм Земли"
L["Portal to the Firelands"] = "Портал в Огненные Просторы"
L["Portal to Therazane's Throne"] = "Портал к трону Теразан"
L["Portal to Tol Barad"] = "Портал в Тол Барад"
L["Portal to Twilight Highlands"] = "Портал в Сумеречное нагорье"
L["Portal to Uldum"] = "Портал в Ульдум"
L["Portal to Vashj'ir"] = "Портал в Вайш'ир"
L["Portal to Dalaran Crater"] = "Портал в кратер Даларана"
L["Portal to the Sepulcher"] = "Портал в Гробницу"
L["Portal to Dalaran"] = "Портал в Даларан"
L["Portal to Shattrath"] = "Портал в Шаттрат"
L["Portal to Thunder Bluff"] = "Портал в Громовой Утес"
L["Portal to Jade Forest"] = "Портал в Нефритовый лес"
L["Portal to Shado-Pan Garrison"] = "Портал в Гарнизон Шадо-Пан"
L["Portal to Shan'ze Dao"] = "Портал на Шань'цзэ Дао"
L["Portal to Isle of Thunder"] = "Портал на Остров Грома"
end