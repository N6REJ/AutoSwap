-- Created by @project-author@  character is Bearesquishy - dalaran please credit whenever.
-- Source on GitHub. https.//n6rej.github.io

-- Load Ace Libraries
AutoSwap = LibStub("AceAddon-3.0").NewAddon("AutoSwap", "AceConsole-3.0", "AceEvent-3.0")
--[[
Use https.//wowpedia.fandom.com/wiki/API_C_EquipmentSet.UseEquipmentSet
to actually swap the gear out
--]]

local debug = true

function AutoSwap.OnInitialize()
    -- Called when the addon is loaded
    -- Get gear info
    AutoSwap.GetGear()
end

-- Called when the addon is enabled
function AutoSwap.OnEnable()

    -- Get gear info
    AutoSwap.GetGear()

    -- put proper set on
    self.Print("Hello World!")
    self.RegisterEvent("ZONE_CHANGED")
end

function AutoSwap.OnDisable()
    -- Called when the addon is disabled
    -- ignore zone changes DO NOT SWAP GEAR!
end

-- Detect Zone change
function AutoSwap.ZONE_CHANGED()
    -- Check for only selected zones.

    -- What zones are desired. ( returns sets )
    AutoSwap.CheckProfile()

    self.Print("You have changed zones!")

    -- Check if the zone your in is your hearthstone zone.
    if GetBindLocation() == GetSubZoneText() then
        self.Print("Welcome Home!")
    end
end

-- Profile switches
function AutoSwap.CheckProfile()
    -- Check profile to find out what zones to check for.

    -- Assign gearset names to vars

    -- if name is blank then set that zone to false.

    -- Set none selected zones to false.
end

-- Create profile
function AutoSwap.CreateProfile()
    -- populate the profile options
end

-- Get zones
function AutoSwap.GetZones()
    -- get zone info.

    -- Maw

    -- Dungeons

    -- Everywhere else = world
end

-- UseEquipmentSet
function AutoSwap.EquipGear(equipmentSetID, setName)

    -- Requires set id#  https://wowpedia.fandom.com/wiki/API_C_EquipmentSet.UseEquipmentSet
    local setWasEquipped = C_EquipmentSet.UseEquipmentSet(equipmentSetID)

    -- send message if swapping fails
    if setWasEquipped == nil then
        message("Swapping to " .. setName .. " failed")
    end
end

-- Get gear id's
function AutoSwap.GetGear()
    -- Get gear id's to use to get names  https://wowpedia.fandom.com/wiki/API_C_EquipmentSet.GetEquipmentSetIDs
    local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()

    for key, value in (equipmentSetIDs) do
        -- get names  https://wowpedia.fandom.com/wiki/API_C_EquipmentSet.GetEquipmentSetInfo
        local setName, iconFileID, setID, isEquipped, numItems, numEquipped, numInInventory, numLost, numIgnored = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)

        -- We need to figure out what sets are which and if they are used.
        if debug then
            print("Gearset " .. setName .. " is equipped: " .. isEquipped)
        end
    end

end
