-- Ghost Vibration (EU)
-- emu used=JakX v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack
eeObj.WriteMem32(0x001F26F0,0x3F400000) --3F800000

--No interleacing
eeObj.WriteMem32(0x201020CC,0x64420000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)