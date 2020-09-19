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
    get = function(info) return private.db[info[#info]] end,
    set = function(info, v)
        private.db[info[#info]] = v
        addon:SendMessage("HandyNotes_NotifyUpdate", addon.pluginName)
    end,
    args = {
        icon = {
            type = "group",
            name = L["Icon settings"],
            inline = true,
            order = 0,
            args = {
                desc = {
                    type = "description",
                    name = L["These settings control the look and feel of the icon."],
                    order = 1,
                },
                icon_scale = {
                    type = "range",
                    name = L["Icon Scale"],
                    desc = L["The scale of the icons"],
                    min = 0.25, max = 2, step = 0.01,
                    order = 2,
                },
                icon_alpha = {
                    type = "range",
                    name = L["Icon Alpha"],
                    desc = L["The alpha transparency of the icons"],
                    min = 0, max = 1, step = 0.01,
                    order = 3,
                },
            },
        },
        display = {
            type = "group",
            name = L["What to display?"],
            inline = true,
            order = 10,
            args = {
                desc = {
                    type = "description",
                    name = L["These settings control what type of icons to be displayed."],
                    order = 11,
                },
                show_portal = {
                    type = "toggle",
                    name = L["Portal"],
                    desc = L["Show the portal locations."],
                    order = 12,
                },
                show_orderhall = {
                    type = "toggle",
                    name = L["Order Hall portal"],
                    desc = L["Show the Order Hall portal locations."],
                    order = 13,
                },
                show_warfront = {
                    type = "toggle",
                    width = "full",
                    name = L["Warfront portal"],
                    desc = L["Show the Warfront portal locations."],
                    order = 14,
                },
                show_boat = {
                    type = "toggle",
                    name = L["Boat"],
                    desc = L["Show the boat locations."],
                    order = 15,
                },
                show_aboat = {
                    type = "toggle",
                    name = L["Alliance Boat"],
                    desc = L["Show the Alliance boat locations."],
                    order = 16,
                },
                show_zepplin = {
                    type = "toggle",
                    name = L["Zeppelin"],
                    desc = L["Show the Zeppelin locations."],
                    order = 17,
                },	
                show_hzepplin = {
                    type = "toggle",
                    name = L["Horde Zeppelin"],
                    desc = L["Show the Horde Zeppelin locations."],
                    order = 18,
                },
                show_tram = {
                    type = "toggle",
                    name = L["Deeprun Tram"],
                    desc = L["Show the Deeprun Tram locations in Stormwind and Ironforge."],
                    order = 19,
                },
                show_note = {
                    type = "toggle",
                    name = L["Note"],
                    desc = L["Show the node's additional notes when it's available."],
                    order = 20,
                },
                other_line = {
                    type = "header",
                    name = "",
                    order = 21,
                },
                easy_waypoint = {
                    type = "toggle",
                    width = "full",
                    name = L["Easy waypoints"],
                    desc = L["easy_waypoints_desc"],
                    order = 22,
                },
                oribos_line = {
                    type = "header",
                    name = L["Oribos"],
                    order = 23,
                },
                show_tpplatform = {
                    type = "toggle",
                    name = L["teleport_platform"],
                    desc = L["teleport_platform_desc"],
                    order = 24,
                },
                show_gate = {
                    type = "toggle",
                    name = L["gate"],
                    desc = L["gate_desc"],
                    order = 25,
                },
                bastion_line = {
                    type = "header",
                    name = L["Bastion"],
                    order = 28,
                },
                show_herorestgate = {
                    type = "toggle",
                    name = L["anima_gateway"],
                    desc = L["anima_gateway_desc"],
                    order = 29,
                },		
            },
        },
        plugin_config = {
            type = "group",
            name = L["AddOn Settings"],
            inline = true,
            order = 40,
            args = {
                unhide = {
                    type = "execute",
                    width = "full",
                    name = L["Restore hidden nodes"],
                    desc = L["Show all nodes that you have manually hidden by CTRL + right-clicking on them and choosing \"Hide this node\"."],
                    func = function()
                        for map,coords in pairs(private.hidden) do
                            wipe(coords)
                        end
                        addon:Refresh()
                        print("TravelGuide: "..L["All hidden nodes have been restored"])
                    end,
                    order = 50,
                },
            },
        },	
    },
}