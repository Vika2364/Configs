-- Just Cause (E)(SLES-54137)
-- Widescreen hack  by Arapapa
-- 50FPS
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } ) --gfx fix A
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2  } ) --gfx fix B

local Patches = function()
   --16:9
   eeObj.WriteMem32(0x207BEE08,0x3FAAAAAB) --0x3f800000 // lui zero, $0000
   --50fps
   eeObj.WriteMem32(0x203b860c,0x00000000) --0x45000010 // bc1f $003b8650
   --eeObj.Vu1MpgCycles(math.floor(675))
   eeObj.SchedulerDelayEvent("vif1.dma", 0x5500)
   --Static loading screen speed up(maybe some 2-d game elements)[not this game]
   emuObj.ThrottleMax()
end
 
emuObj.AddVsyncHook(Patches)