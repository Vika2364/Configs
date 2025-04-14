-- Legaia 2: Duel Saga (PAL)
-- emu used=Jak2v2

apiRequest(2.0)

local eeObj   = getEEObject()
local emuObj  = getEmuObject()
local gsObj   = getGsObject()

gsObj.SetDeinterlaceShift(0)

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

if (L3 ~= 0) then
-- Infinite Gold,Health,MP
eeObj.WriteMem32(0x203FEBA8,0x00900FAB)
eeObj.WriteMem32(0x20419C1C,0x0000270F)
eeObj.WriteMem32(0x20419C20,0x0000270F)
eeObj.WriteMem32(0x20419DCC,0x0000270F)
eeObj.WriteMem32(0x20419DD0,0x0000270F)
eeObj.WriteMem32(0x20419E7C,0x0000270F)
eeObj.WriteMem32(0x20419E80,0x0000270F)
end
if (R3 ~= 0) then
-- No Random Battles
eeObj.WriteMem32(0x2062001C,0x48000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
--remove blur?
eeObj.WriteMem32(0x004A7300,0x00000000)
--brightness
eeObj.WriteMem32(0x004A72DC,0x3f600000)
eeObj.WriteMem32(0x004A72E0,0x3f600000)
eeObj.WriteMem32(0x004A72E4,0x3f600000)
--no interlace
--[[eeObj.WriteMem32(0x205F9600,0x00000000)
eeObj.WriteMem32(0x202C1294,0x00000000)
eeObj.WriteMem32(0x202A5EF8,0xAE000060)--]]
--WS
local problem_code = eeObj.ReadMem16(0x10FF30) 
if problem_code == 0x3f80 then
eeObj.WriteMem32(0x0010FF30,0x3c013f40)
end
eeObj.WriteMem32(0x0010FFBC,0x3c013f80)
eeObj.WriteMem32(0x00156E9C,0x3C013F80)
eeObj.WriteMem32(0x00156EA4,0x3C01C3A0)
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "ignoreSubBuffCov", "reserved", { } )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )