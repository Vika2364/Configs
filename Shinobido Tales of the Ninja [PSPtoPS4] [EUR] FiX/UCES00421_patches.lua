-- Shinobido Tales of the Ninja

apiRequest(1.0)   -- request version 1.0 API. Calling apiRequest() is mandatory.

local emuObj   = getEmuObject() -- emulator
local axObj     = getAXObject() -- allegrex

local patcher = function()
--20 FPS
axObj.WriteMem32(0x2034161C, 0x00000003)
end

emuObj.AddVsyncHook(patcher)

emuObj.SetTextureHashMode(3)
emuObj.SetTextureScaleOffset(2)

