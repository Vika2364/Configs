-- Mafia (Sep 24, 2003 prototype)
-- emu used=kinetica v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)