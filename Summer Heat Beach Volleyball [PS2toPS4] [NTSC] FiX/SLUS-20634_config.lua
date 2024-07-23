-- Summer Heat - Beach Volleyball (SLUS_20634)
-- emu used=wotm 

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen hack

eeObj.WriteMem32(0x001b08a4,0x3c01464F) --3c014622 both FOV

eeObj.WriteMem32(0x001b0a38,0x3c01464F) --3c014622 render fix

eeObj.WriteMem32(0x001b0a58,0x3c013f9f) --3c013f6f vert fov
eeObj.WriteMem32(0x001b0a5c,0x3421ea28) --3421df3b

end

emuObj.AddVsyncHook(patcher)