-- Cars (U)(SLUS-21151)
-- Widescreen Hack by El_Patas (NTSC-U by Arapapa)
-- ported to PS4
-- emu used= Jakx v2

apiRequest(2.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Gameplay 16:9
eeObj.WriteMem32(0x00116d48,0x3c023fab) --3c023f80
eeObj.WriteMem32(0x00116d50,0x3C033CAE) --3C033C8E
eeObj.WriteMem32(0x00116d54,0x34635555) --3463FA34

--Render fix
eeObj.WriteMem32(0x001d5dc4,0x3c03bfab) --3c03bf80
eeObj.WriteMem32(0x001d5dc8,0x3c023fab) --3c023f80
--60fps
eeObj.WriteMem32(0x201B0F28,0x28630001)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)