-- Gregory Horror Show (PAL)
-- Boot Fix by ??
-- emu used=destroy all humans 2

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
eeObj.WriteMem32(0x2014AE04,0x3C034548)
eeObj.WriteMem32(0x2014AE14,0xAC2305D0)
end
if (R3 ~= 0) then
-- Widescreen hack
eeObj.WriteMem32(0x20166000,0x3c023f40)
eeObj.WriteMem32(0x20166078,0x3c023f40)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


end

emuObj.AddVsyncHook(patcher)

--math.random() + math.random(1, 99)

-- Mask upper bits (irq?) (lw --> lh)
eeInsnReplace(0x1953f4, 0x8e050054, 0x86050054)