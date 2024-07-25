-- Pac-Man World 3 (PAL-M5)(SLES-53959)
-- Widescreen Hack by ICUP321
-- emu used=fatal fury battle archives vol2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Widescreen hack 16:9
eeObj.WriteMem32(0x003f30c4,0x3c013f40)
eeObj.WriteMem32(0x003f30c8,0x4481f000)
eeObj.WriteMem32(0x003f30d0,0x461eb582)
--Render fix
eeObj.WriteMem32(0x00439184,0x3c013f2b)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)