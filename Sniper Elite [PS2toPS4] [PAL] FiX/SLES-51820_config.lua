-- Sniper Elite (SLES51820)
-- emu used=red faction 2

apiRequest(2.0)

local eeObj   = getEEObject()
local emuObj  = getEmuObject()

local patcher = function()
--widescreen
eeObj.WriteMem32(0x005015d0,0x3f9faaab)
eeObj.WriteMem32(0x00502848,0x3fe38e2a)
--"60fps"
eeObj.WriteMem32(0x00198FCC,0x0)
eeObj.WriteMem32(0x00475ED4,0x0)
--disable bloom by Jvn9207
eeObj.WriteMem32(0x005031E0,0x0) --00010000
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {texMode=1} )