-- Wallace and Gromit - The Curse of the Were-Rabbit (U)(SLUS-21312)
-- Widescreen hack by Arapapa
-- ported to ps4 lua by Stayhye
-- emu used=kof98um

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDeinterlace(true)
emuObj.SetDisplayAspectWide()


--Zoom
eeInsnReplace(0x0011a4f4,0x3c013f00,0x3c013f1d) 
--Y-Fov
eeInsnReplace(0x0011a598,0x3c014040,0x3c014080) 


local patcher = function()

end

emuObj.AddVsyncHook(patcher)