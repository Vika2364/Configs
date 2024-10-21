-- Nightshade (SLES-52238)(EU)
-- Widescreen + Graphical bugs FiX
-- emu used=Jak v2

apiRequest(1.0)

local eeObj  = getEEObject()
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

if (L3 ~= 0) then
-- Infinite stuff (Health,Weapon,Tate Time)
eeObj.WriteMem32(0x201C267C,0x00000000)
eeObj.WriteMem32(0x201C42E4,0x00000000)
eeObj.WriteMem32(0x201C96B4,0x00000000)
eeObj.WriteMem32(0x201B6A9C,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Gameplay 16:9 
eeObj.WriteMem32(0x00183124,0x3C023F24) --3C023F5B (Increases hor. axis)
eeObj.WriteMem32(0x00183128,0x34428B44) --3442645A 

--Disable the fade-in effect to fix framerate drops caused by excessive enemies
eeObj.WriteMem32(0x1d1f38,0x1000000f)

--Disable shadows to fix square bugs around characters
eeObj.WriteMem32(0x326370,0x03e00008)
eeObj.WriteMem32(0x326374,0x00000000)

--Disable haze effect to fix charged attack frame rate drop
eeObj.WriteMem32(0x3135f4,0x00000000)

end

emuObj.AddVsyncHook(patcher)