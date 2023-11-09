-- FlatOut 2 (NTSC)
-- emu used=ADK

apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

----Disable graphics overlay to fix all slowdown + widescreen code
eeObj.WriteMem32(0x3a0498,0x3c013f14)
eeObj.WriteMem32(0x2d4b40,0x3c014010)
eeObj.WriteMem32(0x22e768,0x3C013F8A)
eeObj.WriteMem32(0x2d5B30,0x00000000)
end

emuObj.AddVsyncHook(patcher)