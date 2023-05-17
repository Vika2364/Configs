-- Harry Potter and the Half-Blood Prince (PAL)
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
--Speed FiX
eeObj.SchedulerDelayEvent("vif1.dma", 0x1500)

end

emuObj.AddVsyncHook(patcher)