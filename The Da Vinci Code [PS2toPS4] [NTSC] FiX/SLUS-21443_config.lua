-- The Da Vinci Code SLUS-21443
-- Widescreen hack
-- emu used=kof98um

require( "ee-gpr-alias" ) -- you can access EE GPR by alias (gpr.a0 / gpr["a0"])

apiRequest(0.1)   
 
local emuObj  = getEmuObject()
local eeObj  = getEEObject()

emuObj.SetDisplayAspectWide()

local patcher =  function()
--16:9
eeObj.WriteMem32(0x003ae5d8,0x3c023f40)

emuObj.ThrottleMax()
end
 
emuObj.AddVsyncHook(patcher)