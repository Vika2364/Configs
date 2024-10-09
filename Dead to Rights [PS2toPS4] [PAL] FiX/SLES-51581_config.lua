-- Dead to Rights [SCES-51581] (E)
-- Widescreen hack by Arapapa
-- Jak v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9

--Force turn on Widescreen
--00 00 00 00 01 00 00 00 AB AA AA 3F 00 00 80 3F
eeObj.WriteMem32(0x2042FBE0,0x00000001)

--Zoom fix
--29 5C 8F 3F 00 00 C0 43 00 00 C0 43
eeObj.WriteMem32(0x2042FBF4,0x3f800000) --3f8f5c29

end

emuObj.AddVsyncHook(patcher)