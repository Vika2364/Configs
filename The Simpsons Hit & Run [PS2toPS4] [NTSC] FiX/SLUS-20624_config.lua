-- The Simpsons - Hit & Run (NTSC-U)
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
eeObj.WriteMem32(0x00138a88,0x00000000) -- 10400005
eeObj.WriteMem32(0x0014b360,0x00000000) -- 10400004
eeObj.WriteMem32(0x0014b364,0x00000000) -- 10400004
eeObj.WriteMem32(0x002a0b38,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031c888,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031d674,0x00000000) -- 10400004
---------CHEATS-------------------------
--Have All Levels Complete by Code Master
eeObj.WriteMem32(0x005E6CF0,0x00000006)
eeObj.WriteMem32(0x005E6CF4,0x00000006)
--Have Movie by Code Master
eeObj.WriteMem32(0x005E5E0C,0x00000001)
--Have All Wasp Cameras by Code Master
eeObj.WriteMem32(0x005E5E18,0x00000014)
--Have All Gags by Code Master
eeObj.WriteMem32(0x005E5E2C,0x0000000F)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)
-- Apply light maps texMode=2 (bilinear)  psm= SCE_GS_PSMCT32 (0)
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {tw=8, th=8, psm=0, ztst=1, texMode=2 } )