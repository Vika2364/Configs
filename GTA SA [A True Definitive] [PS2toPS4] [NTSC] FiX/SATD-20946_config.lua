-- Grand Theft Auto: San Andreas - A True Definitive (Hack)
-- emu used=JakX v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

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

if (UP ~= 0 and R1 ~= 0) then
-- Max Health
eeObj.WriteMem32(0x208021C0,0x44B00000)
end

if (DOWN ~= 0 and R1 ~= 0) then
-- Infinite Run
eeObj.WriteMem32(0x20709748,0x00000001)
end

if (LEFT ~= 0 and R1 ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x20134340,0x24420000)
end

if (RIGHT ~= 0 and R1 ~= 0) then
-- Have Max Money
eeObj.WriteMem32(0x207096B4,0x3B9AC9FF)
eeObj.WriteMem32(0x207096B8,0x3B9AC9FF)
end

if (LEFT ~= 0 and Select ~= 0) then
-- Max Wanted Level
eeObj.WriteMem32(0x2027BED8,0x00000000)
end

if (UP ~= 0 and L1 ~= 0) then
-- Weather Is Always Hot
eeObj.WriteMem32(0x2066BD24,0x00000000)
eeObj.WriteMem32(0x2066BD28,0x00000000)
eeObj.WriteMem32(0x2066BD2C,0x00000000)
end

if (UP ~= 0 and Select ~= 0) then
-- Weather Is Always Nice
eeObj.WriteMem32(0x2066BD24,0x00000001)
eeObj.WriteMem32(0x2066BD28,0x00000001)
eeObj.WriteMem32(0x2066BD2C,0x00000001)
end

if (DOWN ~= 0 and L1 ~= 0) then
-- Weather Is Always Hazy (Grey)
eeObj.WriteMem32(0x2066BD24,0x00000020)
eeObj.WriteMem32(0x2066BD28,0x00000020)
eeObj.WriteMem32(0x2066BD2C,0x00000020)
end

if (DOWN ~= 0 and Select ~= 0) then
-- Weather Is Always Hazy (Orange)
eeObj.WriteMem32(0x2066BD24,0x00000030)
eeObj.WriteMem32(0x2066BD28,0x00000030)
eeObj.WriteMem32(0x2066BD2C,0x00000030)
end

if (LEFT ~= 0 and L1 ~= 0) then
-- Weather Is Always Overcast
eeObj.WriteMem32(0x2066BD24,0x00000004)
eeObj.WriteMem32(0x2066BD28,0x00000004)
eeObj.WriteMem32(0x2066BD2C,0x00000004)
end

if (RIGHT ~= 0 and Select ~= 0) then
-- Weather Is Always Stormy
eeObj.WriteMem32(0x2066BD24,0x00000010)
eeObj.WriteMem32(0x2066BD28,0x00000010)
eeObj.WriteMem32(0x2066BD2C,0x00000010)
end

if (RIGHT ~= 0 and L1 ~= 0) then
-- Weather Is Always Foggy
eeObj.WriteMem32(0x2066BD24,0x00000009)
eeObj.WriteMem32(0x2066BD28,0x00000009)
eeObj.WriteMem32(0x2066BD2C,0x00000009)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Widescreen fix
eeObj.WriteMem32(0x001130BC,0x3C013F9D)
eeObj.WriteMem32(0x001130C0,0x44810000)
eeObj.WriteMem32(0x001130C4,0x46006302)
eeObj.WriteMem32(0x001130C8,0x03E00008)
eeObj.WriteMem32(0x001130CC,0xE78C9A90)
eeObj.WriteMem32(0x0021DF84,0x0C044C2F)
eeObj.WriteMem32(0x00242D54,0x0C044C32)

end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )