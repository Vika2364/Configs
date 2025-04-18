--gametitle=Devil May Cry 3: Dante's Awakening SE (SLES_54186)
--comment=Patches/Codes Hacked By Maori-Jigglypuff [Savas Guercebe]
--Jak v2

apiRequest(2.0)

local gpr = require("ee-gpr-alias")

local emuObj         = getEmuObject()
local eeObj            = getEEObject()


-- Kozarov fix

eeObj.AddHook(0x20AD40, 0xF8400030, function()
    local sp  = eeObj.GetGpr(29)
    local val = eeObj.ReadMemFloat(sp + 0x84)
    eeObj.WriteMemFloat(sp + 0x84, val - 0.1)
end)

local CheckInputs = function()

local pad_bits = emuObj.GetPad()

local UP    = pad_bits &  0x0010
local DOWN    = pad_bits &  0x0040
local LEFT    = pad_bits &  0x0080
local RIGHT    = pad_bits &  0x0020
local Triangle  = pad_bits &  0x1000
local Cross    = pad_bits &  0x4000
local Square    = pad_bits &  0x8000
local Circle  = pad_bits &  0x2000
local L1    = pad_bits &  0x0400
local L2    = pad_bits &  0x0100
local L3    = pad_bits &  0x0002
local R1    = pad_bits &  0x0800
local R2    = pad_bits &  0x0200
local R3    = pad_bits &  0x0004
local Select  = pad_bits &  0x0001
local Start    = pad_bits &  0x0008

if (R1 ~= 0 and Select ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x20221224,0x3C0145C0)
eeObj.WriteMem32(0x20221230,0xAE212AD4)
end
if (L1 ~= 0 and Select ~= 0) then
-- Quicker Character
eeObj.WriteMem32(0x201FA4B0,0x3C023FD0)
end
if (R2 ~= 0 and Select ~= 0) then
-- Open All Modes/Gallery
eeObj.WriteMem32(0x21D1071C,0xFFFFFFFF)
eeObj.WriteMem32(0x21D10720,0xFFFFFFFF)
eeObj.WriteMem32(0x21D10724,0xFFFFFFFF)
eeObj.WriteMem32(0x21D10728,0xFFFFFFFF)
end
if (L2 ~= 0 and Select ~= 0) then
-- Have One Hit Kill
eeObj.WriteMem32(0x200C2020,0x24100001)
eeObj.WriteMem32(0x200C2024,0x46160001)
eeObj.WriteMem32(0x200C2028,0x55100001)
eeObj.WriteMem32(0x200C202C,0x46000001)
eeObj.WriteMem32(0x200C2030,0x03E00008)
eeObj.WriteMem32(0x200C2034,0xE4400004)
eeObj.WriteMem32(0x202F25B4,0x0C030808)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patch = function()

--gameplay
eeObj.WriteMem32(0x001ac7a4,0x3c013f40) --hor val 1
eeObj.WriteMem32(0x001ac7a8,0x4481a000)
eeObj.WriteMem32(0x001ac7ac,0x3c0101d1)
eeObj.WriteMem32(0x001ac7b0,0xe43407a0)
eeObj.WriteMem32(0x001ac7b4,0x46000d03)
                    
eeObj.WriteMem32(0x001ac814,0x3c013f40) --hor val 2
eeObj.WriteMem32(0x001ac818,0x4481a000)
eeObj.WriteMem32(0x001ac81c,0x3c0101d1)
eeObj.WriteMem32(0x001ac820,0xe43407a0)
eeObj.WriteMem32(0x001ac824,0x46000d03)

--FMV's fix
eeObj.WriteMem32(0x00231cb8,0x24040180) --dolby logo
eeObj.WriteMem32(0x00232dcc,0x240301aa) --intro / demo
eeObj.WriteMem32(0x002e5a8c,0x240801aa) --cutscenes
eeObj.WriteMem32(0x00307d4c,0x24050040) --gallery 1
eeObj.WriteMem32(0x00307d54,0x24070180) --gallery 2

--rfix 1
eeObj.WriteMem32(0x001ac844,0x3c0345bf) --val 1
eeObj.WriteMem32(0x001ac96c,0x3c0345bf) --val 2

--rfix 2
eeObj.WriteMem32(0x001acf0c,0x3c013f40) --hor val 2

eeObj.WriteMem32(0x001acf24,0x44812000)
eeObj.WriteMem32(0x001acf28,0x460418c2)
eeObj.WriteMem32(0x001acf2c,0x460018c3)
eeObj.WriteMem32(0x001acf30,0x46001083)
eeObj.WriteMem32(0x001acf34,0x46000803)
eeObj.WriteMem32(0x001acf38,0xe7a30030)
eeObj.WriteMem32(0x001acf3c,0xe7a20034)
                    
eeObj.WriteMem32(0x001acfa0,0x460418c2)
eeObj.WriteMem32(0x001acfa4,0x460018c3)
eeObj.WriteMem32(0x001acfa8,0x46001083)
eeObj.WriteMem32(0x001acfac,0x46000803)
eeObj.WriteMem32(0x001acfb0,0xe7a30030)
eeObj.WriteMem32(0x001acfb4,0xe7a20034)
                    
eeObj.WriteMem32(0x001ad020,0x460418c2)
eeObj.WriteMem32(0x001ad024,0x460018c3)
eeObj.WriteMem32(0x001ad028,0x46001083)
eeObj.WriteMem32(0x001ad02c,0x46000803)
eeObj.WriteMem32(0x001ad030,0xe7a30030)
eeObj.WriteMem32(0x001ad034,0xe7a20034)
                    
eeObj.WriteMem32(0x001ad0a0,0x460418c2)
eeObj.WriteMem32(0x001ad0a4,0x460018c3)
eeObj.WriteMem32(0x001ad0a8,0x46001083)
eeObj.WriteMem32(0x001ad0ac,0x46000803)
eeObj.WriteMem32(0x001ad0b0,0xe7a30030)
eeObj.WriteMem32(0x001ad0b4,0xe7a20034)

--Bypass Interleacing f.
eeObj.WriteMem32(0x0013CCFC,0x30630000)
eeObj.WriteMem32(0x20134B64,0x0804D2FC)

--progressive mode 256p (is a field renderer game)
eeObj.WriteMem32(0x201029C4,0x3C050000)
eeObj.WriteMem32(0x201029CC,0x3C060050)
eeObj.WriteMem32(0x201029D4,0x3C070001)
eeObj.WriteMem32(0x20102C84,0x3C0700E0)
eeObj.WriteMem8(0x01D10742,0x02) --vf

-- Disable Blur Effect (and increase Game Speed to 100%)
eeObj.WriteMem32(0x001c46a4,0x34020004)

-- Complex Control-System for
-- World and Characters brighter without additional Lights
-- [Characters true Shape and Skin will be revealed now]
eeObj.WriteMem32(0x001aa4b4,0x64030000)
eeObj.WriteMem32(0x001aa4b8,0x7c800000)
eeObj.WriteMem32(0x001aa4bc,0x24630001)
eeObj.WriteMem32(0x001aa4c0,0x2c620004)
eeObj.WriteMem32(0x001aa4c4,0x1440fffc)
eeObj.WriteMem32(0x001aa4c8,0x24840010)
eeObj.WriteMem32(0x001aa4cc,0x0240202d)
eeObj.WriteMem32(0x001aa4d0,0x27a50080)
eeObj.WriteMem32(0x001aa4d4,0x0c06a8ac)
eeObj.WriteMem32(0x001aa4d8,0x27a60040)
eeObj.WriteMem32(0x001aa4dc,0x3c0443c0)
eeObj.WriteMem32(0x001aa4e0,0x3c070000)
eeObj.WriteMem32(0x001aa4e4,0x0004283c)
eeObj.WriteMem32(0x001aa4e8,0x00a42825)
eeObj.WriteMem32(0x001aa4ec,0x0007383c)
eeObj.WriteMem32(0x001aa4f0,0x00e43825)
eeObj.WriteMem32(0x001aa4f4,0x70e54c88)
eeObj.WriteMem32(0x001aa4f8,0x0240202d)
eeObj.WriteMem32(0x001aa4fc,0x8f83a9e8)
eeObj.WriteMem32(0x001aa500,0x8063000e)
eeObj.WriteMem32(0x001aa504,0x00031880)
eeObj.WriteMem32(0x001aa508,0x00641821)
eeObj.WriteMem32(0x001aa50c,0x8c630040)
eeObj.WriteMem32(0x001aa510,0x24630140)
eeObj.WriteMem32(0x001aa518,0x10000003)
eeObj.WriteMem32(0x001aa51c,0x7c690000)
eeObj.WriteMem32(0x001aa1a8,0x64050000)
eeObj.WriteMem32(0x001aa1ac,0x7c600000)
eeObj.WriteMem32(0x001aa1b0,0x24a50001)
eeObj.WriteMem32(0x001aa1b4,0x2ca20008)
eeObj.WriteMem32(0x001aa1b8,0x1440fffc)
eeObj.WriteMem32(0x001aa1bc,0x24630010)
eeObj.WriteMem32(0x001aa1c0,0x0240202d)
eeObj.WriteMem32(0x001aa1c4,0x27a50080)
eeObj.WriteMem32(0x001aa1c8,0x0c06a760)
eeObj.WriteMem32(0x001aa1cc,0x27a60040)
eeObj.WriteMem32(0x001aa1d0,0x3c0442e0)
eeObj.WriteMem32(0x001aa1d4,0x3c070000)
eeObj.WriteMem32(0x001aa1d8,0x0004283c)
eeObj.WriteMem32(0x001aa1dc,0x00a42825)
eeObj.WriteMem32(0x001aa1e0,0x0007383c)
eeObj.WriteMem32(0x001aa1e4,0x00e43825)
eeObj.WriteMem32(0x001aa1e8,0x70e54c88)
eeObj.WriteMem32(0x001aa1ec,0x0240202d)
eeObj.WriteMem32(0x001aa1f0,0x8f83a9e8)
eeObj.WriteMem32(0x001aa1f4,0x8063000e)
eeObj.WriteMem32(0x001aa1f8,0x000319c0)
eeObj.WriteMem32(0x001aa1fc,0x00831821)
eeObj.WriteMem32(0x001aa200,0x246401c0)
eeObj.WriteMem32(0x001aa204,0x24830030)
eeObj.WriteMem32(0x001aa208,0x7c690000)
eeObj.WriteMem32(0x001aa20c,0x44801800)
eeObj.WriteMem32(0x001aa210,0x44801000)
eeObj.WriteMem32(0x001aa214,0x44800800)
eeObj.WriteMem32(0x001aa218,0x3c033f80)
eeObj.WriteMem32(0x001aa21c,0xe4830070)
eeObj.WriteMem32(0x001aa220,0xe4820074)
eeObj.WriteMem32(0x001aa224,0x44830000)
eeObj.WriteMem32(0x001aa228,0xe4810078)
eeObj.WriteMem32(0x001aa22c,0x1000000c)
eeObj.WriteMem32(0x001aa230,0xe480007c)

--Open All Levels
eeObj.WriteMem32(0x204A2400,0x00000000)

end
emuObj.AddVsyncHook(patch)