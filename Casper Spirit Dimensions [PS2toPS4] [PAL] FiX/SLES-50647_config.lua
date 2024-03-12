-- Casper: Spirit Dimensions (PAL)
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

if (Select ~= 0 and R1 ~= 0) then
--Widescreen hack 16:9
--X-Fov
--680080c4 03100046
eeObj.WriteMem32(0x00345618,0x081034f0)
eeObj.WriteMem32(0x0040d3c0,0xc4800068)
eeObj.WriteMem32(0x0040d3c4,0x3c013f40)
eeObj.WriteMem32(0x0040d3c8,0x4481f000)
eeObj.WriteMem32(0x0040d3cc,0x461e0003)
eeObj.WriteMem32(0x0040d3d0,0xe4800068)
eeObj.WriteMem32(0x0040d3d4,0x080d1587)
end

end

emuObj.AddVsyncHook(CheckInputs)


local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)