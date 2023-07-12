-- Crash: Mind Over Mutant (PAL)
-- emu used=JakX v2 

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)