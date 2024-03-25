-- 40 Winks [PAL-E] [NTSC-U] (SLUS-00874) (SLES-01937/41)
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

-- Infinite Air (US)
R3K_WriteMem16(0x8002B8CE,0x2400)
end
if (DOWN ~= 0 and R1 ~= 0) then

-- Infinite Costume Time (US)
R3K_WriteMem16(0x8002C452,0x2400)
end
if (R3 ~= 0) then

-- Infinite Lives (US)
R3K_WriteMem16(0x80013352,0x2400)
end
if (L3 ~= 0) then

-- Infinite Zzz's (US)
R3K_WriteMem16(0x8001326E,0x2400)
end
if (R3 ~= 0) then

-- Infinite Lives (RU)
R3K_WriteMem16(0x800B0592,0x0003)
end
if (L3 ~= 0) then

-- Infinite Zzz's (RU)
R3K_WriteMem16(0x800B0590,0x0063)
end
if (R3 ~= 0) then

-- Infinite Lives (ES)
R3K_WriteMem16(0x800B4BAE,0x0063)
R3K_WriteMem16(0x800B4BC4,0x0063)
end
if (L3 ~= 0) then

-- Infinite Zzz's (ES)
R3K_WriteMem16(0x800B4BAC,0x0063)
R3K_WriteMem16(0x800B4BC2,0x0063)
end
end
EM_AddVsyncHook(patcher)
