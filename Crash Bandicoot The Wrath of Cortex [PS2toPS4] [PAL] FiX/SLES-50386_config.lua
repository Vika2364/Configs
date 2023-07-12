-- Crash Bandicoot The Wrath of Cortex [SLES-50386] (E)
-- emu used=KOF 2000

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--16:9 hack
eeObj.WriteMem32(0x21D43044,0x3F100000) --3F400000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) --texMode=1