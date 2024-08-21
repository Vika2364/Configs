-- True Crime New York City (NTSC)
-- emu used=Jak2v2

apiRequest(2.0)

local eeObj       = getEEObject()
local emuObj      = getEmuObject()
local gpr         = require("ee-gpr-alias")

local patcher     = function()
--draw distance?
eeObj.WriteMem32(0x208A45F0,0x4) --0x7
--debug mode
eeObj.WriteMem32(0x2052BBBC,0x1) --0x0
end
emuObj.ThrottleMax()
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

emuObj.SetDisplayAspectWide()