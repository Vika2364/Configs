-- Syberia II
-- emu used=ADK

apiRequest(1.0)  

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)