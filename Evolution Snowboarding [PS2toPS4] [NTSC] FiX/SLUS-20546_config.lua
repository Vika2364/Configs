--Evolution Snowboarding  SLUS-20546
--emu used=psychonauts v1

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

--Fix issues caused by PSS video playback.
--Extend stack to avoid sending bad data to VIF1.
--Required due to lack of data cache emulation.
 
eeObj.WriteMem32(0x00122780,0x27BDFD00)
eeObj.WriteMem32(0x00122AE8,0x27BD0300)

--no interlacing
eeObj.WriteMem32(0x20101d04,0x00000000) --64420008

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)