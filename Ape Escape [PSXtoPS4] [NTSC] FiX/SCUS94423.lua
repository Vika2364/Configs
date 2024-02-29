-- Ape Escape [NTSC-U] (SCUS-94423)
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

-- Widescreen 16:9 
R3K_WriteMem16(0x800AF0A0,0x0C00)
end
if (DOWN ~= 0 and R1 ~= 0) then

-- Infinite Lives 
R3K_WriteMem16(0x800F448C,0x0064)
end
if (DOWN ~= 0 and R3 ~= 0) then

-- Infinite Air
R3K_WriteMem16(0x800F4DC8,0x0258)
end
if (DOWN ~= 0 and L3 ~= 0) then

-- Infinite Health
R3K_WriteMem16(0x800EC2C8,0x0005)
end
end
EM_AddVsyncHook(patcher)
