-- Mortal Kombat: Deception (SLUS-20881)
-- Widescreen fix by nemesis2000
-- emu used=aofa

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--zoom for arcade mode (widescreen)
eeObj.WriteMem32(0x00222144,0x3c0342c0)

--aspect correction for widescreen mode
eeObj.WriteMem32(0x001875e4,0x3c0143f0)
eeObj.WriteMem32(0x001875e8,0x46800860)
eeObj.WriteMem32(0x001875ec,0x44810000)
eeObj.WriteMem32(0x001875f0,0x46150842)
eeObj.WriteMem32(0x001875f4,0x46000803)
eeObj.WriteMem32(0x001875f8,0x46140003)
--widescreen switch fix
eeObj.WriteMem32(0x00222320,0x24020340)
eeObj.WriteMem32(0x00222360,0x24020340)
--Unlock All Arenas by Code Master
eeObj.WriteMem32(0x205D4D08,0xFFFFFFFF)
--Unlock All Characters by Code Master
eeObj.WriteMem32(0x205D4E10,0xFFFFFFFF)
--Unlock All Puzzle Kombat Characters by Code Master
eeObj.WriteMem32(0x205D4E18,0xFFFFFFFF)
--Unlock All Costumes by Code Master
eeObj.WriteMem32(0x205E47A8,0xFFFFFFFF)
--Unlock All Soundtracks by Code Master
eeObj.WriteMem32(0x205E47B8,0xFFFFFFFF)
--Super Long Fatality Time by Code Master
eeObj.WriteMem32(0x0017027C,0x40004000)
eeObj.WriteMem32(0x001704A0,0x40004000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--black borders fix
eeInsnReplace(0x0017c5d0,0x46800020,0x46000001) -- cvt.s.w $f0, $f0
eeInsnReplace(0x0017c5e0,0x46800020,0x46000001) -- cvt.s.w $f0, $f0
eeInsnReplace(0x0017c620,0x46800020,0x46000001) -- cvt.s.w $f0, $f0
eeInsnReplace(0x0017c630,0x46800020,0x46000001) -- cvt.s.w $f0, $f0