--[[
来源：NGA，但无法找具体的地址了...
]]--

--脱战回收内存
local b = CreateFrame("Frame")
b:RegisterEvent("PLAYER_REGEN_ENABLED")
b:SetScript("OnEvent", function() _G.collectgarbage("collect") end)
frame:SetScript("OnEvent", eventHandler)
