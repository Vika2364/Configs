-- Chippoke Ralph no Daibouken - The Adventure of Little Ralph [NTSC-J] [English Patched] (SLPS-01853)
-- emu used=Oddworld Abe's Oddysee v2

local patcher = function()
local pad_bits = EM_PadRead()

local UP = pad_bits & 0x0010
local DOWN = pad_bits & 0x0040
local LEFT = pad_bits & 0x0080
local RIGHT = pad_bits & 0x0020
local Triangle = pad_bits & 0x1000
local Cross = pad_bits & 0x4000
local Square = pad_bits & 0x8000
local Circle = pad_bits & 0x2000
local L1 = pad_bits & 0x0400
local L2 = pad_bits & 0x0100
local L3 = pad_bits & 0x0002
local R1 = pad_bits & 0x0800
local R2 = pad_bits & 0x0200
local R3 = pad_bits & 0x0004
local Select = pad_bits & 0x0001
local Start = pad_bits & 0x0008

if (UP ~= 0 and R1 ~= 0) then --arbitrarily assigned keys

-- Walk Through Enemies
R3K_WriteMem16(0x8018874E,0xFFFF)
end
if (LEFT ~= 0 and R1 ~= 0) then

-- 1-Hit Death
R3K_WriteMem16(0x8018874E,0x0001)
end
if (L3 ~= 0) then

-- Infinite Time
R3K_WriteMem16(0x800B9BF8,0x9999)
end
if (R3 ~= 0) then

-- Infinite energy
R3K_WriteMem16(0x800B9C18,0x0009)
end
end
EM_AddVsyncHook(patcher)
