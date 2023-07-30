-- Gadget & the Gadgetinis
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9 
eeObj.WriteMem32(0x00112858,0x3C033F40) -- 3C033F80 Zoom
eeObj.WriteMem32(0x0010F478,0x3C023FAB) -- 3C023F80 Y-FOV

--50/60FPS
eeObj.WriteMem32(0x201E9004,0x24040001)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)