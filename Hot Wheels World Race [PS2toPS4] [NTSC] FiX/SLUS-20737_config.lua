-- Hot Wheels - World Race (U)(SLUS-20737)
-- Widescreen hack by Arapapa
-- fix ported from PS3CONFIG
-- ported to PS4

apiRequest(0.4)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patches = function()
--Widescreen hack 16:9

--X-Fov
--803f013c 00008144 1000b07f
eeObj.WriteMem32(0x0028ba2c,0x3c013fab)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patches)

--DC 7B 1A 00 0A BC 0A 0C 00 00 00 00

eeInsnReplace(0x001a7bdc, 0x0c0abc0a, 0x00000000)