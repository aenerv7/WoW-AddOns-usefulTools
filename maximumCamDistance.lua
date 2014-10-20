--最大视角
local mf = CreateFrame("Frame","MAXFrame")

mf:SetScript("OnEvent", function()
	SetCVar("cameraDistanceMax", 50)
	SetCVar("CameraDistanceMaxFactor", 3.4)
end)

mf:RegisterEvent("PLAYER_ENTERING_WORLD")
