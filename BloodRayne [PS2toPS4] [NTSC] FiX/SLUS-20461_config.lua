-- Bloodrayne SLUS_204.61
-- emu used=ADK

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

if (L3 ~= 0) then
-- 60 fps
eeObj.WriteMem32(0x202C9640,0x28630001)
end
if (UP ~= 0 and Select ~= 0) then
-- Unlock All Cheats
eeObj.WriteMem32(0x203BA0A0,0x0000FFFF)
end
if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x201B8AA8,0x00000000)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x202BFF10,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)