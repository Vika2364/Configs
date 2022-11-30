-- FIFA World Cup Germany 2006
-- emu used=JakX v.2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- Fix for thin vertical lines that separate screen picture, misallignment/tearing of screen during upscaling (was used in official PSN Red Dead Revolver)
apiRequest(1.0)
local emuObj = getEmuObject()
-- psm= SCE_GS_PSMCT32 (0)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)