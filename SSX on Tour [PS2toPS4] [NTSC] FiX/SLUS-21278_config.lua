-- SSX On Tour NTSC
-- freeze fix by stayhye
-- emu used=psychonauts v1

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

--emuObj.SetDisplayAspectWide()

local WS = function()
--freeze fix
eeObj.WriteMem32(0x002ca41c,0) -- 0x1440fffa >> bne v0, zero, $002ca408

--Unlock All Quickplay Characters by MadCatz
eeObj.WriteMem32(0x205AE52C,0x00000001)

--Unlock All Movies by Code Master
eeObj.WriteMem32(0x2053C064,0x00000000)

--Unlock All Characters by Code Master
eeObj.WriteMem32(0x2053BF60,0x00000000)
--Monsters Are Loose by Code Master
eeObj.WriteMem32(0x204BA964,0x00000001)

--Snowball Fight by Code Master
eeObj.WriteMem32(0x204BA968,0x00000001)

--Feel The Power by Code Master
eeObj.WriteMem32(0x204BA96C,0x00000001)

--Show Time by Code Master
eeObj.WriteMem32(0x205AE528,0x00000001)

--Characters Are Loose by Code Master
eeObj.WriteMem32(0x205AE52C,0x00000001)

--The World Is Yours by Code Master
eeObj.WriteMem32(0x205AE530,0x00000001)

--New Threads by Code Master
eeObj.WriteMem32(0x205AE538,0x00000001)

--Bling Bling by Code Master
eeObj.WriteMem32(0x205AE53C,0x00000001)

--Enable Freeride by Codejunkies
eeObj.WriteMem32(0x205AE530,0x00000001)

--Unlock Clothing Rewards by Codejunkies
eeObj.WriteMem32(0x205AE538,0x00000001)

--emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)