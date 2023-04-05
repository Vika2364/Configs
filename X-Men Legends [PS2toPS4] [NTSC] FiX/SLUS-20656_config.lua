-- X-Men Legends
-- emu used=jakx v2

apiRequest(2.2)

local gpr       = require("ee-gpr-alias")
local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()
local eeOverlay    = eeObj.getOverlayObject()
local iopObj  = getIOPObject()
 

emuObj.PadSetLightBar(0, 10,50,145)
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(0)

local WS = function()
--eeObj.WriteMem32(0x005cc888,0x3c023f34)
eeObj.WriteMem32(0x20720920,0x3FE147AE)  --In-game width widescreen 16:9
eeObj.WriteMem32(0x2072094c,0x3F000000)  --Fonts Width
eeObj.WriteMem32(0x20720950,0x3F000000)  --Fonts Height
eeObj.WriteMem32(0x20720958,0x3F8CCCCD)  --HUD & Menu Height
--eeObj.WriteMem32(0x20720954,0x3FA00000)  --HUD & Menu Width
eeObj.WriteMem32(0x20D85448,0x3F666666)  --HUD Height
eeObj.WriteMem32(0x20D85430,0x3F59999A)  --HUD Width

eeObj.Vu1MpgCycles(3450)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 100000} )
emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )