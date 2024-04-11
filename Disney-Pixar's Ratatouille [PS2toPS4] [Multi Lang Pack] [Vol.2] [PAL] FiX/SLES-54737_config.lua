-- Ratatouille PAL (Vol.2)
-- ported to PS4 LUA
-- emu used=aofa

apiRequest(2.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

emuObj.SetDisplayAspectWide()
  
local Main = function()

   eeObj.SchedulerDelayEvent("vif0.dma", 0x6500) -- used as speed up
   eeObj.SchedulerDelayEvent("gif.dma", 0x1000) -- 
   emuObj.ThrottleMax()

end 

emuObj.AddVsyncHook(Main)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } ) -- graphics fix A
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2  } ) -- graphics fix B