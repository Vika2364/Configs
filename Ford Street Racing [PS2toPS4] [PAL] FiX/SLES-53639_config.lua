--Ford Street Racing (PAL-E) (SLES-53639)
--emu used=primal

apiRequest(1.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

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
-- Fix for ingame Widescreen
eeObj.WriteMem32(0x00318298,0x3CAEFA34) --3c8efa34 fov
end
if (R3 ~= 0) then
-- Max Cash
eeObj.WriteMem32(0x202495EC,0x0803FFC0)
eeObj.WriteMem32(0x200FFF00,0x3C0205F0)
eeObj.WriteMem32(0x200FFF04,0xAC620050)
eeObj.WriteMem32(0x200FFF08,0x03E00008)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher   = function()

end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) 
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )