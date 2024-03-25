-- Crash Team Racing [NTSC-U] (SCUS-94426)
-- emu used=The Legend of Dragoon

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

-- Unlock Everything (Characters And Tracks)
R3K_WriteMem16(0x50000302,0x0000)
R3K_WriteMem16(0x8008E6EC,0xFFFF)
end
if (L3 ~= 0) then

-- Freezes Clock In All Timed Races
R3K_WriteMem16(0x80098830,0x0000)
end
if (UP ~= 0 and L1 ~= 0) then

-- Widescreen 16:9
R3K_WriteMem16(0x8002305C,0x0C00)
R3K_WriteMem16(0x8002305E,0x2404)
R3K_WriteMem16(0x800230C6,0x000E)
R3K_WriteMem16(0x800230A0,0x7300)
R3K_WriteMem16(0x800230A2,0x0003)
R3K_WriteMem16(0x80022608,0x2080)
R3K_WriteMem16(0x8002260A,0x0800)
R3K_WriteMem16(0x8002260C,0x0000)
R3K_WriteMem16(0x8002260E,0x8451)
R3K_WriteMem16(0x80008200,0x0003)
R3K_WriteMem16(0x80008202,0x241B)
R3K_WriteMem16(0x80008204,0x0019)
R3K_WriteMem16(0x80008206,0x0371)
R3K_WriteMem16(0x80008208,0x8812)
R3K_WriteMem16(0x8000820A,0x0000)
R3K_WriteMem16(0x8000820C,0x8883)
R3K_WriteMem16(0x8000820E,0x0011)
R3K_WriteMem16(0x80008210,0x8984)
R3K_WriteMem16(0x80008212,0x0800)
R3K_WriteMem16(0x80008214,0x003A)
R3K_WriteMem16(0x80008216,0x2442)
R3K_WriteMem16(0x8006C2F8,0x0C00)
R3K_WriteMem16(0x80043168,0x0400)
R3K_WriteMem16(0x8004316A,0x2404)
end
end
EM_AddVsyncHook(patcher)
