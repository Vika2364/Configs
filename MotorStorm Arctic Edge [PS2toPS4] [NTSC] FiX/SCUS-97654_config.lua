-- MotorStorm Arctic Edge (U)(SCUS-97654)
-- Force turn on Native Widescreen (Full boot passing) by Arapapa
-- emu used=jakx v2

apiRequest(2.3)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

local thresholdArea = 600
  
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1) 

local JC = function()
--16:9
eeObj.WriteMem32(0x00295e00,0x24020002) --30420003
--60 fps
eeObj.WriteMem32(0x2039BAF8,0x00000000)

emuObj.ThrottleMax()
end 

emuObj.AddEntryPointHook(JC)