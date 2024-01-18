-- Steambot Chronicles SLUS_213.44
-- Widescreen Hack & Blur Removal
-- ported to PS4 Lua
-- emu used=jakx v2

apiRequest(2.2)

local gpr             = require("ee-gpr-alias")
local emuObj       = getEmuObject()
local eeObj          = getEEObject()
local gsObj          = getGsObject()
local eeOverlay    = eeObj.getOverlayObject()
local iopObj        = getIOPObject()

local thresholdArea = 600

emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)

local patcher = function()

--Widescreen hack 16:9
eeObj.WriteMem32(0x001329c0,0x3c033f40)
eeObj.WriteMem32(0x00132818,0x3c0643d6)
--Extensive blur removal
eeObj.WriteMem32(0x0010fdd8,0x00000000)
eeObj.WriteMem32(0x0010fea4,0x00000000)

end

emuObj.AddVsyncHook(patcher)

-- Performace fix
emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 100000} )