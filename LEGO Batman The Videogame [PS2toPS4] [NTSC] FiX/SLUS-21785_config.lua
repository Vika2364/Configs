-- LEGO Batman - The Videogame (U)(SLUS-21785)
-- Widescreen hack by Arapapa
-- emu used=aofa

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x2033DE44,0x00000a01) --00000a00
eeObj.WriteMem32(0x20615710,0x00000a01) --00000a00
eeObj.WriteMem32(0x0033dd6c,0x3c013f40)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } )
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2  } )