--Disney Pixar - Up [SLUS 21864] (U)
--HW Patch by Kozarrov
--jak v2

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

--Fixes invisible text
eeObj.WriteMem32(0x004012FC,0x46021002) 

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )