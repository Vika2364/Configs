-- Disney's Pixar - Ratatouille NTSC
-- emu used=aofa

apiRequest(2.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--disable ghosting,color adjusment by JuanoV
eeObj.WriteMem32(0x0053A68C, 0x00000000) --ghosting fix
eeObj.WriteMem32(0x207160F4, 0x3f030000) --color r
eeObj.WriteMem32(0x207160F8, 0x3f030000) --color g
eeObj.WriteMem32(0x207160FC, 0x3f030000) --color b
eeObj.SchedulerDelayEvent("vif0.dma", 0x6500) 
eeObj.SchedulerDelayEvent("gif.dma", 0x1000)
emuObj.ThrottleMax()
end
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {texMode=1} )
emuObj.AddVsyncHook(patcher)
emuObj.SetDisplayAspectWide()