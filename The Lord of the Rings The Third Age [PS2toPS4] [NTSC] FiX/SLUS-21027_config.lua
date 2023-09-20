-- The Lord of the Rings The Third Age SLUS-21027
-- emu used=art of fighting anthology

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

-- FiX vertical transparent line bug
eeInsnReplace(0x21ae18, 0x14a000b4, 0x100000b4)

local patcher = function()

-- Widescreen
eeObj.WriteMem32(0x20C37580,0x3f400000)  --fov
eeObj.WriteMem32(0x20C37590,0x3fb00000)  --renderfix 1
eeObj.WriteMem32(0x20C37598,0x3fb00000)  --renderfix 2

end

emuObj.AddVsyncHook(patcher)