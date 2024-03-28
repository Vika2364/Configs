-- Gran Turismo 2 [NTSC-U] [v1.2] [Combined Disc] (SCUS-94488)
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

if (L3 ~= 0) then

-- Widescreen 16:9
R3K_WriteMem16(0xD0010000,0xFFE8)
R3K_WriteMem16(0x8007B39C,0x0156) -- Arcade disc menus --
R3K_WriteMem16(0xD0010000,0xFFD0)
R3K_WriteMem16(0x8007B39C,0x03DE) -- Simulation disc menu --
R3K_WriteMem16(0xD0010000,0xFFE0)
R3K_WriteMem16(0x8007B39C,0x01AC) -- In-game Auto-Activate (Both Discs) --
R3K_WriteMem16(0x8007B39E,0x3402) -- Permantly Activated (Both Discs) --
end
if (R3 ~= 0) then

-- Max Cash
R3K_WriteMem16(0x801D156A,0x1525)
R3K_WriteMem16(0x801D1568,0xE0FF)
end
end
EM_AddVsyncHook(patcher)
