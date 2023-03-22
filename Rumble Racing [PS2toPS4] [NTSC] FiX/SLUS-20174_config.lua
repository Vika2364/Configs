--gametitle= Rumble Racing - SLUS_201.74 [NTSC-U]
--comment=Widescreen Hack
--emu=ADK

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x00154984,0x3C023F40)

emuObj.ThrottleMax() 
end

emuObj.AddVsyncHook(patcher)