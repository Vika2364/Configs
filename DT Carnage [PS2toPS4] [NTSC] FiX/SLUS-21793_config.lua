-- DT Carnage (NTSC)
-- emu used=kofos

apiRequest(0.1)


local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()
local iopObj        = getIOPObject()


gsObj.SetUpscaleMode("EdgeSmooth")
gsObj.SetUprenderMode("2x2")
gsObj.SetL2HMode(true)

emuObj.PadSetLightBar(0, 255, 5, 2)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

local WS = function()

--disable Mipmap(PS3 config)
eeObj.WriteMem32(0x002c2970,0xafa00034)
eeObj.WriteMem32(0x00132d80,0x03e00008)
eeObj.WriteMem32(0x00132d84,0)
eeObj.WriteMem32(0x00133b10,0x03e00008)
eeObj.WriteMem32(0x00133b14,0)
eeObj.WriteMem32(0x00134ae0,0x03e00008)
eeObj.WriteMem32(0x00134ae4,0)

end

emuObj.AddVsyncHook(WS)