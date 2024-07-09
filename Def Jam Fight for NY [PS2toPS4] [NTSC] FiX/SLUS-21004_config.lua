-- Def Jam: Fight for NY (SLUS-21004)
-- Multi-Tap fix by Kozarovv
-- Widescreen Patch
-- emu used=aofa

apiRequest(0.1)

local eeObj    = getEEObject()
local emuObj    = getEmuObject()

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

if (R3 ~= 0) then
-- Infinite Health Player 1
eeObj.WriteMem32(0x204BC4C0,0x42C80000)
eeObj.WriteMem32(0x204BC4C8,0x42C80000)
end
if (L3 ~= 0) then
-- Max Cash
eeObj.WriteMem32(0x208EC200,0x3B9AC9FF)
end
if (Select ~= 0 and R1 ~= 0) then
-- Access All Moves by Code Master
eeObj.WriteMem32(0x200C0230,0x240200FF)
eeObj.WriteMem32(0x200C0234,0x080D852F)
eeObj.WriteMem32(0x200C0238,0xA0620000)
eeObj.WriteMem32(0x203614B8,0x0803008C)
end
if (Select ~= 0 and L1 ~= 0) then
-- Access All Gear by Code Master
eeObj.WriteMem32(0x200C0220,0x240300FF)
eeObj.WriteMem32(0x200C0224,0x080D85B3)
eeObj.WriteMem32(0x200C0228,0xA0430000)
eeObj.WriteMem32(0x203616C8,0x08030088)
end

end

emuObj.AddVsyncHook(CheckInputs)

local WS = function()
--16:9
eeObj.WriteMem32(0x00361a34,0x10a20016)
eeObj.WriteMem32(0x00361a64,0x3c013fab)
eeObj.WriteMem32(0x00361a68,0x44810800)
eeObj.WriteMem32(0x00361a6c,0x46010002)
eeObj.WriteMem32(0x00361a70,0xe4c00000)
eeObj.WriteMem32(0x00361a74,0x46010842)
eeObj.WriteMem32(0x00361a78,0xe4e10000)
eeObj.WriteMem32(0x00361a7c,0xc480001c)
eeObj.WriteMem32(0x00361a80,0xe5000000)
eeObj.WriteMem32(0x00361a84,0xc4810024)
eeObj.WriteMem32(0x00361a88,0x03e00008)
eeObj.WriteMem32(0x00361a8c,0xe5210000)
eeObj.WriteMem32(0x00361a90,0xc4800010)
eeObj.WriteMem32(0x00361a94,0x3c013fab)
eeObj.WriteMem32(0x00361a98,0x44810800)
eeObj.WriteMem32(0x00361a9c,0x00000000) -- optional zoom for cutscenes
eeObj.WriteMem32(0x00361a9c,0x46010002) -- optional zoom for cutscenes
eeObj.WriteMem32(0x00361aa0,0x46010842)
eeObj.WriteMem32(0x00361aa4,0xe4c00000)
eeObj.WriteMem32(0x00361aa8,0xe4e10000)
eeObj.WriteMem32(0x00361aac,0x3c013e80)
eeObj.WriteMem32(0x00361ab0,0x44811800)
eeObj.WriteMem32(0x00361ab4,0xc4820024)
eeObj.WriteMem32(0x00361ab8,0x3c013f00)
eeObj.WriteMem32(0x00361abc,0x44810000)
eeObj.WriteMem32(0x00361ac0,0x46031082)
eeObj.WriteMem32(0x00361ac4,0xc481001c)
eeObj.WriteMem32(0x00361ac8,0x46001002)
eeObj.WriteMem32(0x00361acc,0xe5010000)
eeObj.WriteMem32(0x00361ad0,0xc4800024)
eeObj.WriteMem32(0x00361ad4,0x03e00008)
eeObj.WriteMem32(0x00361ad8,0xe5200000)
--general
eeObj.Vu1MpgCycles(600)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

local mtap_fix = function()
-- Force controllers detection
eeObj.WriteMem32(0x32F3EC,0x00000000)
-- Manually count to 8...
eeObj.WriteMem32(0x1EADFC,0x24100000)
eeObj.WriteMem32(0x1EAE04,0x26100001)
-- Rearrange controllers from port 2 to 1
eeObj.WriteMem32(0x0fff00,0x10040007)
eeObj.WriteMem32(0x0fff04,0x28b90003)
eeObj.WriteMem32(0x0fff08,0x54190001)
eeObj.WriteMem32(0x0fff0c,0x24a50001)
eeObj.WriteMem32(0x0fff10,0x54190001)
eeObj.WriteMem32(0x0fff14,0x24040000)
eeObj.WriteMem32(0x0fff18,0x080CBBD0)
eeObj.WriteMem32(0x0fff1c,0x00000000)
eeObj.WriteMem32(0x0fff20,0x54050001)
eeObj.WriteMem32(0x0fff24,0x24040001)
eeObj.WriteMem32(0x0fff28,0x54050001)
eeObj.WriteMem32(0x0fff2c,0x24a5ffff)
eeObj.WriteMem32(0x0fff30,0x080CBBD0)
eeObj.WriteMem32(0x0fff34,0x00000000)
eeObj.WriteMem32(0x32F36C,0x0c03ffc0)
end

emuObj.AddVsyncHook(mtap_fix)