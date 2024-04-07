-- MTV's Celebrity Deathmatch (SLUS20604)
-- Jak v2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9
eeObj.WriteMem32(0x00211768,0x3c023f22)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)