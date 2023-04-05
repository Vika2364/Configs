-- NBA Street Vol.3 (NTSC-U)
-- emulator used=jak and daxter the precursor legacy

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--math.random() + math.random(1, 99)