-- Turok - Evolution (U)(SLUS-20333)
-- Widescreen hack by Arapapa
-- emu used=rotk v1

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

if (LEFT ~= 0 and L1 ~= 0) then
-- 16:9
eeObj.WriteMem32(0x00325a28,0x3c023f40) --3c023f80
eeObj.WriteMem32(0x0023550c,0x3c023f2b) --3c023f00
end

if (Select ~= 0) then
-- Enter Cheat Menu For Bonus Level
eeObj.WriteMem32(0x207D8600,0x00000001)
end

if (RIGHT ~= 0 and L1 ~= 0) then
-- Unlimited Ammo
eeObj.WriteMem32(0x2014FFE8,0x2412270F)
end

end

emuObj.AddVsyncHook(CheckInputs)

local WS2 = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS2)