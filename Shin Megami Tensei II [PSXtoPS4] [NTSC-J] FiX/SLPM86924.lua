-- Shin Megami Tensei II [NTSC-J] [English Patched] (SLPM-86924)
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

if (R3 ~= 0) then

-- Infinite HP in battle
R3K_WriteMem16(0x801FC8B8,0x03E7)
R3K_WriteMem16(0x801FC8BA,0x03E7)
end
if (L3 ~= 0) then

-- Have 9999999 money
R3K_WriteMem16(0x801FC354,0x967F)
R3K_WriteMem16(0x801FC356,0x0098)
end
end
EM_AddVsyncHook(patcher)
