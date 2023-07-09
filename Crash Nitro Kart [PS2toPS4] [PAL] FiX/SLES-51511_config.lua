--Crash Nitro Kart PAL (SLES-51511)
--emu used=jakx v2

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
eeObj.WriteMem32(0x0058BF68,0x3C023F17) --3C023F00
--freeze fix
eeObj.WriteMem32(0x003E8C70,0) --1440FFE5
-- Press L1+Up 3 Opponents Races

if eeObj.ReadMem16(0x0185E602) == 0xFBEF then -- L1+Up
eeObj.WriteMem32(0x207C668C,0x00000003) --436E5C21
end

eeObj.SchedulerDelayEvent("vif1.dma",0x5000)
emuObj.ThrottleMax() -- No negative.
end

emuObj.AddVsyncHook(patcher)