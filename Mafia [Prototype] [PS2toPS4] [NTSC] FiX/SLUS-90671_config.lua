-- Mafia (Sep 24, 2003 prototype)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--fix crash in The priest mission
eeObj.WriteMem32(0x0016F04C,0x1000000D) --1000000D

end

emuObj.AddVsyncHook(patcher)

-- Performace fix
local emuObj = getEmuObject()	
local thresholdArea = 600
emuObj.SetGsTitleFix( "ignoreUpRender", thresholdArea , {alpha=0x80008068 , zmsk=1 } )