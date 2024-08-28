-- Def Jam Vendetta NTSC
-- JakX v2

apiRequest(2.2)

local gpr    		= require("ee-gpr-alias")

local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()
local eeOverlay 	= eeObj.getOverlayObject()
local iopObj        = getIOPObject()
    
emuObj.PadSetLightBar(0, 101,57,200)
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)

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

if (L3 ~= 0) then
-- Unlock All Characters
eeObj.WriteMem32(0x201570E0,0x24030001)
eeObj.WriteMem32(0x201570E4,0xA0430000)
end
if (R3 ~= 0) then
-- Infinite Health Player 1
eeObj.WriteMem32(0x202301B0,0x43FA0000)
eeObj.WriteMem32(0x202301B4,0x43FA0000)
eeObj.WriteMem32(0x202301B8,0x43FA0000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local Mods = function()
--16:9
eeObj.WriteMem32(0x001a17b4,0x3c013f10) 
eeObj.WriteMem32(0x00197bbc,0x3c013f22)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(Mods)
