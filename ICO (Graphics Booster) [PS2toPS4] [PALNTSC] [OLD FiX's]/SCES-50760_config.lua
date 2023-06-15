-- ICO [SCES-50760] (E)
-- Patches/Codes Hacked By Maori-Jigglypuff [Savas Guercebe]
-- Widescreen hack by nemesis2000 (pnach by nemesis2000)
-- Jak v2 or JakX v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--widescreen
eeObj.WriteMem32(0x00114dd0,0x3c013f40)
eeObj.WriteMem32(0x00114dd4,0x4481c000)
eeObj.WriteMem32(0x00114de0,0x46181082)

--render fix
eeObj.WriteMem32(0x001146F4,0x240302ab)
eeObj.WriteMem32(0x0054E478,0x44fa0000) 

--black borders fix
eeObj.WriteMem32(0x00113450,0x3c010000)

-- Maximum Graphics Booster
-- (No Blur-Effect and maxed out Game Sharpness)
eeObj.WriteMem32(0x001322f0,0x03e00008)
eeObj.WriteMem32(0x001322f4,0x00000000)
eeObj.WriteMem32(0x001fca60,0x03e00008)
eeObj.WriteMem32(0x001fca64,0x00000000)
eeObj.WriteMem32(0x001137f8,0x03e00008)
eeObj.WriteMem32(0x001137fc,0x00000000)
eeObj.WriteMem32(0x001136b0,0x03e00008)
eeObj.WriteMem32(0x001136b4,0x00000000)

-- Disable Post-Effect like the bright reddish Sky
eeObj.WriteMem32(0x0028F808,0x00000000)

-- No black Borders
eeObj.WriteMem32(0x001133F8,0x44800800)
eeObj.WriteMem32(0x00113410,0x44800800)
eeObj.WriteMem32(0x00113420,0x44800800)
eeObj.WriteMem32(0x00113534,0x44800000)

-- No Shadow Effects
eeObj.WriteMem32(0x0028F7CC,0x00000000)
eeObj.WriteMem32(0x0028F7D0,0x00000000)
eeObj.WriteMem32(0x0028F7D4,0x00000000)
eeObj.WriteMem32(0x0028F7D8,0x00000000)
eeObj.WriteMem32(0x0028F7DC,0x00000000)
eeObj.WriteMem32(0x0028F7E0,0x00000000)
eeObj.WriteMem32(0x0028F7E4,0x00000000)
eeObj.WriteMem32(0x0028F7E8,0x00000000)

end

emuObj.AddVsyncHook(patcher)