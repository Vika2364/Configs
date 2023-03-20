-- Airblade (PAL)
-- emu used=GTA3v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen
--Zoom
eeObj.WriteMem32(0x20130FC4,0x3C023CAF)

--Y-Fov
eeObj.WriteMem32(0x20130F5C,0x3C043F40)

--All Levels And Stunt Attacks Are Unlocked
eeObj.WriteMem32(0x20327CB8,0x00000001)
eeObj.WriteMem32(0x20327CD0,0x00000001)
eeObj.WriteMem32(0x20327CE8,0x00000001)
eeObj.WriteMem32(0x20327D00,0x00000001)
eeObj.WriteMem32(0x20327D18,0x00000001)

end

emuObj.AddVsyncHook(patcher)