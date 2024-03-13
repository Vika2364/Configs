-- Casper [NTSC-U] (SLUS-00162)
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

-- Infinite Health
R3K_WriteMem16(0x8007F01C,0x0064)
R3K_WriteMem16(0x8007F02C,0x0064)
R3K_WriteMem16(0x800FBD80,0x0064)
end
if (L3 ~= 0) then

-- Brass Key
R3K_WriteMem16(0x8007EA28,0x0001)
end
if (R3 ~= 0) then

-- Iron Key
R3K_WriteMem16(0x8007EA2C,0x0001)
end
end
EM_AddVsyncHook(patcher)
