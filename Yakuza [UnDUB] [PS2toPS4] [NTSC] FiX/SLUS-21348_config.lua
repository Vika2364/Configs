-- Yakuza Restored (UnDUB)
-- emu used=rogue v1

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patch = function()

-- Widescreen
eeObj.WriteMem32(0x0001aaab,0x00592d1c) -- If Screen setting is set to widescreen, execute these codes to fix the zoom
eeObj.WriteMem32(0x2023a820,0x3c024082) -- 3c024049 -- zoom

eeObj.WriteMem32(0x00010000,0x00592d1c) -- If Screen setting is set to normal, restore the values back to stock ones
eeObj.WriteMem32(0x2023a820,0x3c024049)

--eeObj.WriteMem32(0x2019fd24,0x3c023f40) -- 3c023f80 -- hor fov
--eeObj.WriteMem32(0x2023a828,0x34480fdb) -- 34480fdb -- zoom 2
--eeObj.WriteMem32(0x201abb90,0x3c014071) -- 3c014049 -- Alt. zoom
--eeObj.WriteMem32(0x201abb94,0x34290fdb) -- 34290fdb -- Alt. zoom 2

-- Press L1+Up 60fps Enable

if eeObj.ReadMem16(0x01F5699C) == 0xFBEF then -- R3+Up
eeObj.WriteMem32(0x2011034C,0x00000000)
eeObj.WriteMem32(0x207FC418,0x3F000000)
eeObj.WriteMem32(0x207FC41C,0x3F000000)
end

-- Press L1+Down 60fps Disable

if eeObj.ReadMem16(0x01F5699C) == 0xFBBF then -- R3+Down
eeObj.WriteMem32(0x2011034C,0x1040000A)
eeObj.WriteMem32(0x207FC418,0x3F800000)
eeObj.WriteMem32(0x207FC41C,0x3F800000)
end

-- Press R3+Up 1-Hit Kill Enable

if eeObj.ReadMem16(0x01F5699C) == 0xFFEB then -- R3+Up
eeObj.WriteMem32(0x2066A5A8,0x24020000)
end

-- Press R3+Down 1-Hit Kill Disable

if eeObj.ReadMem16(0x01F5699C) == 0xFFBB then -- R3+Down
eeObj.WriteMem32(0x2066A5A8,0x00621023)
end

end

emuObj.AddVsyncHook(patch)