--gametitle=Tekken 3 Arcade
--emu used=bully v.2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()


emuObj.SetGsTitleFix( "ignoreSubBuffCov", "reserved", { } )     --Fix black horizontal lines on screen
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )    --Fix wrong transparent layers and ghosting
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )    --Fix wrong transparent layers and ghosting