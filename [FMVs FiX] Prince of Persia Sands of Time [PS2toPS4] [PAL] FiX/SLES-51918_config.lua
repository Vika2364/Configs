-- Prince of Persia The Sands of Time (PAL)
-- FMV fix by Stayhye
-- Widescreen + POP Original
-- emu used=Default PS2 Emu

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--16:9
eeObj.WriteMem32(0x004b4fc0,0x3c013f40) -- 00000000 hor fov
eeObj.WriteMem32(0x004b4fd8,0x34210000) -- 00000000 hor fov
eeObj.WriteMem32(0x004b4fe4,0x4481f000) -- 00000000
eeObj.WriteMem32(0x004b4fe8,0x461e0842) -- 00000000
eeObj.WriteMem32(0x004b4ff0,0x461e1f83) -- 00000000
eeObj.WriteMem32(0x004b5008,0x4600f0c6) -- 44821800

--16:10
eeObj.WriteMem32(0x004b4fc0,0x3c013f55) -- 00000000 hor fov
eeObj.WriteMem32(0x004b4fd8,0x34215555) -- 00000000 hor fov
eeObj.WriteMem32(0x004b4fe4,0x4481f000) -- 00000000
eeObj.WriteMem32(0x004b4fe8,0x461e0842) -- 00000000
eeObj.WriteMem32(0x004b4ff0,0x461e1f83) -- 00000000
eeObj.WriteMem32(0x004b5008,0x4600f0c6) -- 44821800

-- Fix for FMV de-sync/slowness
eeObj.WriteMem32(0x0049FF34,0) --1440FFD1
eeObj.WriteMem32(0x0019A0C4,0)
eeObj.WriteMem32(0x0019A1DC,0)

--Unlock Prince Of Persia 1 
eeObj.WriteMem32(0x2030BAEC,0x0803FFE0)
eeObj.WriteMem32(0x200FFF80,0x34141000)
eeObj.WriteMem32(0x200FFF84,0xACD40000)
eeObj.WriteMem32(0x200FFF88,0x080C2EBC)

end

emuObj.AddVsyncHook(patcher)