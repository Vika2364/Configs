-- Grand Theft Auto Resident Evil (Mod)
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

if (LEFT ~= 0 and Select ~= 0) then
-- Never Wanted Level
eeObj.WriteMem32(0x2027BEA0,0x03E00008)
eeObj.WriteMem32(0x2027BEA4,0x00000000)
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


end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )