-- Crash Nitro Kart NTSC
-- emu used=jakx v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()
local eeOverlay    = eeObj.getOverlayObject()
local iopObj  = getIOPObject()

emuObj.PadSetLightBar(0, 255,0,255)
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)
gsObj.SetUprenderMode(1) -- 0=none <> 1=2x2
emuObj.SetDeinterlace(true)

local patcher = function()
--16:9
eeObj.WriteMem32(0x0058bcf8,0x3c023f40) -- 0x3c023f00 - hor. axis
eeObj.WriteMem32(0x0058bd0c,0x3c023f40) -- 0x3c023f00 -- zoom
--freeze fix
eeObj.WriteMem32(0x003e8170,0)

eeObj.SchedulerDelayEvent("vif1.dma",0x5000)
emuObj.ThrottleMax() -- No negative.
end

emuObj.AddVsyncHook(patcher)