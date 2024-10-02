-- The Flintstones in Viva Rock Vegas (PAL)
-- emu used=aofa

apiRequest(2.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

emuObj.SetDisplayAspectWide()

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
-- Mirror, Reverse And G-Slam Tracks Open
eeObj.WriteMem32(0x203A13AC,0x00000001)
eeObj.WriteMem32(0x203A13B0,0x00000001)
eeObj.WriteMem32(0x203A13B4,0x00000001)
eeObj.WriteMem32(0x203A13B8,0x00000001)
eeObj.WriteMem32(0x203A13C0,0x00000001)
end
if (R3 ~= 0) then
-- Freeze Timer
eeObj.WriteMem32(0x203A0494,0x00000000)
eeObj.WriteMem32(0x203A0498,0x00000000)
eeObj.WriteMem32(0x203A049C,0x00000000)
eeObj.WriteMem32(0x203A04A0,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)
  
local Main = function()

-- Gameplay 16:9
eeObj.WriteMem32(0x00139738,0x3C013F40) --3C013F80 Single Player
eeObj.WriteMem32(0x00139814,0x3C013EC0) --3C013F00 Multiplayer

end 

emuObj.AddVsyncHook(Main)