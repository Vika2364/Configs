-- The Great Escape [SLUS-20670] (U)
-- emu used=KOF 2000

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
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
-- Have Level Select
eeObj.WriteMem32(0x204EE0A0,0x00000001)
end
if (Select ~= 0 and UP ~= 0) then
-- Widescreen hack 16:9
eeObj.WriteMem32(0x002b89cc,0x3c013b01) --3c013acc
eeObj.WriteMem32(0x002b89d0,0x34210000) --3421cccd
eeObj.WriteMem32(0x002b8a54,0x3c013b35) --3c013b08
eeObj.WriteMem32(0x002b8a58,0x3421fe54) --34218889
eeObj.WriteMem32(0x002ca178,0x3c013d00) --3c013c8e
eeObj.WriteMem32(0x002ca17c,0x34210000) --3421fa36
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)