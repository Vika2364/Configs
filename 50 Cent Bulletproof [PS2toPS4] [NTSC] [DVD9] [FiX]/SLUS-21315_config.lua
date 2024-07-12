-- 50 Cent - Bulletproof (U)(SLUS-21315)
-- emu used=Star Ocean v2

apiRequest(0.1)

local emuObj         = getEmuObject()
local eeObj            = getEEObject()

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
-- 60 FPS by asasega (4th)
eeObj.WriteMem32(0x001B3B98,0x3C014270)
end
if (R3 ~= 0) then
-- Have All Cheats
eeObj.WriteMem32(0x204FB1A0,0x01010101)
eeObj.WriteMem32(0x204FB1A4,0x01010101)
end

end

emuObj.AddVsyncHook(CheckInputs)

local fix = function()

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(fix)