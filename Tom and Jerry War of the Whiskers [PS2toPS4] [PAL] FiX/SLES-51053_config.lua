-- Tom and Jerry in War of the Whiskers [SLES-51053] (E)
-- emu used=KOF 2000

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)