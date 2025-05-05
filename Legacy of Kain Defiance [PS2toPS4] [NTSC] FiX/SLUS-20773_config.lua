-- Legacy of Kain - Defiance (NTSC)
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
-- Widescreen NTSC
eeObj.WriteMem32(0x0011a33c,0x00000000)
eeObj.WriteMem32(0x0028cfe0,0x00000001)
eeObj.WriteMem32(0x0013d108,0x3c013b30)
eeObj.WriteMem32(0x00151ef8,0x3c01bf80) --top value
eeObj.WriteMem32(0x00151f04,0x3c013f80) --bottom value
eeObj.WriteMem32(0x0011972c,0x3c01c340) --top value
eeObj.WriteMem32(0x00119748,0x3c014340) --bottom value
eeObj.WriteMem32(0x0013ba0c,0x3c013f40) --hor value
eeObj.WriteMem32(0x0013ba38,0xe422f400)
eeObj.WriteMem32(0x0013ba68,0x46021083)
eeObj.WriteMem32(0x0013ba6c,0xe422f3ec)
eeObj.WriteMem32(0x0023be84,0x3c013b40) --hor value
eeObj.WriteMem32(0x00212f2c,0x24070140)
end
if (LEFT ~= 0 and R1 ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x201FB01C,0x3C014810)
eeObj.WriteMem32(0x201FB020,0x34218800)
eeObj.WriteMem32(0x201FB024,0x44810000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patch = function()


end

emuObj.AddVsyncHook(patch)

-- Texture Flickering fix
eeInsnReplace(0x188F50, 0x10600020, 0x10000020)