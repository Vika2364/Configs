-- JoJo no Kimyou na Bouken Ougon no Kaze SLPM_651.40
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
-- Infinite stamina gauge
eeObj.WriteMem32(0x20178748,0x86030122)
eeObj.WriteMem32(0x2017874C,0xA6030124)
eeObj.WriteMem32(0x20178754,0x10000005)
end
if (R3 ~= 0) then
-- Maximum spirit gauge
eeObj.WriteMem32(0x201787D0,0x84620122)
eeObj.WriteMem32(0x201787D4,0xA4620124)
eeObj.WriteMem32(0x201787DC,0x10000005)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x00124f64,0x3c023f22)
eeObj.WriteMem32(0x20361ae8,0x43f00000)
eeObj.WriteMem32(0x203d23c0,0x43700000)

end

emuObj.AddVsyncHook(patcher)