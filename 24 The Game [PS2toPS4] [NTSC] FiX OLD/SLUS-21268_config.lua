-- 24 The Game NTSC
-- performace fix by kozarovv
-- ported to PS4
-- emu used=psychonauts v2

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9

--Force turn on the native widescreen
eeObj.WriteMem32(0x205FBD2C,0x00000001)

--Zoom Fix
--6000023c 2cbd428c 
eeObj.WriteMem32(0x002fbea0,0x3c020000)  --3c020060
eeObj.WriteMem32(0x002fbea4,0x34420000)

eeObj.WriteMem32(0x00139e2c,0x3c020000) --3c020060
eeObj.WriteMem32(0x00139e30,0x34420000) --8c42bd2c

--X-Fov (4:3)
--aa3f013c a8aa2134
--2a8e2134 e33f013c
--eeObj.WriteMem32(0x00460364,0x3c013fe3) --3c013faa
--eeObj.WriteMem32(0x00460368,0x34218e2a) --3421aaa8

--Fix slow and choppy gameplay
eeObj.WriteMem32(0x004155a8,0x48a44800)
eeObj.WriteMem32(0x004155ac,0x48c02800)
eeObj.WriteMem32(0x004155b0,0x4a00d839)

eeObj.WriteMem32(0x00415660,0x48a44800)
eeObj.WriteMem32(0x00415664,0x48c02800)
eeObj.WriteMem32(0x00415668,0x4a00d839)

end

emuObj.AddVsyncHook(patcher)