-- Nightshade (SLUS-20810)(US)(RUS)(UnDUB)
-- Widescreen + Graphical bugs FiX
-- emu used=Jak v2

apiRequest(1.0)

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
-- Infinite Health
eeObj.WriteMem32(0x201BE2B4,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x00183124,0x3c023f24)
eeObj.WriteMem32(0x00183128,0x34428b44)
eeObj.WriteMem32(0x0018314c,0x3c023f40)
eeObj.WriteMem32(0x00183100,0x3c014280)
eeObj.WriteMem32(0x0018310c,0x44815800)
eeObj.WriteMem32(0x002e1b40,0xe48b0070)

-- No-interlacing
eeObj.WriteMem32(0x2039C03C,0x00000000)

-- Disable the fade-in effect to fix framerate drops caused by excessive enemies
eeObj.WriteMem32(0x1d1048,0x1000000f)

-- Disable shadows to fix square bugs around characters
eeObj.WriteMem32(0x322060,0x03e00008)
eeObj.WriteMem32(0x322064,0x00000000)

-- Disable haze effect to fix charged attack frame rate drop
eeObj.WriteMem32(0x30f3f4,0x0000000)

end

emuObj.AddVsyncHook(patcher)