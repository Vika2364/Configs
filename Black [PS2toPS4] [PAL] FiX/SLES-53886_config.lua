-- Black (PAL-E) SLES-53886
-- emu used=aofa

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

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
-- Widescreen 16:9
eeObj.WriteMem32(0x203BE8BC,0x00000001)
eeObj.WriteMem32(0x204BC950,0x00000001)
eeObj.WriteMem32(0x204BD98C,0x00000101)
eeObj.WriteMem32(0x204CAD54,0x3FE38E39)
eeObj.WriteMem32(0x204CADF0,0x3FAAAAAB)
eeObj.WriteMem32(0x204CADF4,0x3FE38E39)
eeObj.WriteMem32(0x204CAD94,0x3FE38E39)
eeObj.WriteMem32(0x205BCB90,0x3F400000)
end
if (Select ~= 0) then
-- Skip FMVs
eeObj.WriteMem32(0x20104B90,0x00000000) --1440000A
end
if (R3 ~= 0) then
-- Infinite Health,Ammo,Grenades
eeObj.WriteMem32(0x205A95A8,0x44960000)
eeObj.WriteMem32(0x005A9B51,0x00000003) --005B0120
eeObj.WriteMem32(0x201FD268,0xA0455CA0)
eeObj.WriteMem32(0x20155260,0x24030009)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- COP2 Rearrangement. Fixes broken collisions.
eeObj.WriteMem32(0x0037EBD4,0x4B000460) -- 4AF103BC
eeObj.WriteMem32(0x0037EBD8,0x4AF103BC) -- 4B000460
eeObj.WriteMem32(0x0037EBF0,0x4A800460) -- 4B7103BC
eeObj.WriteMem32(0x0037EBF4,0x4B7103BC) -- 4A800460

eeObj.SchedulerDelayEvent("vif1.dma", 0x6000) -- used as "--vif1-instant-xfer=0" replacement.  fixes graphics

eeObj.Vu1MpgCycles(1)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

-- Graphic improvement: removes corrupted lines on screen with uprender on for PAL/NTSC version
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { ztst=0, texMode=1 } )
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { ztst=0, texMode=2 } )
