-- Indiana Jones and the Emperor's Tomb NTSC
-- JakX v2

local gpr = require("ee-gpr-alias")

apiRequest(2.0)

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

if (Select ~= 0 and R1 ~= 0) then
--Access All Levels
eeObj.WriteMem32(0x200C0240,0x24020042)
eeObj.WriteMem32(0x200C0244,0x03E00008)
eeObj.WriteMem32(0x200C0248,0xAE420474)
eeObj.WriteMem32(0x2033FA48,0x0C030090)
end

if (Select ~= 0 and UP ~= 0) then
--16:9
eeObj.WriteMem32(0x0011b9cc,0x3c013f20)
eeObj.WriteMem32(0x002F5178,0x3C023F40)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

end

emuObj.AddVsyncHook(patcher)