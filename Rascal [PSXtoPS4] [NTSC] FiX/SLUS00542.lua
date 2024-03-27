-- Rascal [NTSC-U] (SLUS-00542)
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

if (UP ~= 0 and L1 ~= 0) then --arbitrarily assigned keys

-- Infinite Green Weapon Energy
R3K_WriteMem16(0x8009AF0E,0x0024)
end
if (DOWN ~= 0 and L1 ~= 0) then

-- Always Have Red Homing Gun With Infinite Ammo
R3K_WriteMem16(0x8009AC0C,0x0006)
end
if (LEFT ~= 0 and L1 ~= 0) then

-- Infinite Oxygen
R3K_WriteMem16(0x8009B030,0x0EF3)
end
if (LEFT ~= 0 and L2 ~= 0) then

-- Have All Keys (Red)
R3K_WriteMem16(0x801BE972,0x0001)
end
if (RIGHT ~= 0 and L2 ~= 0) then

-- Have All Keys (Blue)
R3K_WriteMem16(0x801BE95A,0x0001)
end
if (RIGHT ~= 0 and L1 ~= 0) then

-- Have All Keys (Yellow)
R3K_WriteMem16(0x801BE98A,0x0001)
end
if (R3 ~= 0) then

-- Infinite Lives
R3K_WriteMem16(0x8009AEB4,0x0003)
end
if (L3 ~= 0) then

-- Infinite Health
R3K_WriteMem16(0x8009B162,0x001F)
end
end
EM_AddVsyncHook(patcher)
