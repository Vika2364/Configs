-- Alpine Racer 3 (SCES50887)
-- Widescreen Hack by El_Patas
-- Jak v2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Gameplay 16:9
eeObj.WriteMem32(0x206A1E5C,0x3F199999) --3F800000 (Increases hor. axis)

--All Characters
eeObj.WriteMem32(0x20127620,0x20020001)

--All Tracks
eeObj.WriteMem32(0x20127598,0x20020001)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)