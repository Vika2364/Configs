-- FIFA Soccer 2003 (U)(SLUS-20580)
-- emu used=rogue v2

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patch = function()
--Fix textures.
eeObj.WriteMem32(0x0030F5FC,0x10000079)

end

emuObj.AddVsyncHook(patch)