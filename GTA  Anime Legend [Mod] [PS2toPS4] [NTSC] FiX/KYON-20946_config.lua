-- Grand Theft Auto Anime Legend (Mod) (v2.2) (KYON-20946)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

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

if (DOWN ~= 0 and R1 ~= 0) then
-- Max Health
eeObj.WriteMem32(0x208021C0,0x44B00000)
end

if (LEFT ~= 0 and L1 ~= 0) then
-- Max Wanted Level
eeObj.WriteMem32(0x2027BED8,0x00000000)
end

if (UP ~= 0 and L1 ~= 0) then
-- Weather Is Always Hot
eeObj.WriteMem32(0x2066BD24,0x00000000)
eeObj.WriteMem32(0x2066BD28,0x00000000)
eeObj.WriteMem32(0x2066BD2C,0x00000000)
end

if (DOWN ~= 0 and L1 ~= 0) then
-- Weather Is Always Stormy
eeObj.WriteMem32(0x2066BD24,0x00000010)
eeObj.WriteMem32(0x2066BD28,0x00000010)
eeObj.WriteMem32(0x2066BD2C,0x00000010)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


end

emuObj.AddVsyncHook(patcher)