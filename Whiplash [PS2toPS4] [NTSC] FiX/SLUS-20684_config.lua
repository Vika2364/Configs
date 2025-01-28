-- Whiplash [SLUS-20684] (U)
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
-- Max & Infinite Health
eeObj.WriteMem32(0x20868DE4,0x42DC0000)
eeObj.WriteMem32(0x20868DE8,0x42DC0000)
end
if (R3 ~= 0) then
-- Infinite Hypersnacks Reserve Points
eeObj.WriteMem32(0x20868C7C,0x461C3C00)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x002c3768,0x3c013fe3)
eeObj.WriteMem32(0x002c376c,0x34217fa5)

end

emuObj.AddVsyncHook(patcher)