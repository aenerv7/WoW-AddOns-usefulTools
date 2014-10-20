--目标DEBUFF监视

dbl={
84617,
2094,
408,
1776,
}

dbs=30;
xdb=-70;
ydb=-70;
br=3;
bdr="BORDER"
ua="UNIT_AURA"
cdbf=CreateFrame;
dbgi=GetSpellInfo;
dbbm=math.ceil;
dbfm=math.floor;
dbst=STANDARD_TEXT_FONT;

function cudb(s) 
	return UnitDebuff("target",dbgi(s))
end 

function Cdb(i,s)
	local _,_,t3=dbgi(s)
	local f=cbf("Frame","DBFrame")
	f:SetSize(dbs,dbs)
	f.t=f:CreateTexture(nil,bdr)
	f.t:SetAllPoints(true)
	f.t:SetTexture(t3)
	f.f=f:CreateFontString(nil,bdr)
	f.f:SetFont(dbst,13,"OUTLINE")
	f.f:SetPoint("CENTER",0,13)
	return f;
end 

function vdb(s,i,row)

	local db1,_,_,db4=cudb(s)
	local f=_G["DB"..i]
	if db1 then 
		f:Show()
		f:SetPoint("CENTER",xdb-(dbs+10)*dbbm((row-1)%br),ydb-(dbs+10)*dbbm(row/br))
		if (db4>1) then
			f.f:SetText(b4)
		end 
		row=row+1;
	end
	return row;
end 

function udb()
	for i,s in ipairs(dbl) do 
		local b,_,_,_,_,_,k=cudb(s)
		if b then 
			local vt=dbfm(k-GetTime())
			local vtf=(k-GetTime())
			if (vt>=60) then 
				vt=dbbm(vt/60)
				_G["DB"..i].c:SetText(vt.."m")
				elseif vt >= 1 then 
					_G["DB"..i].c:SetText(vt.."s")
				elseif vtf >= 0 and vtf <1 then
					vtf=string.format("%.1f", vtf)
					_G["DB"..i].c:SetText(vtf.."s")
			end 
		end 
	end 
end 

function Ccfdb(f)
	f.c=f:CreateFontString(nil,bdr)
	f.c:SetFont(dbst,13,"OUTLINE")
	f.c:SetPoint("CENTER",0,-13)
end 

function ddb()
	for i in ipairs(dbl) do 
		_G["DB"..i]:Hide()
	end 
end 

for i,s in ipairs(dbl) do 
	_G["DB"..i]=Cdb(i,s)
	Ccfdb(_G["DB"..i])
	_G["DB"..i]:Hide()
end 

function dbb()
	ddb()
	local dbw=1;
	for i,s in ipairs(dbl) do  
		dbw=vdb(s,i,dbw)
	end 
end 

dbk=cdbf("Frame","DBFrame")
dbk:SetScript("OnEvent",dbb)
dbk:SetScript("OnUpdate",udb)
dbk:RegisterEvent(ua)
