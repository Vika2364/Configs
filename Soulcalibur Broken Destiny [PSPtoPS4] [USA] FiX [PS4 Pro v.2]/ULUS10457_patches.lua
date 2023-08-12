-- Soulcalibur Broken Destiny (ULUS10457)

apiRequest(1.0)  -- request version 1.0 API. Calling apiRequest() is mandatory.

local emuObj  = getEmuObject() -- emulator
local axObj  = getAXObject() -- allegrex

local patcher = function()
--Speed Mod
axObj.WriteMem32(0x203CFE78,0x3F000000)
emuObj.ThrottleNormal()
end

emuObj.AddVsyncHook(patcher)


emuObj.SetFDExtraDelay(80)
emuObj.SetTextureHashMode("patchworkheroes")
emuObj.VideoScale(false)
