--DOA 2 Hardcore NTSC JPN
--JakX v2

apiRequest(2.2)

local gpr       = require("ee-gpr-alias")
local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()
local eeOverlay    = eeObj.getOverlayObject()
local iopObj  = getIOPObject()

local patcher = function()

eeObj.WriteMem32(0x0021C4B0,0x3c014534) -- Widescreen
eeObj.WriteMem32(0x002B666C,0x24060000) -- Fixes game hanging on boot.
 
iopObj.WriteMem32(0x001D77E4,0x27C40010)
iopObj.WriteMem32(0x001D77E8,0x0C0032B7)   
iopObj.WriteMem32(0x001D77EC,0x00000000)   

-- No interlace
eeObj.WriteMem32(0x203A70A4,0x00000000)

end

emuObj.AddVsyncHook(patcher)

emuObj.PadSetLightBar(0,255,200,250)
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(0) 

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2  } )