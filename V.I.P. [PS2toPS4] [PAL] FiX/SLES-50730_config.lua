-- V.I.P. (PAL-M5) (SLES-50730)
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

if (LEFT ~= 0 and L1 ~= 0) then
-- All Unlocked
eeObj.WriteMem32(0x203286C8,0x00000008)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x001e46a0,0x3c013f40) --00000000 hor fov
eeObj.WriteMem32(0x001e46a4,0x4481f000) --00000000
eeObj.WriteMem32(0x001e46b8,0x461e0343) --46000346
eeObj.WriteMem32(0x001e46bc,0x46006b07) --46000307
eeObj.WriteMem32(0x0024c810,0x3c02437a) --3c024334 renderfix

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)