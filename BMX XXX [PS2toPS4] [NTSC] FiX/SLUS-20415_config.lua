-- BMX XXX
-- emu used=parappa v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- 16:9
eeInsnReplace(0x00101074,0x3c013f80,0x3c013f40) -- 3c013f80 hor fov
eeInsnReplace(0x00299544,0x00000000,0x3c093f40) -- 00000000 renderfix
eeInsnReplace(0x001014a4,0x46000843,0x080a6551) -- 46000843
eeInsnReplace(0x001014a8,0xe62404e8,0x00000000) -- e62404e8
eeInsnReplace(0x0029954c,0x00000000,0x4489f000) -- 00000000
eeInsnReplace(0x00299550,0x00000000,0x461e0843) -- 00000000
eeInsnReplace(0x00299554,0x00000000,0x46000843) -- 00000000
eeInsnReplace(0x00299558,0x00000000,0xe62004e8) -- 00000000
eeInsnReplace(0x0029955c,0x00000000,0x0804052a) -- 00000000

local patcher = function()

end

emuObj.AddVsyncHook(patcher)