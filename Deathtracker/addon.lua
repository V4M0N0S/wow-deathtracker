local frame = CreateFrame("FRAME", "DeathtrackerFrame");
frame:RegisterEvent("ADDON_LOADED");

function frame:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "Deathtracker" then
        print("|cffffb347[V]|r Deathtracker |cffffb347by V4M0N0S|r - Addon is ready!");
    end
end

frame:SetScript("OnEvent", frame.OnEvent);