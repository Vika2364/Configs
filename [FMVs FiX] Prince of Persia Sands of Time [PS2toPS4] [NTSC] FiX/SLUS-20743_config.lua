-- Prince of Persia The Sands of Time
-- FMV fix by Stayhye
-- Widescreen
-- emu used=Default PS2 Emu

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--gameplay
eeObj.WriteMem32(0x004b5114,0x3c033f40)
eeObj.WriteMem32(0x004b5144,0x4600a886)
eeObj.WriteMem32(0x004b514c,0x46000346)
eeObj.WriteMem32(0x004b5150,0x4600a306)

--rfix
eeObj.WriteMem32(0x004a4e70,0x3c014455)
eeObj.WriteMem32(0x004a4eac,0x44810000)

--menu fix
eeObj.WriteMem32(0x00464538,0x0c11e32f)
eeObj.WriteMem32(0x00478cbc,0x3c014456)
eeObj.WriteMem32(0x00478d08,0x44812800)
eeObj.WriteMem32(0x00478d04,0x2407ff95)

--HUD fix
eeObj.WriteMem32(0x001d8c80,0x3c03bddd)
eeObj.WriteMem32(0x001d8c88,0x3464dddd)

--partial bb fix
eeObj.WriteMem32(0x00253110,0x00000000)
eeObj.WriteMem32(0x002bd92c,0x00000000)

-- Fix for FMV de-sync/slowness
eeObj.WriteMem32(0x004a0034,0)
eeObj.WriteMem32(0x0019a0c4,0)
eeObj.WriteMem32(0x0019a1dc,0)

end

emuObj.AddVsyncHook(patcher)