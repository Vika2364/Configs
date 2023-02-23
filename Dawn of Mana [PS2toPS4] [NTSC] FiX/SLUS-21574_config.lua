
-- Dawn of Mana NTSC
-- 60fps by Red-Tv @PCSX2 forums
-- ported to PS4
-- emu used=jakx v2

apiRequest(2.2)

local gpr       = require("ee-gpr-alias")
local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()
local eeOverlay    = eeObj.getOverlayObject()
local iopObj  = getIOPObject()
  

emuObj.PadSetLightBar(0, 100, 30, 230)
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)
--[[
Note: This patch(60FPS) will revert cutscenes back to 30fps in order to avoid sync issues. unfortunately, dialogues during gameplay still have sync issues
if the game feels too slow you can change the last line

eeObj.WriteMem32(0x205C8734,0x3eX00000

X= The higher the number the faster the game is
--]]
local WS = function()
--16:9
eeObj.WriteMem32(0x0012ae74,0x3c013f40)
--60 fps
eeObj.WriteMem32(0x00115AE8,0x14600003)
eeObj.WriteMem32(0x005C8734,0x3f800000)
local code_check1 = eeObj.ReadMem16(0xA137C4)
if code_check1 == 0x0001 then
eeObj.WriteMem32(0x20115AE8,0x00000000)
eeObj.WriteMem32(0x205C8734,0x3e400000)
end
emuObj.ThrottleMax() --reduce load times and screens
end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {tw=9, th=9, psm=49, zmsk=1 } )