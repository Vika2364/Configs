-- The Simpsons - Hit & Run (NTSC-U)
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
eeObj.WriteMem32(0x00138a88,0x00000000) -- 10400005
eeObj.WriteMem32(0x0014b360,0x00000000) -- 10400004
eeObj.WriteMem32(0x0014b364,0x00000000) -- 10400004
eeObj.WriteMem32(0x002a0b38,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031c888,0x00000000) -- 10400004
eeObj.WriteMem32(0x0031d674,0x00000000) -- 10400004
---------CHEATS-------------------------
--Have All Levels Complete by Code Master
eeObj.WriteMem32(0x005E6CF0,0x00000006)
eeObj.WriteMem32(0x005E6CF4,0x00000006)
--Have Movie by Code Master
eeObj.WriteMem32(0x005E5E0C,0x00000001)
--Have All Wasp Cameras by Code Master
eeObj.WriteMem32(0x005E5E18,0x00000014)
--Have All Gags by Code Master
eeObj.WriteMem32(0x005E5E2C,0x0000000F)
--Open All Chapters by Codejunkies
eeObj.WriteMem32(0x004244F4,0x000000FF)
--Bonus Mission 1 by Code Master
eeObj.WriteMem32(0x005E6C64,0x00000001)

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