-- Killer 7 SLUS_211.54
-- Jak v2

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

if (L3 ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x20207174,0x00000000)
end
if (LEFT ~= 0 and Select ~= 0) then
-- All Characters Available
eeObj.WriteMem32(0x2061C870,0x00000FFF)
eeObj.WriteMem32(0x2061C874,0x0000FFFF)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Team Members Always Alive
eeObj.WriteMem32(0x2061C868,0x00000000)
eeObj.WriteMem32(0x2061C86C,0xFFFFFFFF)
end
if (R3 ~= 0) then
-- Max Serum
eeObj.WriteMem32(0x2067FD96,0x0000270F)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x20DB5688,0x3FE38E38)

end

emuObj.AddVsyncHook(patcher)