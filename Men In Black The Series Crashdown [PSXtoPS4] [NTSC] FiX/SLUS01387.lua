-- Men In Black - The Series - Crashdown [NTSC-U] (SLUS-01387)
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

-- Have All Levels
R3K_WriteMem16(0x800955EC,0xFFFF)
R3K_WriteMem16(0x800955EE,0xFFFF)
end
if (L3 ~= 0) then

-- Infinite Ammo
R3K_WriteMem16(0x80044886,0x2400)
end
if (R3 ~= 0) then

-- Infinite Health
R3K_WriteMem16(0x800EFF5C,0x0064)
end
end
EM_AddVsyncHook(patcher)
