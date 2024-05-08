-- Sniper Elite (SLUS21231)
-- emu used=red faction 2

apiRequest(2.0)

local eeObj   = getEEObject()
local emuObj  = getEmuObject()

local patcher = function()
-- Widescreen hack

-- Force turn on Widescreen (Full boot bypassing)
eeObj.WriteMem32(0x004132d8,0x24020002) --30420003

-- Zoom fix (Internal Widescreen)
eeObj.WriteMem32(0x00500bf0,0x3f9faaab) --3eaaaaab

---------------------------------------------------
--Zoom
--eeObj.WriteMem32(0x0010d044,0x3c013f1c) --3c013f00
--eeObj.WriteMem32(0x0010d04c,0x3c013f40) --3c013f80
--eeObj.WriteMem32(0x001b930c,0x3c013ff0) --3c013fa7
--eeObj.WriteMem32(0x00500c44,0x3f6da000) --3f490fda
--Y-Fov
--eeObj.WriteMem32(0x00501e48,0x3FE38E2A) --3faaaaab
--"60fps"
eeObj.WriteMem32(0x0019903C,0x0)
eeObj.WriteMem32(0x004773D4,0x0)
--disable bloom by Jvn9207
eeObj.WriteMem32(0x005027D8,0x0) --00010000
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {texMode=1} )