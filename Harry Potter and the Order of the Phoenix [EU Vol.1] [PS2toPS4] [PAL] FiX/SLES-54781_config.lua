-- Harry Potter and The Order of the Phoenix (E)(SLES-54781)
-- Widescreen hack by Arapapa
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
--Widescreen hack 16:9
--Force turn on Internal Widescreen
eeObj.WriteMem32(0x004c42c8,0x24020002) --30420003
--Zoom fix
--003f013c 00108144 02000146 (2nd)
eeObj.WriteMem32(0x00354528,0x3c013f20) --3c013f00
--Speed FiX
eeObj.SchedulerDelayEvent("vif1.dma", 0x1500)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)