-- Dragon Ball Z: Budokai 3
-- emu used=ADK

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x2047CA50,0x3f23d706) -- 3F5A740E
eeObj.WriteMem32(0x20470434,0x3f23d706) -- 3F5A740E
--Unlock All Characters by bungholio, lee4, CMX
eeObj.WriteMem32(0x2046A668,0xFFFFFFFF)
eeObj.WriteMem32(0x2046A66C,0xFFFFFFFF)
--fight intro freeze skip
eeObj.WriteMem32(0x00100f54,0)

end

emuObj.AddVsyncHook(patcher)