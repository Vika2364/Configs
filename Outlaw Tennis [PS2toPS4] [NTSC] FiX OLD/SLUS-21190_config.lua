-- Outlaw Tennis
-- Widescreen
-- emu used=Rogue v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x005b8068,0x3f9c67c8)

end

emuObj.AddVsyncHook(patcher)