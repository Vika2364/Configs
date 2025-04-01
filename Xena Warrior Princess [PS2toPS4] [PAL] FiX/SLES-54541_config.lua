-- Xena Warrior Princess (PAL) (SLES-54541)
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x2037C2C8,0x3F88F5C3) --3F4CCCCD

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)