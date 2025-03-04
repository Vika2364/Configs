-- Peter Jacksons King Kong The Official Game of the Movie (PAL)
-- emu used=red faction 2

apiRequest(1.7)

local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()
local iopObj        = getIOPObject()

gsObj.SetL2HMode(true)
gsObj.SetUpscaleMode("EdgeSmooth")
gsObj.SetUprenderMode("2x2")

--emuObj.ForceRefreshRate(60)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

local WS = function()
--16:9
--Zoom
eeObj.WriteMem32(0x00127A84,0x3c033f40) --3c033f80
--Y-Fov
eeObj.WriteMem32(0x00134E28,0x3c033fe3) --3c033faa 4/3 Black Bands Screen Mode
eeObj.WriteMem32(0x00134E30,0x3c033fe3) --3c033faa 4/3 Screen Mode
--Render fix
eeObj.WriteMem32(0x001529A0,0x3c023f40) --3c023f00

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )