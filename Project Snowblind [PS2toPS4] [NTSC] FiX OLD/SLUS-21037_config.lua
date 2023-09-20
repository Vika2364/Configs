-- Project - Snowblind (NTSC-U)
-- Widescreen hack by ElHecht
-- emu used=aofa

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
-- 16:9 single player mode
local code_check1 = eeObj.ReadMem16(0x100000)
if code_check1 == 0xff80 then
   eeObj.WriteMem32(0x201d87b8,0x3c013fe3) --3c013faa
   eeObj.WriteMem32(0x201d87bc,0x34218e39) --3421aaab
end
local code_check2 = eeObj.ReadMem16(0x100000)
if code_check2 == 0xffc0 then
   eeObj.WriteMem32(0x203327f0,0x3c013fe3) --3c013faa
   eeObj.WriteMem32(0x203327f4,0x34218e39) --3421aaab
end

eeObj.SchedulerDelayEvent("vif1.dma", 0x6000) -- used as "--vif1-instant-xfer=0" replacement.  fixes graphics

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } )