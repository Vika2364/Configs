-- The Simpsons - Road Rage (U)(SLUS-20305)
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

if (UP ~= 0 and R1 ~= 0) then
-- Widescreen hack 16:9
eeObj.WriteMem32(0x001A1144,0x3c013fc0) --3c013f9c
eeObj.WriteMem32(0x001A1148,0x34214000) --342161ab
eeObj.WriteMem32(0x001A1154,0x3c013fe3) --3c013faa
eeObj.WriteMem32(0x001A1158,0x34218e39) --3421aaab
eeObj.WriteMem32(0x001A1110,0x3c013fbb) --3c013f97
eeObj.WriteMem32(0x001A1114,0x34218000) --3421e9d9
eeObj.WriteMem32(0x00157B8C,0x3c014063) --3c01402a
eeObj.WriteMem32(0x00157B90,0x34218e39) --3421aaab
eeObj.WriteMem32(0x001C0F14,0x3c013f7f) --3c013f80
end
if (DOWN ~= 0 and R1 ~= 0) then
-- Max Money
eeObj.WriteMem32(0x2032085C,0x000F423F)
eeObj.WriteMem32(0x2032ECF0,0x000F423F)
end
if (L3 ~= 0) then
-- Have All Characters
eeObj.WriteMem32(0x20320988,0x00000001)
eeObj.WriteMem32(0x2032098C,0x00000001)
eeObj.WriteMem32(0x20320998,0x00000001)
eeObj.WriteMem32(0x2032099C,0x00000001)
eeObj.WriteMem32(0x20320984,0x00000001)
eeObj.WriteMem32(0x20320990,0x00000001)
eeObj.WriteMem32(0x203209A0,0x00000001)
eeObj.WriteMem32(0x20320994,0x00000001)
eeObj.WriteMem32(0x203209AC,0x00000001)
eeObj.WriteMem32(0x203209A4,0x00000001)
eeObj.WriteMem32(0x203209A8,0x00000001)
eeObj.WriteMem32(0x20320980,0x00000001)
end
if (R3 ~= 0) then
-- Unlock All Missions (Mission Mode)
eeObj.WriteMem32(0x20320908,0x0000000A)
end

end

emuObj.AddVsyncHook(CheckInputs)

local fix = function()

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(fix)