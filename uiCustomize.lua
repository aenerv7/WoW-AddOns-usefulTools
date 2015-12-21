--[[
来源
http://bbs.ngacn.cc/read.php?tid=7028421&_ff=189
http://www.wowinterface.com/downloads/info18739-LeatrixPlus.html#info
]]--

--隐藏区域文字
ZoneTextFrame:UnregisterAllEvents()
ZoneTextFrame:SetScript("OnShow", function() this:Hide() end)
ZoneTextFrame:Hide()
SubZoneTextFrame:UnregisterAllEvents()
SubZoneTextFrame:SetScript("OnShow", function() this:Hide() end)
SubZoneTextFrame:Hide()

--超出技能距离范围 技能框体变红
hooksecurefunc("ActionButton_OnEvent",function(self, event, ...) if ( event == "PLAYER_TARGET_CHANGED" ) then self.newTimer = self.rangeTimer end end)
hooksecurefunc("ActionButton_UpdateUsable",function(self) local icon = _G[self:GetName().."Icon"] local valid = IsActionInRange(self.action) if ( valid == 0 ) then icon:SetVertexColor(1.0, 0.1, 0.1) end end)
RATM=rangeTimer
hooksecurefunc("ActionButton_OnUpdate",function(self, elapsed) local RATM = self.newTimer if ( RATM ) then RATM = RATM - elapsed if ( RATM <= 0 ) then ActionButton_UpdateUsable(self) RATM = TOOLTIP_UPDATE_TIME end self.newTimer = RATM end end)

--隐藏玩家头像伤害治疗量
PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end
PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end

--隐藏快捷键名称
local r={"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight"} for b=1,#r do for i=1,12 do _G[r[b].."Button"..i.."HotKey"]:SetAlpha(0) end end
