-- Megaman Legends [NTSC-U] (SLUS-00603)
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

if (L3 ~= 0) then --arbitrarily assigned keys

-- Widescreen 16:9
R3K_WriteMem16(0x80038058,0x2082)
R3K_WriteMem16(0x8003805A,0x0800)
R3K_WriteMem16(0x80008208,0x00C0)
R3K_WriteMem16(0x8000820A,0x8485)
R3K_WriteMem16(0x8000820C,0x0000)
R3K_WriteMem16(0x8000820E,0x0000)
R3K_WriteMem16(0x80008210,0xD883)
R3K_WriteMem16(0x80008212,0x0005)
R3K_WriteMem16(0x80008214,0x2843)
R3K_WriteMem16(0x80008216,0x0005)
R3K_WriteMem16(0x80008218,0x2821)
R3K_WriteMem16(0x8000821A,0x00BB)
R3K_WriteMem16(0x8000821C,0x00C0)
R3K_WriteMem16(0x8000821E,0xA485)
R3K_WriteMem16(0x80008220,0x00CC)
R3K_WriteMem16(0x80008222,0x8485)
R3K_WriteMem16(0x80008224,0x0000)
R3K_WriteMem16(0x80008226,0x0000)
R3K_WriteMem16(0x80008228,0xD883)
R3K_WriteMem16(0x8000822A,0x0005)
R3K_WriteMem16(0x8000822C,0x2843)
R3K_WriteMem16(0x8000822E,0x0005)
R3K_WriteMem16(0x80008230,0x2821)
R3K_WriteMem16(0x80008232,0x00BB)
R3K_WriteMem16(0x80008234,0x00CC)
R3K_WriteMem16(0x80008236,0xA485)
R3K_WriteMem16(0x80008238,0x00C0)
R3K_WriteMem16(0x8000823A,0x2484)
R3K_WriteMem16(0x8000823C,0xE018)
R3K_WriteMem16(0x8000823E,0x0800)
R3K_WriteMem16(0x80008240,0x1F80)
R3K_WriteMem16(0x80008242,0x3C05)
end
if (UP ~= 0 and R1 ~= 0) then

-- Infinite Money Zenny 999999
R3K_WriteMem16(0x800C1B2C,0x869F)
R3K_WriteMem16(0x800C1B2E,0x0001)
end
if (R3 ~= 0) then

-- Infinite Energy
R3K_WriteMem16(0x800B521E,0x00C4)
end
end
EM_AddVsyncHook(patcher)
