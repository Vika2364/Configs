-- Tekken Tag Tournament (NTSC-J v3.00)
-- emu used=rogue v1

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patch = function()

-- Widescreen hack
eeObj.WriteMem32(0x0034b004,0x3c013f40)
eeObj.WriteMem32(0x0034b008,0x44810000)
eeObj.WriteMem32(0x0034b010,0x4600c602)

end

emuObj.AddVsyncHook(patch)