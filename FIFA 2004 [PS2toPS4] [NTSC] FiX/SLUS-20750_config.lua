-- FIFA Soccer 2004 (U)(SLUS-20750)
-- emu used=rogue v2

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patch = function()
--Fix textures.
eeObj.WriteMem32(0x00338188,0x10000079)

end

emuObj.AddVsyncHook(patch)