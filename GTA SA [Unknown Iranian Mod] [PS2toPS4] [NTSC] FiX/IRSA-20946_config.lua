-- Grand Theft Auto San Andreas (Unknown Iranian Mod)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--widescreen fix
eeObj.WriteMem32(0x001130BC,0x3C013F9D)
eeObj.WriteMem32(0x001130C0,0x44810000)
eeObj.WriteMem32(0x001130C4,0x46006302)
eeObj.WriteMem32(0x001130C8,0x03E00008)
eeObj.WriteMem32(0x001130CC,0xE78C9A90)

eeObj.WriteMem32(0x0021DFE4,0x0C044C2F)
eeObj.WriteMem32(0x00242DB4,0x0C044C32)

end

emuObj.AddVsyncHook(patcher)
