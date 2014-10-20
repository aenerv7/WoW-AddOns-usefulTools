--自身BUFF监视
bl={

--[[
121153, --盲点
115189, --预感
5171, --切割
51713, --暗影之舞
13877, --剑刃乱舞
13750, --冲动
121471, --暗影之刃
1966, --佯攻
138699, --影踪派饰品
126707, --被动PVP饰品
126690, --主动PVP饰品
125487, --刺绣2000
96228, --神经元弹簧1920
120032, --钢铁之舞1650
73651, --恢复
33702, --血性狂怒2257
31224, --暗影斗篷
5277, --闪避
74001, --备战就绪
108212, --速度爆发
2983, --疾跑
]]--

5171,
84745,
84746,
84747,
13750,
115189,
1966,
84617,
73651,
108212,
2983,
}

bs=30;
xb=70;
yb=-70;
br=3;
bdr="BORDER"
be="UNIT_AURA"
cbf=CreateFrame;
gi=GetSpellInfo;
bm=math.ceil;
fm=math.floor;
st=STANDARD_TEXT_FONT;

function cub(s) 
	return UnitBuff("player",gi(s))
end 

function Cb(i,s)
	local _,_,t3=gi(s)
	local f=cbf("Frame", "BFrame")
	f:SetSize(bs,bs)
	f.t=f:CreateTexture(nil,bdr)
	f.t:SetAllPoints(true)
	f.t:SetTexture(t3)
	f.f=f:CreateFontString(nil,bdr)
	f.f:SetFont(st,13,"OUTLINE")
	f.f:SetPoint("CENTER",0,13)
	return f;
end 

function vb(s,i,row)

	local b1,_,_,b4=cub(s)
	local f=_G["B"..i]
	if b1 then 
		f:Show()
		f:SetPoint("CENTER",xb+(bs+10)*bm((row-1)%br),yb-(bs+10)*bm(row/br))
		if (b4>1) then
			f.f:SetText(b4)
		end 
		row=row+1;
	end
	return row;
end 

function ub()
	for i,s in ipairs(bl) do 
		local b,_,_,_,_,_,k=cub(s)
		if b then 
			local vt=fm(k-GetTime())
			local vtf=(k-GetTime())
			if (vt>=60) then 
				vt=bm(vt/60)
				_G["B"..i].c:SetText(vt.."m")
				elseif vt >= 1 then 
					_G["B"..i].c:SetText(vt.."s")
				elseif vtf >= 0 and vtf <1 then
					vtf=string.format("%.1f", vtf)
					_G["B"..i].c:SetText(vtf.."s")
			end 
		end 
	end 
end 

function Ccfb(f)
	f.c=f:CreateFontString(nil,bdr)
	f.c:SetFont(st,13,"OUTLINE")
	f.c:SetPoint("CENTER",0,-13)
end 

function db()
	for i in ipairs(bl) do 
		_G["B"..i]:Hide()
	end 
end 

for i,s in ipairs(bl) do 
	_G["B"..i]=Cb(i,s)
	Ccfb(_G["B"..i])
	_G["B"..i]:Hide()
end 

function bb()
	db()
	local bw=1;
	for i,s in ipairs(bl) do  
		bw=vb(s,i,bw)
	end 
end 

bk=cbf("Frame", "BFrame")
bk:SetScript("OnEvent",bb)
bk:SetScript("OnUpdate",ub)
bk:RegisterEvent(be)
