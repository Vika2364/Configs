-- 10,000 Bullets PAL (SLES_534.81)
-- Widescreen Hack
-- Jak v2

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()
local patcher = function()
eeObj.WriteMem32(0x005EDED4,0x3C013FAA) -- widescreen hack
eeObj.WriteMem32(0x005EE0EC,0x3C013FAA)
eeObj.WriteMem32(0x003C046C,0x3C013FF3) -- HUD
eeObj.WriteMem32(0x003C046C,0x3C013FB6) -- HUD
eeObj.WriteMem32(0x003C0374,0x3C0143D4) -- Set FMV to 16:9 aspect ratio
eeObj.WriteMem32(0x003C0374,0x3C0143A0) -- Set FMV to 16:9 aspect ratio
end

emuObj.AddVsyncHook(patcher)