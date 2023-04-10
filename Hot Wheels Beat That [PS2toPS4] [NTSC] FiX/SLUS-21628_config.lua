-- Hot Wheels - Beat That (U)(SLUS-21628)
-- Widescreen hack by Arapapa
-- emu ADK

apiRequest(1.0)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patches = function()
--Widescreen hack 16:9
eeObj.WriteMem32(0x00239da0,0x080a6824)

eeObj.WriteMem32(0x0029a090,0x46014843)
eeObj.WriteMem32(0x0029a094,0x3c013f40)
eeObj.WriteMem32(0x0029a098,0x4481f000)
eeObj.WriteMem32(0x0029a09c,0x461e0842)
eeObj.WriteMem32(0x0029a0a0,0x0808e769)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patches)

