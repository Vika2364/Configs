-- The King of Fighters 2002 Unlimited Match (Tougeki Ver.) (NTSC-J)
-- emu used=aofa

apiRequest(0.1)

local gpr = require( "ee-gpr-alias" )

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--English (NEOGEO MODE) by lee4
eeObj.WriteMem32(0x005B4630,0x00000001)
--ALL CHARACTERS by lee4
eeObj.WriteMem32(0x005CA808,0x03FF03FF)
eeObj.WriteMem32(0x00000000,0x00000000)
-- Fix bug 10414 - large stretched polygons block view of player characters
eeObj.WriteMem32(0x000ffc00,0xf88a0000)
eeObj.WriteMem32(0x000ffc04,0xa080000b)
eeObj.WriteMem32(0x000ffc08,0x081079b3)
eeObj.WriteMem32(0x0041e6c4,0x0803ff00)
eeObj.WriteMem32(0x0041e6c8,0x4bea497d)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)