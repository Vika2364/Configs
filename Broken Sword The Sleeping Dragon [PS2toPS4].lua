-- Broken Sword The Sleeping Dragon
-- emu used=ADK

apiRequest(1.0)

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen
eeObj.WriteMem32(0x001ad9cc,0x3c01bec0)
eeObj.WriteMem32(0x001ad9d0,0x0c06b250)
eeObj.WriteMem32(0x001ad9d4,0x44813000)

eeObj.WriteMem32(0x001ac93c,0x00000000)
eeObj.WriteMem32(0x001ac940,0x27bdffd0)
eeObj.WriteMem32(0x001ac944,0x3c01bf00)
eeObj.WriteMem32(0x001ac948,0x44813800)
eeObj.WriteMem32(0x001ac94c,0x7fb00020)
eeObj.WriteMem32(0x001ac950,0xffbf0010)
eeObj.WriteMem32(0x001ac954,0x0080802d)
eeObj.WriteMem32(0x001ac958,0x26060020)
eeObj.WriteMem32(0x001ac95c,0xc6000070)
eeObj.WriteMem32(0x001ac960,0x8e020004)
eeObj.WriteMem32(0x001ac964,0x46060202)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)