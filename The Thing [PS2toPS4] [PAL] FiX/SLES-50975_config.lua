-- The Thing PAL (SLES-50975)
-- Widescreen code found from @PCSX2 Forums
-- Ported to PS4 LUA
-- emu used=jakx v2

local gpr = require("ee-gpr-alias")

apiRequest(2.0)  

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Gameplay 16:9
eeObj.WriteMem32(0x0016EC34,0x3C023FE3) --3C023FAA
eeObj.WriteMem32(0x0016EC38,0x34428E38) --3442AAAB

eeObj.Vu1MpgCycles(500) 
emuObj.ThrottleMax() 

end

emuObj.AddVsyncHook(patcher)