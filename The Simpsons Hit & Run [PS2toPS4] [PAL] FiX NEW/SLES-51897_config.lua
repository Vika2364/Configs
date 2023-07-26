-- The Simpsons - Hit & Run (PAL)
-- Widescreen hack by ElHecht
-- emu used=kof98um

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()


emuObj.PadSetLightBar(0, 255, 255, 0)
emuObj.SetDisplayAspectWide()
gsObj.SetUprenderMode(1) -- 0=none <> 1=2x2
emuObj.SetDeinterlace(true)


local patcher = function()
-- 16:9 ver
eeObj.WriteMem32(0x00138ab8,0x00000000) -- 10400005
eeObj.WriteMem32(0x0014b3a8,0x00000000) -- 10400004
eeObj.WriteMem32(0x0014c3ac,0x00000000) -- 10400004
eeObj.WriteMem32(0x002a1f88,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031e0b8,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031eea4,0x00000000) -- 10400004
--Open All Chapters by Codejunkies
eeObj.WriteMem32(0x00425EF4,0x000000FF)

local pad_bits = emuObj.GetPad()

local UP     = pad_bits &  0x0010
local DOWN     = pad_bits &  0x0040
local LEFT     = pad_bits &  0x0080
local RIGHT     = pad_bits &  0x0020
local Triangle  = pad_bits &  0x1000
local Cross     = pad_bits &  0x4000
local Square  = pad_bits &  0x8000
local Circle    = pad_bits &  0x2000
local L1     = pad_bits &  0x0400
local L2     = pad_bits &  0x0100
local L3     = pad_bits &  0x0002
local R1     = pad_bits &  0x0800
local R2     = pad_bits &  0x0200
local R3     = pad_bits &  0x0004
local Select    = pad_bits &  0x0001
local Start     = pad_bits &  0x0008

if (R1 ~= 0 and Select ~= 0) then --
  gsObj.SetUprenderMode(0) -- 0=none <> 1=2x2
end

if (L1 ~= 0 and Select ~= 0) then --
  gsObj.SetUprenderMode(1) -- 0=none <> 1=2x2
end


eeObj.SchedulerDelayEvent("vif1.dma", 0x1000) -- allows game to boot on later emus
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

-- Performace fix (bug #9785 )
emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )