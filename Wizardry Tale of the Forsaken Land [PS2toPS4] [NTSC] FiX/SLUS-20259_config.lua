-- Wizardry Tale of the Forsaken Land SLUS_202.59
-- emu used=Jak

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x00119d1c,0x3c0143d5)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)