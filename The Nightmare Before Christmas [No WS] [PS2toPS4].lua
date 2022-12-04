-- Tim Burton's The Nightmare Before Christmas Oogie's Revenge(PAL)(SLES-53192)
-- emu used=psychonauts v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--eeObj.SchedulerDelayEvent("gif.dma", 0x8500)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)
