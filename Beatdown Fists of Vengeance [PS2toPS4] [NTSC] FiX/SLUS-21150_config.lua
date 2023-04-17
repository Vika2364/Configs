-- Beat Down - Fists of Vengeance (U) (SLUS-21150)
-- Widescreen Hack (16:9) by ElHecht
-- emu used=parappa v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--X-Fov
eeObj.WriteMem32(0x002661f0,0x080f8050) -- c6010068
eeObj.WriteMem32(0x003e0140,0x3c013f40) -- 00000000
eeObj.WriteMem32(0x003e0144,0x4481f000) -- 00000000
eeObj.WriteMem32(0x003e0148,0xc6010068) -- 00000000
eeObj.WriteMem32(0x003e014c,0xc602006c) -- 00000000
eeObj.WriteMem32(0x003e0150,0x461e0843) -- 00000000
eeObj.WriteMem32(0x003e0154,0xe6010068) -- 00000000
eeObj.WriteMem32(0x003e0158,0x0809987e) -- 00000000

--emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)