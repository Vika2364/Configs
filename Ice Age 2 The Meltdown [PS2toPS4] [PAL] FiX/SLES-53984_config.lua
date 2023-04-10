-- Ice Age 2 The Meltdown SLES-53984
-- emu used=Siren v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Freeze FiX
eeObj.WriteMem32(0x002FF3F0,0x27BDFEE0)
eeObj.WriteMem32(0x002FF42C,0x27BD0120)

end

emuObj.AddVsyncHook(patcher)