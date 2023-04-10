--Blade 2 NTSC
--emu used=KOF 98

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

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

if (L1 ~= 0 and UP ~= 0) then
-- on
eeObj.WriteMem32(0x00154BD8,0x00000000)
end

if (L1 ~= 0 and DOWN ~= 0) then
-- off
eeObj.WriteMem32(0x00154BD8,0x1440FF8D)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
--Widescreen
eeObj.WriteMem32(0x0018B6B8,0x3C033F40)
eeObj.WriteMem32(0x0017e7d4,0x3c033f40)
--Unlock Missions
eeObj.WriteMem32(0x0075BD6E,0x00000013)
--Unlock Weapons
eeObj.WriteMem32(0x0048C572,0x00000001)

end

emuObj.AddVsyncHook(patcher)