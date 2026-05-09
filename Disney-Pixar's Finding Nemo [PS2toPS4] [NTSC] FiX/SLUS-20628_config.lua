-- Pixar Finding Nemo (NTSC-U) (SLUS-20628)
-- emu used=rogue v1

apiRequest(0.1)

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
--Widescreen hack 16:9
eeObj.WriteMem32(0x001157a4,0x080a5be8)
eeObj.WriteMem32(0x00296fa0,0x3c013f40)
eeObj.WriteMem32(0x00296fa4,0x4481f000)
eeObj.WriteMem32(0x00296fa8,0x461eb582)
eeObj.WriteMem32(0x00296fac,0x4600a807)
eeObj.WriteMem32(0x00296fb0,0x080455ea)
eeObj.WriteMem32(0x001157e8,0x3c013f2b) --3c013f00
end

end

emuObj.AddVsyncHook(CheckInputs)

local patch = function()

end

emuObj.AddVsyncHook(patch)