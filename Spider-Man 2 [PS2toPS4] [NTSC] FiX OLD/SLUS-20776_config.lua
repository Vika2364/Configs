-- Spider-Man 2 (NTSC-U) (SLUS_207.76)
-- Widescreen fix by flameofrecca
-- emu used=star ocean v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

eeObj.WriteMem32(0x2067a910,0x3f947ae1)  -- vertical fov
eeObj.WriteMem32(0x2067a8ec,0x3ec00000)  -- zoom value

--Map Screen HUD, text fixes
--search the 206d**** address range for more map screen hud fixes
eeObj.WriteMem32(0x206db628,0x41580000)  -- star icon fix
eeObj.WriteMem32(0x206db634,0x41580000)  -- star icon fix
eeObj.WriteMem32(0x206dfab8,0x3f400000)  -- "500m" text
eeObj.WriteMem32(0x206df9e8,0x3f400000)  -- "key locations" text
eeObj.WriteMem32(0x206df918,0x3f400000)  -- "challenges" text
eeObj.WriteMem32(0x206df848,0x3f400000)  -- "general" text
eeObj.WriteMem32(0x206d8034,0x425c0000)  -- compass size fix
eeObj.WriteMem32(0x206d8048,0x42fa0000)  -- compass size fix

--Onscreen HUD
eeObj.WriteMem32(0x20720ff4,0x42340000)  -- health
eeObj.WriteMem32(0x207223f0,0x42900000)  -- spidey symbol
eeObj.WriteMem32(0x20722404,0x42900000)
eeObj.WriteMem32(0x20722418,0x42f40000)
eeObj.WriteMem32(0x2072242c,0x42f40000)
eeObj.WriteMem32(0x20720d08,0x43140000)  --HUD perimeter
eeObj.WriteMem32(0x20720d1c,0x43140000)
eeObj.WriteMem32(0x20720cf4,0x42680000)
eeObj.WriteMem32(0x20720ce0,0x42680000)
eeObj.WriteMem32(0x2072a0d8,0x43140000)  --HUD shadow
eeObj.WriteMem32(0x2072a0ec,0x43140000)
eeObj.WriteMem32(0x2072a180,0x43140000)
eeObj.WriteMem32(0x2072a194,0x43140000)
eeObj.WriteMem32(0x2072a158,0x42680000)
eeObj.WriteMem32(0x2072a16c,0x42680000)
eeObj.WriteMem32(0x2072a0c4,0x42680000)
eeObj.WriteMem32(0x2072a0b0,0x42680000)
eeObj.WriteMem32(0x207212b4,0x421c0000)  --yellow jump meter

end

emuObj.AddVsyncHook(patcher)
