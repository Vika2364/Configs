-- Winback Covert Operations (SLUS20160)
-- Jak v2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
--eeObj.WriteMem32(0x00246cb8,0x3c013f40) -- 00000000 hor fov
--eeObj.WriteMem32(0x00246cbc,0x4481f000) -- 00000000 
--eeObj.WriteMem32(0x00246ccc,0x461eb583) -- 00000000 
--eeObj.WriteMem32(0x001c63a8,0x461e0002) -- 00000000 cross hairs position fix
--eeObj.WriteMem32(0x001c68c4,0x461ea302) -- 4600a306 cross hairs render fix

end

emuObj.AddVsyncHook(patcher)