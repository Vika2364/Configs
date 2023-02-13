-- TimeSplitters Future Perfect (PAL)
-- gfx shimmer fix
-- needs better fix for graphics
-- ported to PS4
-- emu used=jakx v2

apiRequest(2.3)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

emuObj.PadSetLightBar(0, 45, 70, 200)
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)
emuObj.SetDeinterlace(true)

local TS3 = function()
--All Challenges
eeObj.WriteMem32(0x20306740,0x240FFFFF)
--All Cheats Open
eeObj.WriteMem32(0x203067A8,0x240EFFFF)
--All Story Levels Open
eeObj.WriteMem32(0x20306A38,0x240EFFFF)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(TS3)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )