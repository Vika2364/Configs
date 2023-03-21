-- Alien Hominid PAL
-- 60fps /480p by jonaand
-- emu used=kof98um

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

emuObj.PadSetLightBar(0, 145, 255, 10)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

local WS = function()
--480p SDTV progresive 60fps--
eeObj.WriteMem32(0x00199ee4,0x3c090010)
eeObj.WriteMem32(0x00199c14,0x3c050000)
eeObj.WriteMem32(0x00199c1c,0x3c060050)
eeObj.WriteMem32(0x00199c24,0x3c070001)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)