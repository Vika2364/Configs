-- Matt Hoffman's Pro BMX 2 (NTSC)
-- emu used=okage v1

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x001c5744,0x3c023fab)
eeObj.WriteMem32(0x0024d588,0x3c023c2e)
eeObj.WriteMem32(0x0036c108,0x3c033fc0)

end

emuObj.AddVsyncHook(patcher)