-- Black and Bruised NTSC
-- Widescreen Hack by Arapapa
-- emu used=ADK

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Widescreen hack 16:9
eeObj.WriteMem32(0x001118b8,0x3c023ec0)
--Odiva by Code Master
eeObj.WriteMem32(0x20999F94,0x00000002)
--King Kahn by Code Master
eeObj.WriteMem32(0x20999FE4,0x00000002)
--Matador by Code Master
eeObj.WriteMem32(0x2099A004,0x00000002)
--Old Master by Code Master
eeObj.WriteMem32(0x2099A014,0x00000002)
--Trainer by Code Master
eeObj.WriteMem32(0x2099A024,0x00000002)
--Mickey McFist by Code Master
eeObj.WriteMem32(0x20999F0C,0x00000002)
--Knuckles Nadine by Code Master
eeObj.WriteMem32(0x20999F1C,0x00000002)
--Tiny by Code Master
eeObj.WriteMem32(0x20999F2C,0x00000002)
--Pharaoh by Code Master
eeObj.WriteMem32(0x20999F3C,0x00000002)
--Kid USA by Code Master
eeObj.WriteMem32(0x20999F4C,0x00000002)
--Royal Pain by Code Master
eeObj.WriteMem32(0x20999F5C,0x00000002)
--Bronto Sore by Code Master
eeObj.WriteMem32(0x20999F6C,0x00000002)
--Jackpot by Code Master
eeObj.WriteMem32(0x20999F7C,0x00000002)
--Holly Vixen by Code Master
eeObj.WriteMem32(0x20999F8C,0x00000002)
--Scrap Yard Scene Unlocked by Code Master
eeObj.WriteMem32(0x2099A91C,0x00000001)
--Conversation Mode Unlocked by Code Master
eeObj.WriteMem32(0x2099A92C,0x00000001)
--All Boxer's Life Unlocked by Code Master
eeObj.WriteMem32(0x2099A95C,0x00000001)
--Intercontinental Mode Unlocked by Code Master
eeObj.WriteMem32(0x2099A8EC,0x00000000)
--Second Skin Unlocked by Code Master
eeObj.WriteMem32(0x2099A8FC,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)