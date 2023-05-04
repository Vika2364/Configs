-- Ape Escape Pumped and Primed (NTSC)
-- emu used=ape escape 2

apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()
local patcher = function()

--Fix game frame rate
eeObj.WriteMem32(0x3816e0,0x10000025)
end

emuObj.AddVsyncHook(patcher)