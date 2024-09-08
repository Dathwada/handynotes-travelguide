----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, ns = ...
local addon = LibStub("AceAddon-3.0"):GetAddon(FOLDER_NAME)
local L = ns.locale

----------------------------------------------------------------------------------------------------
-------------------------------------------DEV CONFIG TAB-------------------------------------------
----------------------------------------------------------------------------------------------------

-- Activate the developer mode with:
-- /script HandyNotes_TravelGuideDB.global.dev = true
-- /reload

local function devmode()
    ns.config.options.args["DEV"] = {
        type = "group",
        name = L["dev_config_tab"],
--      desc = L[""],
        order = 3,
        args = {
                force_nodes = {
                    type = "toggle",
                    name = L["dev_config_force_nodes"],
                    desc = L["dev_config_force_nodes_desc"],
                    order = 0,
                },
                show_prints = {
                    type = "toggle",
                    name = L["dev_config_show_prints"],
                    desc = L["dev_config_show_prints_desc"],
                    order = 1,
                },
        },
    }

    SLASH_TGREFRESH1 = "/tgrefresh"
    SlashCmdList["TGREFRESH"] = function(msg)
        addon:Refresh()
        print("TravelGuide refreshed")
    end

    SLASH_TGWARFRONTS1 = "/tgwarfronts"
    SlashCmdList["TGWARFRONTS"] = function(msg)
        print("~~~~~~~~~~~~~~~~~~~~~~")
        print("TravelGuide: Warfronts")
        print("Arathi: "..C_ContributionCollector.GetState(11)) --Battle for Stromgarde
        print("Darkshore: "..C_ContributionCollector.GetState(118)) --Battle for Darkshore
        print("~~~~~~~~~~~~~~~~~~~~~~")
    end

    SLASH_TG1 = "/tg"
    SlashCmdList["TG"] = function(msg)
        Settings.OpenToCategory('HandyNotes')
        LibStub('AceConfigDialog-3.0'):SelectGroup('HandyNotes', 'plugins', 'TravelGuide')
    end

end

function addon:debugmsg(msg)

    if (ns.global.dev and ns.db.show_prints) then
        print("|CFFFF6666TravelGuide: |r"..msg)
    end

end

ns.devmode = devmode
