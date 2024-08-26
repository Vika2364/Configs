-- McFarlane Evil Prophecy (U)(SLUS-20657)
-- Widescreen hack (NTSC-U by Arapapa)
-- emu used=psychonauts v2

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

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
-- Bonus Stuff (Videos,Cards,Gallery)
eeObj.WriteMem32(0x00318AB4,0xFFFFFFFF)
eeObj.WriteMem32(0x20318A94,0xFFFFFFFF)
eeObj.WriteMem32(0x20318A98,0xFFFFFFFF)
eeObj.WriteMem32(0x20318A9C,0xFFFFFFFF)
eeObj.WriteMem32(0x20318AA0,0x000007FF)
eeObj.WriteMem32(0x20319B00,0xFFFFFFFF)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

eeObj.SchedulerDelayEvent("vif1.dma", 0x6000) -- used as "--vif1-instant-xfer=0" replacement.  fixes graphics

--16:9
eeObj.WriteMem32(0x203173c0,0x443B8000) --447a0000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )