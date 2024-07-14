-- Sonic Mega Collection Plus (NTSC)
-- emu used=aofa

apiRequest(2.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

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
-- Can Choose Locked Games (Sonic Mega Collection Plus)
eeObj.WriteMem32(0x2011A634,0x24020001)
eeObj.WriteMem32(0x2011E944,0x24020001)
end

end

emuObj.AddVsyncHook(CheckInputs)

emuObj.SetDisplayAspectWide()
  
local Main = function()

end 

emuObj.AddVsyncHook(Main)