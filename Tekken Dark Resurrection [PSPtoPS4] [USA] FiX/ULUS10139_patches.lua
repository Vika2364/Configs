-- Tekken Dark Resurrection [USA]
-- emu used=Syphon Filter Dark Mirror

apiRequest(1.0)   -- request version 1.0 API. Calling apiRequest() is mandatory.

local emuObj   = getEmuObject() -- emulator
local axObj     = getAXObject() -- allegrex

local patcher = function()
--Disable Cheap/Temporal AA (screenshake)
axObj.WriteMem32(0x2020DC08,0xAE000024)
end

emuObj.AddVsyncHook(patcher)

