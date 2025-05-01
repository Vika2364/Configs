-- PES Galaxy Patch Edition 2025 (MOD)
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

if (RIGHT ~= 0 and Select ~= 0) then
-- Widescreen hack 16:9
eeObj.WriteMem32(0x201043FC,0x3C013F40) --00000000 hor fov
eeObj.WriteMem32(0x20104400,0x44810000) --00000000
eeObj.WriteMem32(0x20104408,0x4600C602) --00000000
eeObj.WriteMem32(0x20125F3C,0x3C053FAB) --3C053F80 (increases hor. render area)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


end

emuObj.AddVsyncHook(patcher)