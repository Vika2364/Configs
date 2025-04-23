--gametitle=Devil May Cry 3 [Trial Version](SLPM_60251)
--comment=Patches/Codes Hacked By Maori-Jigglypuff [Savas Guercebe]
--Jak v2

apiRequest(2.0)

local gpr = require("ee-gpr-alias")

local emuObj         = getEmuObject()
local eeObj            = getEEObject()

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

if (R1 ~= 0 and Select ~= 0) then
-- Infinite maxed out Health
eeObj.WriteMem32(0x0027d848,0xC6022AFC)
eeObj.WriteMem32(0x0027d854,0xE6022B18)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patch = function()


end
emuObj.AddVsyncHook(patch)