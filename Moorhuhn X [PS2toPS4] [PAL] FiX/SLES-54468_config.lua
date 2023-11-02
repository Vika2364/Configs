-- Moorhuhn X
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

local patcher = function()

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)