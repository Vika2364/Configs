-- Harry Potter and the Goblet of Fire PAL
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
--Widescreen hack 16:9
eeObj.WriteMem32(0x0029FD74,0x3C013FE3) --3C013FAA
eeObj.WriteMem32(0x0029FD78,0x34218E39) --3421AAAB

--mipmap fix(ps3 config)
eeObj.WriteMem32(0x002cf158,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)