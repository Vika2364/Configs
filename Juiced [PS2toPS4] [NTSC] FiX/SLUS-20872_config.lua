-- Juiced (NTSC)
-- emu used=JakX v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

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

if (R3 ~= 0) then
-- Infinite N2O
eeObj.WriteMem32(0x2014770C,0x3C014080)
eeObj.WriteMem32(0x20147718,0xAC4103D8)
eeObj.WriteMem32(0x20147720,0xAC610100)
end
if (L3 ~= 0) then
-- Start A New Game With Max Cash
eeObj.WriteMem32(0x201C0D7C,0x3C0205F0)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

-- Graphic improvement: removes corrupted lines on screen with uprender on for PAL/NTSC-U/NTSC-J version
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) --texMode=1