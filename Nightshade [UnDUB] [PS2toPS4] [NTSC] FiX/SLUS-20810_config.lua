-- Nightshade (SLUS-20810)(UnDUB)
-- Widescreen + Graphical bugs FiX
-- emu used=JakX v2

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x00183124,0x3c023f24)
eeObj.WriteMem32(0x00183128,0x34428b44)
eeObj.WriteMem32(0x0018314c,0x3c023f40)
eeObj.WriteMem32(0x00183100,0x3c014280)
eeObj.WriteMem32(0x0018310c,0x44815800)
eeObj.WriteMem32(0x002e1b40,0xe48b0070)

-- No-interlacing
eeObj.WriteMem32(0x2039C03C,0x00000000)

-- Disable the fade-in effect to fix framerate drops caused by excessive enemies
eeObj.WriteMem32(0x1d1048,0x1000000f)

-- Disable shadows to fix square bugs around characters
eeObj.WriteMem32(0x322060,0x03e00008)
eeObj.WriteMem32(0x322064,0x00000000)

-- Disable haze effect to fix charged attack frame rate drop
eeObj.WriteMem32(0x30f3f4,0x0000000)

end

emuObj.AddVsyncHook(patcher)