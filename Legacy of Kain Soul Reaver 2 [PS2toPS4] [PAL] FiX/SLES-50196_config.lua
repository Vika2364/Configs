-- Soul Reaver 2 (SLES_50196)
-- emu used=Default PS2 Emu

apiRequest(0.1)

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

if (L3 ~= 0) then
-- Remove mipmapping PAL
eeObj.WriteMem32(0x002A1F80,0x00000000)
end
if (R3 ~= 0) then
-- Mega Health
eeObj.WriteMem32(0x001c4b80,0x8c8705c8)
eeObj.WriteMem32(0x001c4bb0,0xac8705c8)
eeObj.WriteMem32(0x001c5008,0x64020000)
eeObj.WriteMem32(0x001c5020,0x10000037)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--Widescreen hack 16:9

--built in widescreen
eeObj.WriteMem32(0x20240C20,0x00000001)
eeObj.WriteMem32(0x00170c8c,0x3c013f80)
eeObj.WriteMem32(0x00170c90,0x00000000)
eeObj.WriteMem32(0x00170cc8,0x00000000)

--both fov+
eeObj.WriteMem32(0x00113f54,0x3c0143c0)
eeObj.WriteMem32(0x00114a70,0x3c0143c0)

--cutscenes black border fix
eeObj.WriteMem32(0x0013e264,0x3c01bf80) --top value
eeObj.WriteMem32(0x0013e26c,0x3c013f80) --bottom value

--render fix
eeObj.WriteMem32(0x0011339c,0x3c013f40)

--FMV's fix
eeObj.WriteMem32(0x001d4610,0x24097560)
eeObj.WriteMem32(0x001d4618,0x240b1550)

-- Remove Interlacing
eeObj.WriteMem32(0x201A9598,0x30420000) -- 30420001
eeObj.WriteMem32(0x00201BB4,0x00000000) -- 64420008
--eeObj.WriteMem32(0x03223EDC,0x00000000) -- ?

end

emuObj.AddVsyncHook(patcher)