-- Van Helsing (SLUS-20738)
-- Wide screen patch 16:9 by paul_met
-- emu used=jakx v2

apiRequest(2.2)

local gpr    		= require("ee-gpr-alias")

local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()
local eeOverlay 	= eeObj.getOverlayObject()
local iopObj        = getIOPObject()
    

emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1) 

local WS = function()
--16:9
eeObj.WriteMem32(0x002E7FA0,0x3FE38E38) 
--Access All Cheats by GameMasterZer0
eeObj.WriteMem32(0x2019FFB0,0x24100001)



emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)