--Azumi (NTSC-J)(SLPS-25465)
--Widescreen Hack by Arapapa
--emu used = jakv2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9
eeObj.WriteMem32(0x003b2438,0x3c034255) --Zoom
eeObj.WriteMem32(0x0021b0f0,0x3c023ec0) --Y-Fov
eeObj.WriteMem32(0x003ca72c,0x3c024900) --Black Bar Fix

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )