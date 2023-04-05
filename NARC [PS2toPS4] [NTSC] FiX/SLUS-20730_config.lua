-- NARC (SLUS20730)
-- Cheat for Bonus Game
-- JakX v2

apiRequest(1.0)

local eeObj  = getEEObject()
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

if (L1 ~= 0 and UP ~= 0) then
-- on
eeObj.WriteMem32(0x01E404C0,0x00000019)
end

if (L1 ~= 0 and DOWN ~= 0) then
-- off
eeObj.WriteMem32(0x01E404C0,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


end

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )  --> fix outlines

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )  --> fix outlines

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

emuObj.AddVsyncHook(patcher)