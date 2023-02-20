--emu used=red faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--disc 1 and 2
--freeze fix after ps2 logo
eeObj.WriteMem32(0x0014586c,0)
--Widescreen hack 16:9
eeObj.WriteMem32(0x0013b450,0x3c033f27) 
eeObj.WriteMem32(0x0013b4a0,0x3c013f40)
eeObj.WriteMem32(0x0013b4a4,0x4481a000)
eeObj.WriteMem32(0x0013b4a8,0x46146d83)
eeObj.WriteMem32(0x0013b4ac,0x46007546)
eeObj.WriteMem32(0x0013b4b0,0x46007e86)
--Cutscenes black borders fix
eeObj.WriteMem32(0x202A8578,0x24030000) --24030001
--HUD glitch fix 
eeObj.WriteMem32(0x2034DB28,0x45010027) 
eeObj.WriteMem32(0x2034DB9C,0x3C013F26)
eeObj.WriteMem32(0x2034DBA0,0x34216666)
eeObj.WriteMem32(0x2034DBA4,0xAE01054C)
eeObj.WriteMem32(0x2034DBA8,0x3C013F40)
eeObj.WriteMem32(0x2034DBAC,0xAE010550)
eeObj.WriteMem32(0x2034DBB0,0x2401FFF1)
eeObj.WriteMem32(0x2034DBB4,0xA6010548)
eeObj.WriteMem32(0x2034DBB8,0xA601054A)
eeObj.WriteMem32(0x2034DBBC,0x3C0F003A)
eeObj.WriteMem32(0x2034DBC0,0x25ED7E08)
eeObj.WriteMem32(0x2034DBC4,0x46021103)
eeObj.WriteMem32(0x2034DBC8,0x3C18003B)
eeObj.WriteMem32(0x2034DBCC,0x2708B0A0)

end

emuObj.AddVsyncHook(patcher)