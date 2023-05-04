-- Ape Escape 2 (NTSC)
-- emu used=ape escape 2

apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local widescreen = function()

--Eliminate flickering texture and improve background color and clarity
eeObj.WriteMem32(0x0034CE88,0x00000000)
end

emuObj.AddVsyncHook(widescreen)