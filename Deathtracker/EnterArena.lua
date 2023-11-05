local frame = CreateFrame("Frame")

local function SendArenaEnterMessage()
    local message1 = "Deathtracker is ready!"
    local message2 = "All enemies will be tracked."
    SendChatMessage(message1, "YELL")
    SendChatMessage(message2, "YELL") 
end

frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function(self, event, ...)
    local zoneType = GetZonePVPInfo()
    if zoneType == "arena" then
        SendArenaEnterMessage()
    end
end)
