-- Digimon World 4 [SLES-53405] (E)
-- Patches/Codes Hacked By Maori-Jigglypuff [Savas Guercebe]
-- Widescreen hack by ElHecht
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
-- BITS Value not becoming Zero when Digimon is killed
eeObj.WriteMem32(0x004070fc,0x00000000)
end
if (R3 ~= 0) then
-- Max Bits
eeObj.WriteMem32(0x203d70ec,0x3C0605F5)
eeObj.WriteMem32(0x203d70f0,0xAC46000C)
end
if (Select ~= 0 and UP ~= 0) then
-- Infinite Item Use
eeObj.WriteMem32(0x203cf9d0,0x26030000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x001b6de8,0x3c013f40) --00000000 hor fov
eeObj.WriteMem32(0x001b6df0,0x4481f000) --00000000
eeObj.WriteMem32(0x001b6e58,0x461ebb03) --4600bb06
eeObj.WriteMem32(0x001b6e5c,0x46006347) --4600bb47

-- Disable Fog
eeObj.WriteMem32(0x001e8b5c,0x3C030000)

-- No Body Shadow of the Digimons on the Ground
eeObj.WriteMem32(0x001d5b14,0x3C020000)
eeObj.WriteMem32(0x001d5b10,0x44800800)

-- Enhance Digimons and World real Light
-- and disable their additional Lights
eeObj.WriteMem32(0x001f9650,0x10000026)
eeObj.WriteMem32(0x001f9724,0x64140000)
eeObj.WriteMem32(0x001f9728,0x1280000E)
eeObj.WriteMem32(0x001f9768,0x3c054360)
eeObj.WriteMem32(0x001f976c,0x3c070000)
eeObj.WriteMem32(0x001f9770,0x0005103c)
eeObj.WriteMem32(0x001f9774,0x00451025)
eeObj.WriteMem32(0x001f9778,0x0007383c)
eeObj.WriteMem32(0x001f977c,0x00e53825)
eeObj.WriteMem32(0x001f9780,0x70e26488)
eeObj.WriteMem32(0x001f9784,0x7ccc0000)
eeObj.WriteMem32(0x001f9868,0x64140000)
eeObj.WriteMem32(0x001f986c,0x1280000E)
eeObj.WriteMem32(0x001f98ac,0x3c050000)
eeObj.WriteMem32(0x001f98b0,0x3c074300)
eeObj.WriteMem32(0x001f98b4,0x0005103c)
eeObj.WriteMem32(0x001f98b8,0x00451025)
eeObj.WriteMem32(0x001f98bc,0x0007383c)
eeObj.WriteMem32(0x001f98c0,0x00e53825)
eeObj.WriteMem32(0x001f98c4,0x70e26488)
eeObj.WriteMem32(0x001f98c8,0x7e0c0000)
eeObj.WriteMem32(0x001f9900,0x64030000)
eeObj.WriteMem32(0x001f9b68,0x64030000)
eeObj.WriteMem32(0x001f9d8c,0x64030001)

end

emuObj.AddVsyncHook(patcher)