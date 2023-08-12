--gametitle=Tetris Worlds (NTSC)
--emu used=rogue v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

end

emuObj.AddVsyncHook(patcher)