-- Need for Speed Undercover (U)(SLUS-21801)
-- emu used=psychonauts v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

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

if (L3 ~= 0 and DOWN ~= 0) then
-- Infinite NOS Usage
eeObj.WriteMem32(0x20416178,0x00000000)
end
if (L3 ~= 0 and UP ~= 0) then
-- Max Cash
eeObj.WriteMem32(0x201acaec,0x3c0205f5)
eeObj.WriteMem32(0x201acaec,0x3442e0ff)
end
if (L3 ~= 0 and LEFT ~= 0) then
-- Infinite Speedbreaker
eeObj.WriteMem32(0x2045B6F8,0x00000000)
end
if (L3 ~= 0 and RIGHT ~= 0) then
-- Open All Parts/Cars/Races/Challenges 
eeObj.WriteMem32(0x00690594,0x00000001)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Fixes for low frame rate
eeObj.WriteMem32(0x00265820,0x10000004)
eeObj.WriteMem32(0x00266408,0x10000003)

end

emuObj.AddVsyncHook(patcher)

-- Graphic improvement: removes corrupted lines on screen with uprender on for PAL/NTSC-U/NTSC-J version
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) --texMode=1
