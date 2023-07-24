--Thrillville Off the Rails (NTSC-U) (SLUS-21611)
--emu used=primal

apiRequest(1.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher   = function()

--Widescreen hack 16:9

--Zoom
--003f013c 00608144 000099c4
eeObj.WriteMem32(0x00410548,0x3c013f20) --3c013f00

--Y-Fov
--4040013c 00008144 803e013c 00088144 02a00046(2nd) 
eeObj.WriteMem32(0x004105dc,0x3c014080) --3c014040

--Frame rate FiX
eeObj.WriteMem32(0x00421300,0x100000B7)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } ) 