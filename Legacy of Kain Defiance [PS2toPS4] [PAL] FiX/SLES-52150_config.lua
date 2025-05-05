-- Legacy of Kain - Defiance (PAL)
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
-- Widescreen PAL
eeObj.WriteMem32(0x0011a644,0x00000000)
eeObj.WriteMem32(0x0028E8C0,0x00000001)
eeObj.WriteMem32(0x0013d458,0x3c013b30)
eeObj.WriteMem32(0x001522e0,0x3c01bf80) --top value
eeObj.WriteMem32(0x001522ec,0x3c013f80) --bottom value
eeObj.WriteMem32(0x00119a34,0x3c01c340) --top value
eeObj.WriteMem32(0x00119a50,0x3c014340) --bottom value
eeObj.WriteMem32(0x0013bcac,0x3c013f40) --hor value
eeObj.WriteMem32(0x0013bcd0,0xe4200d7c)
eeObj.WriteMem32(0x0013bcf8,0x46000003)
eeObj.WriteMem32(0x0013bcfc,0xe4200d6c)
eeObj.WriteMem32(0x0023d668,0x3c013b40) --hor value
eeObj.WriteMem32(0x00213588,0x24070156) --vertical aspect (int)
end
if (LEFT ~= 0 and R1 ~= 0) then
-- Big Character & Weapons
eeObj.WriteMem32(0x20727240,0x3FC00000)
eeObj.WriteMem32(0x20727244,0x3FC00000)
eeObj.WriteMem32(0x20727248,0x3FC00000)
eeObj.WriteMem32(0x20290240,0x3FC00000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patch = function()


end

emuObj.AddVsyncHook(patch)

-- Texture Flickering fix
eeInsnReplace(0x189340, 0x10600020, 0x10000020)