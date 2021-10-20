-- Load Ace Libraries
AutoSwap = LibStub("AceAddon-3.0"):NewAddon("AutoSwap", "AceConsole-3.0", "AceEvent-3.0")

function AutoSwap:OnInitialize()
    -- Called when the addon is loaded
end

function AutoSwap:OnEnable()
    -- Called when the addon is enabled
    self:Print("Hello World!")
    self:RegisterEvent("ZONE_CHANGED")
end

function AutoSwap:OnDisable()
    -- Called when the addon is disabled
end

-- Detect Zone change
function AutoSwap:ZONE_CHANGED()
    self:Print("You have changed zones!")
    
    -- Check if the zone your in is your hearthstone zone.
    if GetBindLocation() == GetSubZoneText() then
        self:Print("Welcome Home!")
    end
end