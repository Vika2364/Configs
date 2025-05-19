--Shadow Tower Abyss (English patch)
--widescreen values from pnach (set to 16:9 in-game)
--emu used=eternal ring v1

apiRequest(1.0)

local gpr        = require("ee-gpr-alias")
local eeObj      = getEEObject()
local emuObj      = getEmuObject()

local patcher = function()

--widescreen
eeObj.WriteMem32(0x201F2790,0x3F400000) -- HUD
eeObj.WriteMem32(0x201FA0C8,0x3F800000) -- zoom
eeObj.WriteMem32(0x204A0F84,0x3F400000) -- subtitles

end

emuObj.AddVsyncHook(patcher)