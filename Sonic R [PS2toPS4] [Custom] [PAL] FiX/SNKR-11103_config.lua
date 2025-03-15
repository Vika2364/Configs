-- Sonic R (Sonic Gems Collection)
-- emu used=Star Wars Racer's Revenge v1

local gpr = require("ee-gpr-alias")

apiRequest(0.4)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()


emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)