-- Splatter Master
-- emu used=harvest moon STHL

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9
eeObj.WriteMem32(0x00138144,0x3c023f40) -- 3c023f80

eeObj.WriteMem32(0x001c5fcc,0x3c024466) -- 3c024499
eeObj.WriteMem32(0x001c5fd4,0x34427000) -- 3442a000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)