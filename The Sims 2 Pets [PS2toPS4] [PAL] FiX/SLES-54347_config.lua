-- The Sims 2 - Pets (PAL)
-- emu used=JakX v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

local patcher = function()

--Widescreen hack 16:9

--aa3f013c abaa2134 00008144 0800e003 00000000 00000000 0800e003
eeObj.WriteMem32(0x0042d160,0x3c013fe3) --3c013faa
eeObj.WriteMem32(0x0042d164,0x34218e2a) --3421aaab

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)