-- Superman Shadow of Apokolips (NTSC)
-- emu used=jakx v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local iopObj  = getIOPObject()

emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

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
-- 60 fps
eeObj.WriteMem32(0x2032D1E8,0x00000001)
end
if (R3 ~= 0) then
-- Infinite Health & Super Powers
eeObj.WriteMem32(0x200C0220,0x3C01447A)
eeObj.WriteMem32(0x200C0224,0xAC610034)
eeObj.WriteMem32(0x200C0228,0x03E00008)
eeObj.WriteMem32(0x200C022C,0xC4610034)
eeObj.WriteMem32(0x202CC3CC,0x0C030088)
eeObj.WriteMem32(0x200C0230,0x3C014348)
eeObj.WriteMem32(0x200C0234,0xACA10030)
eeObj.WriteMem32(0x200C0238,0x080586B6)
eeObj.WriteMem32(0x200C023C,0x00431024)
eeObj.WriteMem32(0x20161AD0,0x0803008C)
eeObj.WriteMem32(0x20161AD4,0x8C820044)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
-- Unlock All Of The Levels (Level Attack Mode)
eeObj.WriteMem32(0x202D4CA0,0x24030001)
-- Unlock All Of The Movies
eeObj.WriteMem32(0x202D6C2C,0x24030001)
-- Unlock All Biographies
eeObj.WriteMem32(0x20335694,0x00000001)
-- Unlock Concept Art Movie
eeObj.WriteMem32(0x203356A0,0x00000001)

eeObj.Vu1MpgCycles(800)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)