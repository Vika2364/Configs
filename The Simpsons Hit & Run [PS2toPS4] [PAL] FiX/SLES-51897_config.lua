-- The Simpsons - Hit & Run (PAL)
-- Widescreen hack by ElHecht
-- ported to PS4
-- emu used=eternal ring v2

local gpr = require("ee-gpr-alias")

apiRequest(1.5)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.ForceRefreshRate(60)
emuObj.SetDisplayAspectWide()

local patcher = function()
-- 16:9 ver
eeObj.WriteMem32(0x00138ab8,0x00000000) -- 10400005
eeObj.WriteMem32(0x0014b3a8,0x00000000) -- 10400004
eeObj.WriteMem32(0x0014c3ac,0x00000000) -- 10400004
eeObj.WriteMem32(0x002a1f88,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031e0b8,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031eea4,0x00000000) -- 10400004

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)
-- Apply light maps texMode=2 (bilinear)  psm= SCE_GS_PSMCT32 (0)
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {tw=8, th=8, psm=0, ztst=1, texMode=2 } )