--The Shadow of Zorro - SLES50662
--fix  patch by kozarovv...posted by mrjaredbeta
--kof98um

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- fix  patch by kozarovv...posted by mrjaredbeta
eeInsnReplace(0x00378fe0, 0x27bdff80, 0x27bdf000)
eeInsnReplace(0x003795f0, 0x27bd0080, 0x27bd1000)

local patcher = function()

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)