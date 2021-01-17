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
                    order = 12,
                },
                show_orderhall = {
                    type = "toggle",
                    name = L["config_order_hall_portal"],
                    desc = L["config_order_hall_portal_desc"],
                    order = 13,
                },
                show_warfront = {
                    type = "toggle",
                    width = "full",
                    name = L["config_warfront_portal"],
                    desc = L["config_warfront_portal_desc"],
                    order = 14,
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
                        if select(1, UnitFactionGroup("player")) == "Alliance" then
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
                        if select(1, UnitFactionGroup("player")) == "Alliance" then
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
                        if select(1, UnitFactionGroup("player")) == "Horde" then
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
                show_note = {
                    type = "toggle",
                    name = L["config_note"],
                    desc = L["config_note_desc"],
                    order = 20,
                },
                shadowlands_line = {
                    type = "header",
                    name = "",
                    order = 21,
                },
                show_anima_gateway = {
                    type = "toggle",
                    width = "full",
                    name = L["config_anima_gateway"],
                    desc = L["config_anima_gateway_desc"],
                    order = 22,
                },
                show_teleport_platform = {
                    type = "toggle",
                    width = "full",
                    name = L["config_teleport_platform"],
                    desc = L["config_teleport_platform_desc"],
                    order = 23,
                },
                other_line = {
                    type = "header",
                    name = "",
                    order = 25,
                },
                easy_waypoint = {
                    type = "toggle",
                    width = "full",
                    name = function()
                        if IsAddOnLoaded("TomTom") then
                            return L["config_easy_waypoints"]
                        else
                            return L["config_easy_waypoints"].." |cFFFF0000("..L["handler_tooltip_requires"].." TomTom)|r"
                        end
                    end,
                    disabled = function() return not IsAddOnLoaded("TomTom") end,
                    desc = L["config_easy_waypoints_desc"],
                    order = 26,
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
                    order = 27,
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
