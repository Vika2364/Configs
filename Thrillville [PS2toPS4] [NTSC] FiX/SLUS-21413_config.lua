--Thrillville (NTSC-U) (SLUS-21413)
--emu used=primal

apiRequest(1.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher   = function()
--FOV 
eeObj.WriteMem32(0x20CC5540, 0x3FE374BC)
--Increases Draw Distance
eeObj.WriteMem32(0x20CC5558, 0x3FC00000)
--HUD Scaling
eeObj.WriteMem32(0x20CC5544, 0x3F666666)
eeObj.WriteMem32(0x20CC5548, 0x3F866666)
eeObj.WriteMem32(0x20CC554C, 0x3F8374BC)
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } ) 