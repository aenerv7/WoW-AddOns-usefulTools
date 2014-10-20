--脱战回收内存

local gc = CreateFrame("Frame","GCFrame")
gc:RegisterEvent("PLAYER_REGEN_ENABLED")
gc:SetScript("OnEvent", function() _G.collectgarbage("collect") end)
