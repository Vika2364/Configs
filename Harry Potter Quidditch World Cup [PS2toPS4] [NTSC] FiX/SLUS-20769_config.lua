-- Harry Potter - Quidditch World Cup (NTSC-U)
-- Widescreen hack by ElHecht
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()
-- 16:9
eeObj.WriteMem32(0x002af388,0x3c013f40) -- 00000000 hor fov
eeObj.WriteMem32(0x002af38c,0x4481f000) -- 00000000
eeObj.WriteMem32(0x002af394,0x461ebdc2) -- 00000000

-- hardware rendering fix
eeObj.WriteMem32(0x00358ae8,0x3c013e49) -- 3c013f49 remove flickering

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)