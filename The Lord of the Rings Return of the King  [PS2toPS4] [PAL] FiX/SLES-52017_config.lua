-- The Lord of the Rings - The Return of the King SLES-52017
-- emu used=art of fighting anthology

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x0014b13c,0x3c023f40) -- 3c023f80 hor fov

-- Fix hang at start
eeObj.WriteMem32(0x0011891C,0x00000000)

end

emuObj.AddVsyncHook(patcher)