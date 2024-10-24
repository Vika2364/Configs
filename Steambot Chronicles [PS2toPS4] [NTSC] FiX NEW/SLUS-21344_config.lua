-- Steambot Chronicles SLUS_213.44
-- Widescreen Hack & Blur Removal
-- emu used=jakx v2

apiRequest(2.2)

local gpr             = require("ee-gpr-alias")
local emuObj       = getEmuObject()
local eeObj          = getEEObject()
local gsObj          = getGsObject()
local eeOverlay    = eeObj.getOverlayObject()
local iopObj        = getIOPObject()

local thresholdArea = 600

emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)

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

if (RIGHT ~= 0 and L1 ~= 0) then
-- Max Money
eeObj.WriteMem32(0x20587408,0x05F5E0FF)
end
if (LEFT ~= 0 and L1 ~= 0) then
-- Infinite Stuff (HP,Fuel,Boost)
eeObj.WriteMem32(0x2058F6F4,0x447A0000)
eeObj.WriteMem32(0x2058F6F0,0x447A0000)
eeObj.WriteMem32(0x2058F700,0x447A0000)
eeObj.WriteMem32(0x2058F6FC,0x447A0000)
eeObj.WriteMem32(0x2058F708,0x447A0000)
eeObj.WriteMem32(0x2058F704,0x447A0000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--Widescreen hack 16:9
eeObj.WriteMem32(0x001329c0,0x3c033f40)
eeObj.WriteMem32(0x00132818,0x3c0643d6)
--Extensive blur removal
eeObj.WriteMem32(0x0010fdd8,0x00000000)
eeObj.WriteMem32(0x0010fea4,0x00000000)

end

emuObj.AddVsyncHook(patcher)

-- Performace fix
emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 100000} )