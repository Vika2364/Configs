-- Whiplash [SLES-51958] (E)
-- Widescreen hack by El Patas
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
-- Infinite Health
eeObj.WriteMem32(0x201727D0,0x00000000)
end
if (R3 ~= 0) then
-- Various Stuff (Hypersnacks,Mouses,Keys,Level Maps)
eeObj.WriteMem32(0x208F43AC,0x43000000)
eeObj.WriteMem32(0x208F45AC,0x00000063)
eeObj.WriteMem32(0x208F451C,0x00000063)
eeObj.WriteMem32(0x208F4394,0x00000002)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Gameplay 16:9
eeObj.WriteMem32(0x002C3B40,0x3C013FE3) -- 3C013FAA (Increases hor. axis)
eeObj.WriteMem32(0x002C3B44,0x34219FA5) -- 34219FBE

end

emuObj.AddVsyncHook(patcher)