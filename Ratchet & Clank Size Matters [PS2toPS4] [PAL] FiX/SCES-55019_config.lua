-- Ratchet & Clank Size Matters (PAL)
-- emu used=wotm 

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Unlocked progressive Mode 480p by PeterDelta
eeObj.WriteMem32(0x01EF5718,0x00000001) --00000000 16:9 
eeObj.WriteMem32(0x01F4AB20,0x00000001) --00000000 16:9 From the beginning
eeObj.WriteMem32(0x01EF571C,0x00000000) --00000001 NTSC
eeObj.WriteMem32(0x01EF5720,0x00000001) --00000000 480

end

emuObj.AddVsyncHook(patcher)