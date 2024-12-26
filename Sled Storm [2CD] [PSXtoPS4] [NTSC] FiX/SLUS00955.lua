-- Sled Storm [NTSC-U] (SLUS-00955)
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

if (L3 ~= 0) then

-- Infinite money
R3K_WriteMem16(0x800BFFA0,0xFFFF)
end
if (R3 ~= 0) then

-- Stop Timer
R3K_WriteMem16(0x800D8AD0,0x0000)
end
-- Widescreen
R3K_WriteMem16(0x800E0128,0x1333)
end
EM_AddVsyncHook(patcher)
