--[[
来源：NGA，同内存回收代码一样，找不到具体地址了...
]]--

--最大视角
local f = CreateFrame("Frame")

f:SetScript("OnEvent", function()
	SetCVar("cameraDistanceMax", 50)
	SetCVar("CameraDistanceMaxFactor", 3.4)
end)

f:RegisterEvent("PLAYER_ENTERING_WORLD")
