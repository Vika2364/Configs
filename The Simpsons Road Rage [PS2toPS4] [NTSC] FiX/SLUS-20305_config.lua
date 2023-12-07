--The Simpsons - Road Rage (U)(SLUS-20305)
--emu used=Star Ocean v2

apiRequest(0.1)

local emuObj         = getEmuObject()
local eeObj            = getEEObject()

local fix = function()
--Widescreen hack 16:9
--X-Fov
eeObj.WriteMem32(0x0027ae14,0x080a6494)
eeObj.WriteMem32(0x00299250,0x46040002)
eeObj.WriteMem32(0x00299254,0x3c013f40)
eeObj.WriteMem32(0x00299258,0x4481f000)
eeObj.WriteMem32(0x0029925c,0x461e0002)
eeObj.WriteMem32(0x00299260,0x0809eb86)
--Render fix
eeObj.WriteMem32(0x002197dc,0x3c013f2b)

--CHEATS (All characters)
--1 Apu by Codejunkies
eeObj.WriteMem32(0x20320988,0x00000001)
--2 Barney by Codejunkies
eeObj.WriteMem32(0x2032098C,0x00000001)
--3 Chief Wiggum by Codejunkies
eeObj.WriteMem32(0x20320998,0x00000001)
--4 Flanders by InterAct
eeObj.WriteMem32(0x2032099C,0x00000001)
--5 Krusty by InterAct
eeObj.WriteMem32(0x20320984,0x00000001)
--6 Moe by InterAct
eeObj.WriteMem32(0x20320990,0x00000001)
--7 Mr Plow by InterAct
eeObj.WriteMem32(0x203209A0,0x00000001)
--8 Otto by InterAct
eeObj.WriteMem32(0x20320994,0x00000001)
--9 Prof. Frink by InterAct
eeObj.WriteMem32(0x203209AC,0x00000001)
--10 Reverend Lovejoy by InterAct
eeObj.WriteMem32(0x203209A4,0x00000001)
--11 Snake by InterAct
eeObj.WriteMem32(0x203209A8,0x00000001)
--12 Willie by InterAct
eeObj.WriteMem32(0x20320980,0x00000001)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(fix)