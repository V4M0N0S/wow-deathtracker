local frame = CreateFrame("Frame")

local function PlaySoundAndChatMessage(targetName)

    local playerName = UnitName("player")
    local message = targetName .. " is dead!"
    SendChatMessage(message, "YELL")
    PlaySoundFile("Interface\\AddOns\\Deathtracker\\Deathtracker.ogg")

end

local function IsEnemy(targetName)
    return not UnitIsFriend("player", targetName)
end

local function IsPlayer(targetName)
    return targetName == UnitName("player")
end

frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function(self, event, ...)
    local timestamp, subevent, _, sourceGUID, _, _, _, destGUID, _, _, _, _, _, _, _, _, _, _, _, _, _ = CombatLogGetCurrentEventInfo()

    if subevent == "UNIT_DIED" and destGUID:find("Player-") then
        local targetName = select(6, GetPlayerInfoByGUID(destGUID))
        if targetName and IsEnemy(targetName) and not IsPlayer(targetName) then
            PlaySoundAndChatMessage(targetName)
        end
    end
end)
