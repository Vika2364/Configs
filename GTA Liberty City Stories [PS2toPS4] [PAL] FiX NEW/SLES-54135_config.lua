-- Grand Theft Auto Liberty City Stories (PAL)
-- emu used=jakx v2

apiRequest(0.1)  
 
local emuObj  = getEmuObject()
local eeObj  = getEEObject()
local gsObj    = getGsObject()

emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)

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

if (UP ~= 0 and Select ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x200FFF00,0x3C0142C8)
eeObj.WriteMem32(0x200FFF04,0xAC6104B8)
eeObj.WriteMem32(0x200FFF08,0xC46004B8)
eeObj.WriteMem32(0x200FFF0C,0x08090271)
eeObj.WriteMem32(0x202409C0,0x0803FFC0)
end
if (DOWN ~= 0 and Select ~= 0) then
-- Infinite Run
eeObj.WriteMem32(0x20349058,0x00000000)
end
if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x202A2EF0,0x00000000)
eeObj.WriteMem32(0x202A2E8C,0x00000000)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite Cash
eeObj.WriteMem32(0x204090FC,0x05F5E0FF)
eeObj.WriteMem32(0x20409100,0x05F5E0FF)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
--16:9
eeObj.WriteMem32(0x00291990, 0x468010a0)
eeObj.WriteMem32(0x00291994, 0xc6650030)
eeObj.WriteMem32(0x00291998, 0x44830800)
eeObj.WriteMem32(0x0029199c, 0x46800860)
eeObj.WriteMem32(0x002919a0, 0xc6640034)
eeObj.WriteMem32(0x002919a4, 0x44840000)
eeObj.WriteMem32(0x002919a8, 0x46800020)
eeObj.WriteMem32(0x002919ac, 0xc6630038)
eeObj.WriteMem32(0x002919b0, 0x46151082)
eeObj.WriteMem32(0x002919b4, 0x46150842)
eeObj.WriteMem32(0x002919b8, 0x46150002)
eeObj.WriteMem32(0x002919bc, 0x46022940)
eeObj.WriteMem32(0x002919c0, 0x46012100)
eeObj.WriteMem32(0x002919c4, 0x460018c0)
eeObj.WriteMem32(0x002919c8, 0x4615a034)
eeObj.WriteMem32(0x002919cc, 0xe6650030)
eeObj.WriteMem32(0x002919d0, 0xe6640034)
eeObj.WriteMem32(0x002919d4, 0x45000012)
eeObj.WriteMem32(0x002919d8, 0xe6630038)
eeObj.WriteMem32(0x002919dc, 0x27c2bdf0)
eeObj.WriteMem32(0x002919e0, 0x24040001)
eeObj.WriteMem32(0x002919e4, 0x8c431d04)
eeObj.WriteMem32(0x002919e8, 0x1064000d)
eeObj.WriteMem32(0x002919ec, 0x24070096)
eeObj.WriteMem32(0x002919f0, 0x3c01437f)
eeObj.WriteMem32(0x002919f4, 0x44810000)
eeObj.WriteMem32(0x002919f8, 0x2405000b)
eeObj.WriteMem32(0x002919fc, 0x4600b002)
eeObj.WriteMem32(0x00291a00, 0xae05002c)
eeObj.WriteMem32(0x00291a04, 0x46000064)
eeObj.WriteMem32(0x00291a08, 0x44020800)
eeObj.WriteMem32(0x00291a0c, 0x24420019)
eeObj.WriteMem32(0x00291a10, 0x28430097)
eeObj.WriteMem32(0x00291a14, 0x00e3100a)
eeObj.WriteMem32(0x00291a18, 0x10000007)
eeObj.WriteMem32(0x00291a1c, 0xae020028)
eeObj.WriteMem32(0x00291a20, 0x8e03002c)
eeObj.WriteMem32(0x00291a24, 0x2402000b)
eeObj.WriteMem32(0x00291a28, 0x14620003)
eeObj.WriteMem32(0x00291a2c, 0x2405ffff)
eeObj.WriteMem32(0x00291a30, 0xae00002c)
eeObj.WriteMem32(0x00291a34, 0xae050028)
eeObj.WriteMem32(0x00291a38, 0x0c0a47d2)
eeObj.WriteMem32(0x00291a3c, 0x0260202d)
eeObj.WriteMem32(0x00291a40, 0x0c0a47d4)
eeObj.WriteMem32(0x00291a44, 0x0260202d)
eeObj.WriteMem32(0x00291a48, 0xc7ac0124)
eeObj.WriteMem32(0x00291a4c, 0x3c013f9d)
eeObj.WriteMem32(0x00291a50, 0x44810000)
eeObj.WriteMem32(0x00291a54, 0x0c082128)
eeObj.WriteMem32(0x00291a58, 0x46006302)
--
eeObj.WriteMem32(0x002A0094,0x24040001)
--no interlace
eeObj.WriteMem32(0x2035F394,0)
--remove filter by Juano V
eeObj.WriteMem32(0x003D76B8,0x0)
eeObj.WriteMem32(0x003D105C,0x0)
eeObj.WriteMem32(0x003D1050,0x0)
--50fps
--eeObj.WriteMem32(0x202D9384,0)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--FPS fix
eeObj.AddHook(0x0029FD28, 0xdca20000, function()
         eeObj.AdvanceClock(5000)
         eeObj.Vu1MpgCycles(200)
end)
--extra stutter removal
eeObj.AddHook(0x0029FD44, 0x00e2102b, function()
         eeObj.AdvanceClock(1800)
end)