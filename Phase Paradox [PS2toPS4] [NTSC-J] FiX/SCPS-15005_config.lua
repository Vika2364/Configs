-- Phase Paradox [NTSC-J] [English Patched] (SCPS-15005)
-- emu used=Red Faction

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

if (L3 ~= 0) then
-- No interlace 
eeObj.WriteMem32(0x203118F0,0x30630000)
end
if (R3 ~= 0) then
-- Disable shadows
eeObj.WriteMem32(0x204C0C4C,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

eeObj.SchedulerDelayEvent("vif1.dma", 0x6000) -- used as "--vif1-instant-xfer=0" replacement.  fixes graphics

end

emuObj.AddVsyncHook(patcher)

-- Performace fix
local emuObj = getEmuObject()	
local thresholdArea = 600
emuObj.SetGsTitleFix( "ignoreUpRender", thresholdArea , {alpha=0x80008068 , zmsk=1 } )