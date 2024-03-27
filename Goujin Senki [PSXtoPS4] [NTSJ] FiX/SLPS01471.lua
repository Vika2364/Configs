-- Goujin Senki [NTSC-J] [English Patched] (SLPS-01471)
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

-- All Character's Level 99
R3K_WriteMem16(0x8017888E,0x6363)
R3K_WriteMem16(0x801788AC,0x6363)
R3K_WriteMem16(0x801788CA,0x6363)
R3K_WriteMem16(0x801788E8,0x6363)
R3K_WriteMem16(0x80178906,0x6363)
R3K_WriteMem16(0x80178924,0x6363)
R3K_WriteMem16(0x80178942,0x6363)
R3K_WriteMem16(0x80178960,0x6363)
R3K_WriteMem16(0x8017897E,0x6363)
R3K_WriteMem16(0x8017899C,0x6363)
R3K_WriteMem16(0x801789BA,0x6363)
R3K_WriteMem16(0x801789D8,0x6363)
end
if (UP ~= 0 and L1 ~= 0) then

-- All Character's HP 999
R3K_WriteMem16(0x80177F06,0x03E7)
R3K_WriteMem16(0x80177F32,0x03E7)
R3K_WriteMem16(0x80177F5E,0x03E7)
R3K_WriteMem16(0x80177F8A,0x03E7)
R3K_WriteMem16(0x80177FB6,0x03E7)
R3K_WriteMem16(0x80177FE2,0x03E7)
R3K_WriteMem16(0x8017800E,0x03E7)
R3K_WriteMem16(0x8017803A,0x03E7)
R3K_WriteMem16(0x80178066,0x03E7)
R3K_WriteMem16(0x80178092,0x03E7)
R3K_WriteMem16(0x801780BE,0x03E7)
R3K_WriteMem16(0x801780EA,0x03E7)
end
if (L3 ~= 0) then

-- Infinite Money
R3K_WriteMem16(0x80178D48,0x967F)
R3K_WriteMem16(0x80178D4A,0x0098)
end
if (R3 ~= 0) then

-- Infinite HP-12 Character
R3K_WriteMem16(0x80177F04,0x03E7)
R3K_WriteMem16(0x80177F30,0x03E7)
R3K_WriteMem16(0x80177F5C,0x03E7)
R3K_WriteMem16(0x80177F88,0x03E7)
R3K_WriteMem16(0x80177FB4,0x03E7)
R3K_WriteMem16(0x80177FE0,0x03E7)
R3K_WriteMem16(0x8017800C,0x03E7)
R3K_WriteMem16(0x80178038,0x03E7)
R3K_WriteMem16(0x80178064,0x03E7)
R3K_WriteMem16(0x80178090,0x03E7)
R3K_WriteMem16(0x801780BC,0x03E7)
R3K_WriteMem16(0x801780E8,0x03E7)
end
end
EM_AddVsyncHook(patcher)
