-- Indiana Jones and the Staff of Kings NTSC
-- Widescreen Hack by Arapapa
-- emu jakxv2

local gpr = require("ee-gpr-alias")

apiRequest(2.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x001a3d40,0x3c033ec0) -- 3c033f00

--60 fps by asasega @PCSX2 forums
eeObj.WriteMem32(0x201505B4,0x2C620000)

emuObj.ThrottleMax()
end

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )

emuObj.AddVsyncHook(patcher)