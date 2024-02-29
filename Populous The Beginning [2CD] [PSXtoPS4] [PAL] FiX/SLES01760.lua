-- Populous The Beginning [PAL-E] (SLES-01760)
-- emu used=syphonfilter 3

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

-- All Spells
R3K_WriteMem16(0x301DC2E3,0x0004)
R3K_WriteMem16(0x801DC2E4,0x0403)
R3K_WriteMem16(0x801DC2E6,0x0304)
R3K_WriteMem16(0x301DC2E8,0x0002)
R3K_WriteMem16(0x801DC2EA,0x0302)
R3K_WriteMem16(0x801DC2EC,0x0174)
R3K_WriteMem16(0x801DC2EE,0x0301)
R3K_WriteMem16(0x801DC2F0,0x0401)
R3K_WriteMem16(0x801DC2F2,0x0404)
R3K_WriteMem16(0x301DC2F4,0x0044)
end
if (DOWN ~= 0 and R1 ~= 0) then

-- Have All Build Options
R3K_WriteMem16(0x801DC2D0,0xFFFF)
end
if (R3 ~= 0) then

-- Infinite time
R3K_WriteMem16(0x801E5F90,0xFFFF)
end
if (L3 ~= 0) then

-- All Levels Selectable
R3K_WriteMem16(0x800D850C,0x0019)
end
end
EM_AddVsyncHook(patcher)
