-- Harry Potter and the Goblet of Fire SLUS_213.25
-- Widescreen hack
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
--Widescreen hack 16:9
eeObj.WriteMem32(0x0029fd74,0x3c013fe3)
eeObj.WriteMem32(0x0029fd78,0x34218e39)

--mipmap fix(ps3 config)
eeObj.WriteMem32(0x002cf158,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)