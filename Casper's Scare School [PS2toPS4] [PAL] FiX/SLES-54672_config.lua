-- Casper's Scare School (E)(SLES-54672)
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

if (Select ~= 0 and R1 ~= 0) then
--Widescreen hack 16:9
--X-Fov
eeObj.WriteMem32(0x0017eed4,0x3c01bf2a)
eeObj.WriteMem32(0x0017eee8,0x3421aaab)
end

end

emuObj.AddVsyncHook(CheckInputs)


local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)