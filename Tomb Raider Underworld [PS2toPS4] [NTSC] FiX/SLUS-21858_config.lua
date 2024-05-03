-- Tomb Raider: Underworld (NTSC-U)
-- emu used=aofa

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()

eeObj.SchedulerDelayEvent("vif1.dma", 0x6000) -- used as "--vif1-instant-xfer=0" replacement.  fixes graphics

eeObj.Vu1MpgCycles(1)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )