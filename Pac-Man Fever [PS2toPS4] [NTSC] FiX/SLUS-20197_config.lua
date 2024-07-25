-- Pac-Man Fever (NTSC)
-- emu used=aofa

apiRequest(2.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

emuObj.SetDisplayAspectWide()
  
local Main = function()

end 

emuObj.AddVsyncHook(Main)