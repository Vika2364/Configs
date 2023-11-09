-- FlatOut
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 
eeObj.WriteMem32(0x001ad904,0x3c013fab)
--eeObj.WriteMem32(0x0028ee60,0x3C013F19)
eeObj.WriteMem32(0x0018e380,0x3c013fab)
eeObj.WriteMem32(0x0031a934,0x3ee80000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)