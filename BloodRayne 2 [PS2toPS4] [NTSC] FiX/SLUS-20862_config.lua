-- Bloodrayne 2 SLUS_208.62
-- emu used=psychonauts v2

apiRequest(1.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

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
eeObj.WriteMem32(0x2033CC10,0x28630001)
end
if (UP ~= 0 and Select ~= 0) then
-- Unlock All Cheats
eeObj.WriteMem32(0x2055FA0C,0xFFFFFFFF)
end
if (DOWN ~= 0 and Select ~= 0) then
-- Infinite Rage
eeObj.WriteMem32(0x20274CC8,0xC42D8854)
end
if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x201587A8,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patches = function()


emuObj.ThrottleMax() -- Again, no negative side effects, game DOES NOT speed up/down
end

emuObj.AddVsyncHook(patches)