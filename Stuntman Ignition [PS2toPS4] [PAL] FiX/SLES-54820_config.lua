-- Stuntman Ignition (SLES54820)
-- emu used=red faction 2

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()


end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )
emuObj.SetGsTitleFix( "ignoreSubBuffCov", "reserved", {} )