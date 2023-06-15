-- ICO [SCUS-97113] (U)
-- Patches/Codes Hacked By Maori-Jigglypuff [Savas Guercebe]
-- Widescreen hack by nemesis2000 (pnach by nemesis2000)
-- Jak v2 or JakX v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--widescreen
eeObj.WriteMem32(0x001146c8,0x3c013f40)
eeObj.WriteMem32(0x001146cc,0x44813800)
eeObj.WriteMem32(0x001146d8,0x46071082)
eeObj.WriteMem32(0x001146dc,0xc78780dc)

--render fix
eeObj.WriteMem32(0x001141a4,0x240302ab)
eeObj.WriteMem32(0x00554790,0x44800000) --optional

--black borders fix
eeObj.WriteMem32(0x00113030,0x3c010000)

-- Maximum Graphics Booster
-- (No Blur-Effect and maxed out Game Sharpness)
eeObj.WriteMem32(0x00130450,0x03e00008)
eeObj.WriteMem32(0x00130454,0x00000000)
eeObj.WriteMem32(0x001eef18,0x03e00008)
eeObj.WriteMem32(0x001eef1c,0x00000000)
eeObj.WriteMem32(0x00113298,0x03e00008)
eeObj.WriteMem32(0x0011329c,0x00000000)
eeObj.WriteMem32(0x001133e0,0x03e00008)
eeObj.WriteMem32(0x001133e4,0x00000000)

-- Disable Post-Effect like the bright reddish Sky
eeObj.WriteMem32(0x00275208,0x00000000)

-- No black Borders
eeObj.WriteMem32(0x00112fd8,0x44800800)
eeObj.WriteMem32(0x00112ff0,0x44800800)
eeObj.WriteMem32(0x00113000,0x44800800)
eeObj.WriteMem32(0x00113120,0x44800000)

-- No Shadow Effects
eeObj.WriteMem32(0x002751CC,0x00000000)
eeObj.WriteMem32(0x002751D0,0x00000000)
eeObj.WriteMem32(0x002751D4,0x00000000)
eeObj.WriteMem32(0x002751D8,0x00000000)
eeObj.WriteMem32(0x002751DC,0x00000000)
eeObj.WriteMem32(0x002751E0,0x00000000)
eeObj.WriteMem32(0x002751E4,0x00000000)
eeObj.WriteMem32(0x002751E8,0x00000000)

end

emuObj.AddVsyncHook(patcher)