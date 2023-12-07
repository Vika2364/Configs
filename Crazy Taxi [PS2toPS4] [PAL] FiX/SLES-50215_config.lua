-- Crazy Taxi [SLES-50215] (E)
-- emu used=KOF 2000

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x0018812c,0x3c013f40) --3c013f80 hor fov
eeObj.WriteMem32(0x0015e870,0x3c013f40) --00000000 renderfix
eeObj.WriteMem32(0x0015e880,0x4481f000) --3c013f80
eeObj.WriteMem32(0x0015e884,0x46010d03) --4481a000
eeObj.WriteMem32(0x0015e898,0x3210ffff) --00000000
eeObj.WriteMem32(0x0015e89c,0x2610ffff) --3210ffff
eeObj.WriteMem32(0x0015e8a0,0x0c066634) --2610ffff
eeObj.WriteMem32(0x0015e8a4,0x0200202d) --0c066634
eeObj.WriteMem32(0x0015e8a8,0x4600a003) --0200202d
eeObj.WriteMem32(0x0015e8ac,0x0200202d) --4600a003
eeObj.WriteMem32(0x0015e8b0,0x0c06660e) --0200202d
eeObj.WriteMem32(0x0015e8b4,0xe7809da8) --0c06660e
eeObj.WriteMem32(0x0015e8b8,0x461ea502) --e7809da8

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)