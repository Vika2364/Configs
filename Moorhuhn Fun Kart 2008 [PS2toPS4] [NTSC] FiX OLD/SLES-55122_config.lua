-- Moorhuhn Fun Kart 2008
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 
--X-Fov
eeObj.WriteMem32(0x001997d0,0x08030000) -- 46001082 

eeObj.WriteMem32(0x000c0000,0x46001082) -- 00000000
eeObj.WriteMem32(0x000c0004,0x3c013f40) -- 00000000
eeObj.WriteMem32(0x000c0008,0x4481f000) -- 00000000
eeObj.WriteMem32(0x000c000c,0x461e1082) -- 00000000
eeObj.WriteMem32(0x000c0010,0x080665f5) -- 00000000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)