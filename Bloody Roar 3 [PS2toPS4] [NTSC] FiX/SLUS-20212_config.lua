-- Bloody Roar 3
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen
eeObj.WriteMem32(0x201f4454,0x3F400000)
--No interlacing 
eeObj.WriteMem32(0x201CF8DC,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)