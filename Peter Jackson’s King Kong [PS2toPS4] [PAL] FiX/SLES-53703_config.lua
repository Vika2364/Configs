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

local CheckInputs = function()

local pad_bits = emuObj.GetPad()

local UP    = pad_bits &  0x0010
local DOWN    = pad_bits &  0x0040
local LEFT    = pad_bits &  0x0080
local RIGHT    = pad_bits &  0x0020
local Triangle  = pad_bits &  0x1000
local Cross    = pad_bits &  0x4000
local Square    = pad_bits &  0x8000
local Circle  = pad_bits &  0x2000
local L1    = pad_bits &  0x0400
local L2    = pad_bits &  0x0100
local L3    = pad_bits &  0x0002
local R1    = pad_bits &  0x0800
local R2    = pad_bits &  0x0200
local R3    = pad_bits &  0x0004
local Select  = pad_bits &  0x0001
local Start    = pad_bits &  0x0008

if (LEFT ~= 0 and L1 ~= 0) then
-- Infinite ammo gun
eeObj.WriteMem32(0x00DACF00,0x00000064)
end

end

emuObj.AddVsyncHook(CheckInputs)

local WS = function()
--16:9
--Zoom
eeObj.WriteMem32(0x00127ac4,0x3c033f40) --3c033f80
--Y-Fov
eeObj.WriteMem32(0x00134e68,0x3c033fe3) --3c033faa 4/3 Black Bands Screen Mode
eeObj.WriteMem32(0x00134e70,0x3c033fe3) --3c033faa 4/3 Screen Mode
--Render fix
eeObj.WriteMem32(0x001529e0,0x3c023f40) --3c023f00
--All Levels
eeObj.WriteMem32(0x00DAE4D4,0x0000002A)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )