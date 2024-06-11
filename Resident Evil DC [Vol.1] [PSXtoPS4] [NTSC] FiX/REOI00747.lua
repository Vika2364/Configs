-- Resident Evil: Director's Cut (SLUS-00747)
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

if (LEFT ~= 0 and L1 ~= 0) then

-- Infinite Health (Chris & Jill) (REDC ONLY)
R3K_WriteMem16(0x800C51AC,0x008C)
end
if (DOWN ~= 0 and L1 ~= 0) then

-- Infinite Health (Rebecca) (REDC ONLY)
R3K_WriteMem16(0x800C51AC,0x0058)
end
if (R3 ~= 0) then

-- Save Anywhere (Use after first save in Game) (REDC ONLY)
R3K_WriteMem16(0xD00CF844,0x0044)
R3K_WriteMem16(0x800C8456,0x0002)
R3K_WriteMem16(0x800343F2,0x2400)
R3K_WriteMem16(0x8003446E,0x2400)
end
if (L3 ~= 0) then

-- Infinite Ammo (All Weapons-Except FlameThrower) (REDC ONLY)
R3K_WriteMem16(0xD00418F8,0xFFFF)
R3K_WriteMem16(0x800418F8,0x0000)
end
end
EM_AddVsyncHook(patcher)
