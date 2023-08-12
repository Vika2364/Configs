--Burnout (NTSC-U) (SLUS-20307)
--emu used=rogue v1

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Unlock All Tracks by InterAct
eeObj.WriteMem32(0x00379224,0x00000000)
eeObj.WriteMem32(0x0037922C,0x00000000)
eeObj.WriteMem32(0x00379234,0x00000000)
eeObj.WriteMem32(0x0037923C,0x00000000)
eeObj.WriteMem32(0x00379244,0x00000000)
eeObj.WriteMem32(0x0037924C,0x00000000)

--Unlock Cars by InterAct
eeObj.WriteMem32(0x20379200,0x00000000)
eeObj.WriteMem32(0x20379204,0x00000000)
eeObj.WriteMem32(0x20379208,0x00000000)
eeObj.WriteMem32(0x20379208,0x00000000)
eeObj.WriteMem32(0x2037920C,0x00000000)
eeObj.WriteMem32(0x20379210,0x00000000)
eeObj.WriteMem32(0x20379214,0x00000000)
eeObj.WriteMem32(0x20379218,0x00000000)

end
emuObj.AddVsyncHook(patcher)