----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...
local addon = LibStub("AceAddon-3.0"):GetAddon(FOLDER_NAME)
local L = private.locale

addon.pluginName  = L["config_plugin_name"]
addon.description = L["config_plugin_desc"]

----------------------------------------------------------------------------------------------------
-----------------------------------------------CONFIG-----------------------------------------------
----------------------------------------------------------------------------------------------------

local config = {}
private.config = config

config.options = {
    type = "group",
    name = addon.pluginName,
    desc = addon.description,
    childGroups = "tab",
    get = function(info) return private.db[info[#info]] end,
    set = function(info, v)
        private.db[info[#info]] = v
        addon:SendMessage("HandyNotes_NotifyUpdate", addon.pluginName)
    end,
    args = {
    ICONDISPLAY = {
        type = "group",
        name = L["config_tab_general"],
--      desc = L[""],
        order = 0,
        args = {
            display = {
            type = "group",
            name = L["config_what_to_display"],
            inline = true,
            order = 10,
            args = {
                desc = {
                    type = "description",
                    name = L["config_what_to_display_desc"],
                    order = 11,
                },
                show_portal = {
                    type = "toggle",
                    name = L["config_portal"],
                    desc = L["config_portal_desc"],
                    order = 12.0,
                },
                show_orderhall = {
                    type = "toggle",
                    name = L["config_order_hall_portal"],
                    desc = L["config_order_hall_portal_desc"],
                    order = 12.1,
                },
                show_warfront = {
                    type = "toggle",
                    name = L["config_warfront_portal"],
                    desc = L["config_warfront_portal_desc"],
                    order = 12.2,
                },
                show_petBattlePortal = {
                    type = "toggle",
                    name = L["config_petbattle_portal"],
                    desc = L["config_petbattle_portal_desc"],
                    order = 12.3,
                },
                show_ogreWaygate = {
                    type = "toggle",
                    name = L["config_ogreWaygate"],
                    desc = L["config_ogreWaygate_desc"],
                    order = 12.4,
                },
                show_boat = {
                    type = "toggle",
                    name = L["config_boat"],
                    desc = L["config_boat_desc"],
                    order = 15,
                },
                show_aboat = {
                    type = "toggle",
                    name = L["config_boat_alliance"],
                    desc = L["config_boat_alliance_desc"],
                    hidden = function()
                        if (select(1, UnitFactionGroup("player")) == "Alliance") then
                            return true
                        end
                    end,
                    order = 16,
                },
                show_zeppelin = {
                    type = "toggle",
                    name = L["config_zeppelin"],
                    desc = L["config_zeppelin_desc"],
                    hidden = function()
                        if (select(1, UnitFactionGroup("player")) == "Alliance") then
                            return true
                        end
                    end,
                    order = 17,
                },
                show_hzeppelin = {
                    type = "toggle",
                    name = L["config_zeppelin_horde"],
                    desc = L["config_zeppelin_horde_desc"],
                    hidden = function()
                        if (select(1, UnitFactionGroup("player")) == "Horde") then
                            return true
                        end
                    end,
                    order = 18,
                },
                show_tram = {
                    type = "toggle",
                    name = L["config_tram"],
                    desc = L["config_tram_desc"],
                    order = 19,
                },
                show_molemachine = {
                    type = "toggle",
                    name = L["config_molemachine"],
                    desc = L["config_molemachine_desc"],
                    hidden = function() return select(2, UnitRace("player")) ~= "DarkIronDwarf" end,
                    order = 20,
                },
                show_note = {
                    type = "toggle",
                    name = L["config_note"],
                    desc = L["config_note_desc"],
                    order = 21,
                },
                shadowlands_line = {
                    type = "header",
                    name = "",
                    order = 22,
                },
                show_animaGateway = {
                    type = "toggle",
                    width = "full",
                    name = L["config_animaGateway"],
                    desc = L["config_animaGateway_desc"],
                    order = 23,
                },
                show_teleportPlatform = {
                    type = "toggle",
                    width = "full",
                    name = L["config_teleportPlatform"],
                    desc = L["config_teleportPlatform_desc"],
                    order = 24,
                },
                other_line = {
                    type = "header",
                    name = "",
                    order = 25,
                },
                remove_AreaPois = {
                    type = "toggle",
                    width = "full",
                    name = L["config_remove_AreaPois"],
                    desc = L["config_remove_AreaPois_desc"],
                    order = 26,
                },
                easy_waypoint = {
                    type = "toggle",
                    width = 1.3,
                    name = L["config_easy_waypoints"],
                    desc = L["config_easy_waypoints_desc"],
                    order = 27,
                },
                easy_waypoint_dropdown = {
                    type = "select",
                    values = { L["Blizzard"], L["TomTom"], L["Both"] },
                    disabled = function() return not private.db.easy_waypoint end,
                    hidden = function() return not IsAddOnLoaded("TomTom") end,
                    name = L["config_easy_waypoints_dropdown"],
                    desc = L["config_easy_waypoints_dropdown_desc"],
                    width = 0.7,
                    order = 28,
                },
                unhide = {
                    type = "execute",
                    width = "full",
                    name = L["config_restore_nodes"],
                    desc = L["config_restore_nodes_desc"],
                    func = function()
                        for map,coords in pairs(private.hidden) do
                            wipe(coords)
                        end
                        addon:Refresh()
                        print("TravelGuide: "..L["config_restore_nodes_print"])
                    end,
                    order = 29,
                },
            },
            },
        },
    },
    SCALEALPHA = {
        type = "group",
        name = L["config_tab_scale_alpha"],
--      desc = L["config_scale_alpha_desc"],
        order = 1,
        args = {

        },
    },
    },
}

-- create the scale / alpha config menu
for i, icongroup in ipairs(private.constants.icongroup) do

    config.options.args.SCALEALPHA.args["name_"..icongroup] = {
        type = "header",
        name = L["config_"..icongroup],
        order = i *10,
    }

    config.options.args.SCALEALPHA.args["icon_scale_"..icongroup] = {
        type = "range",
        name = L["config_icon_scale"],
        desc = L["config_icon_scale_desc"],
        min = 0.25, max = 3, step = 0.01,
        arg = "icon_scale_"..icongroup,
        width = 1.07,
        order = i *10 + 1,
    }

    config.options.args.SCALEALPHA.args["icon_alpha_"..icongroup] = {
        type = "range",
        name = L["config_icon_alpha"],
        desc = L["config_icon_alpha_desc"],
        min = 0, max = 1, step = 0.01,
        arg = "icon_alpha_"..icongroup,
        width = 1.07,
        order = i *10 + 2,
    }
end
