-- The Italian Job NTSC
-- Cheats by Madcatz
-- Fix ported from PS3CONFIG
-- emu used=jakx v2

apiRequest(1.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

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
-- Unlock All Bonus Content and Cars
eeObj.WriteMem32(0x202A6794,0x00000001)
eeObj.WriteMem32(0x202DC88C,0x00000001)
eeObj.WriteMem32(0x202DC888,0x00000001)
eeObj.WriteMem32(0x202DC890,0x00000001)
eeObj.WriteMem32(0x202DC87C,0x00000001)
eeObj.WriteMem32(0x202DC884,0x00000001)
eeObj.WriteMem32(0x202DC880,0x00000001)
eeObj.WriteMem32(0x202DC878,0x00000001)
eeObj.WriteMem32(0x202DC89C,0x00000001)
eeObj.WriteMem32(0x202DC8A0,0x00000001)
eeObj.WriteMem32(0x202DC894,0x00000001)
eeObj.WriteMem32(0x202DC898,0x00000001)
eeObj.WriteMem32(0x202DC8B4,0x00000001)
eeObj.WriteMem32(0x202DC8C8,0x00000001)
eeObj.WriteMem32(0x202DC8BC,0x00000001)
eeObj.WriteMem32(0x202DC8B0,0x00000001)
eeObj.WriteMem32(0x202DC8B8,0x00000001)
eeObj.WriteMem32(0x202DC8A4,0x00000001)
eeObj.WriteMem32(0x202DC8AC,0x00000001)
eeObj.WriteMem32(0x202DC8C0,0x00000001)
eeObj.WriteMem32(0x202DC8C4,0x00000001)
eeObj.WriteMem32(0x202DC8A8,0x00000001)
end
if (R3 ~= 0) then
-- Infinite Time
eeObj.WriteMem32(0x2013BE4C,0x00000000)
eeObj.WriteMem32(0x20142904,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

eeInsnReplace(0x00168938, 0x0c0985a8, 0x00000000) -- fix for title screen freeze