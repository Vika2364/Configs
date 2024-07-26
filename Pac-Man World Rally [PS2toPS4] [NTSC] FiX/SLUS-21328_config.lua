-- Pac-Man World Rally (NTSC)
-- emu used=Default PS2 Emu

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
eeObj.WriteMem32(0x0016DDE4,0x4A80AADC)
eeObj.WriteMem32(0x0016DDEC,0x4B7103BC)
eeObj.WriteMem32(0x0016DDD0,0x4B00A29C)
eeObj.WriteMem32(0x0016DDD8,0x4AF103BC)

end

emuObj.AddVsyncHook(patcher)