-- Animaniacs - The Great Edgar Hunt (E)(SLES-52729)
-- Widescreen hack by Arapapa
-- ported to PS4
-- emu used=rogue v2

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patch = function()
--16:9
eeObj.WriteMem32(0x203018E0,0x3F891A2A) --3fb6cb8f
--50/60 fps
eeObj.WriteMem32(0x20343668,0x00000002)

end

emuObj.AddVsyncHook(patch)