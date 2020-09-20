local _G = getfenv(0)
local pairs = _G.pairs
local FOLDER_NAME, private = ...
local LibStub = _G.LibStub;
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name);

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
        name = L["config_general"],
--        desc = L[""],
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
                    order = 16,
                },
                show_zeppelin = {
                    type = "toggle",
                    name = L["config_zeppelin"],
                    desc = L["config_zeppelin_desc"],
                    order = 17,
                },	
                show_hzeppelin = {
                    type = "toggle",
                    name = L["config_zeppelin_horde"],
                    desc = L["config_zeppelin_horde_desc"],
                    order = 18,
                },
                show_tram = {
                    type = "toggle",
                    name = L["config_deeprun_tram"],
                    desc = L["config_deeprun_tram_desc"],
                    order = 19,
                },
                show_note = {
                    type = "toggle",
                    name = L["config_note"],
                    desc = L["config_note_desc"],
                    order = 20,
                },
                oribos_line = {
                    type = "header",
                    name = L["Oribos"],
                    order = 21,
                },
                show_tpplatform = {
                    type = "toggle",
                    name = L["config_teleport_platform"],
                    desc = L["config_teleport_platform_desc"],
                    order = 22,
                },
                bastion_line = {
                    type = "header",
                    name = L["Bastion"],
                    order = 23,
                },
                show_herorestgate = {
                    type = "toggle",
                    name = L["config_anima_gateway"],
                    desc = L["config_anima_gateway_desc"],
                    order = 24,
                },
                unhide_line = {
                    type = "header",
                    name = "",
                    order = 25,
                },
                show_covenant = {
                    type = "toggle",
                    width = "full",
                    name = L["config_covenant"],
                    desc = L["config_covenant_desc"],
                    order = 26,
                },
                other_line = {
                    type = "header",
                    name = "",
                    order = 27,
                },
                easy_waypoint = {
                    type = "toggle",
                    width = "full",
                    name = L["config_easy_waypoints"],
                    desc = L["config_easy_waypoints_desc"],
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
        name = L["config_scale_alpha"],
--        desc = L["config_scale_alpha_desc"],
        order = 1,
        args = {
        
        },
    },
    },
}

icongroup = {"config_portal", "config_boat", "config_zeppelin", "config_covenant", "config_others"}

for i, icongroup in ipairs({"config_portal", "config_boat", "config_zeppelin", "config_covenant", "config_others"}) do
    config.options.args.SCALEALPHA.args['name_'..icongroup] = {
        type = "header",
        name = L[icongroup],
        order = i *10,
    }

    config.options.args.SCALEALPHA.args['icon_scale_'..icongroup] = {
        type = "range",
        name = L["config_icon_scale"],
        desc = L["config_icon_scale_desc"],
        min = 0.25, max = 3, step = 0.01,
        arg = "icon_scale_"..icongroup,
        width = 1.13,
        order = i *10 + 1,
    }

    config.options.args.SCALEALPHA.args['icon_alpha_'..icongroup] = {
        type = "range",
        name = L["config_icon_alpha"],
        desc = L["config_icon_alpha_desc"],
        min = 0, max = 1, step = 0.01,
        arg = "icon_alpha_"..icongroup,
        width = 1.13,
        order = i *10 + 2,
    }
end
