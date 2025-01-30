-- The Sims 2 - Castaway (PAL)
-- emu used=JakX v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

local patcher = function()

-- Widescreen hack 16:9
eeObj.WriteMem32(0x00435398,0x3c013fe3)
eeObj.WriteMem32(0x0043539c,0x34218e2a)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)