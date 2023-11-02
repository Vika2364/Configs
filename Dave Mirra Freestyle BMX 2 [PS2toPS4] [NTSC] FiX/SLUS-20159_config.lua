-- Dave Mirra Freestyle BMX 2
-- emu used=parappa v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- 16:9
eeInsnReplace(0x00100c58,0x3c013f80,0x3c013f40) -- 3c013f80 hor fov
eeInsnReplace(0x000fffd4,0x00000000,0x3c093f40) -- 00000000 renderfix
eeInsnReplace(0x001010f0,0x46000843,0x0803fff5) -- 46000843
eeInsnReplace(0x001010f4,0xe6240448,0x00000000) -- e6240448
eeInsnReplace(0x000fffdc,0x00000000,0x4489f000) -- 00000000
eeInsnReplace(0x000fffe0,0x00000000,0x461e0843) -- 00000000
eeInsnReplace(0x000fffe4,0x00000000,0x46000843) -- 00000000
eeInsnReplace(0x000fffe8,0x00000000,0xe6200448) -- 00000000
eeInsnReplace(0x000fffec,0x00000000,0x0804043d) -- 00000000

local patcher = function()

--Airport Garage helicopter rotor glitch fix
eeObj.WriteMem32(0x00100c04,0x3c013f40) -- 00000000
eeObj.WriteMem32(0x000fffd8,0x3c093f40) -- 00000000

end

emuObj.AddVsyncHook(patcher)