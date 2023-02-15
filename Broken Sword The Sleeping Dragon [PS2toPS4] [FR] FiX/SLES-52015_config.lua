-- Broken Sword: The Sleeping Dragon (SLES_520.15)(FR)
-- emu used=ADK

apiRequest(1.0)

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen
eeObj.WriteMem32(0x001AD5EC,0x3c01bec0) -- 0x00000000
eeObj.WriteMem32(0x001AD5F0,0x0C06B158)
eeObj.WriteMem32(0x001AD5F4,0x44813000) -- 0x00000000

eeObj.WriteMem32(0x001AC55C,0x00000000)
eeObj.WriteMem32(0x001AC560,0x27bdffd0)
eeObj.WriteMem32(0x001AC564,0x3c01bf00)
eeObj.WriteMem32(0x001AC568,0x44813800)
eeObj.WriteMem32(0x001AC56C,0x7fb00020)
eeObj.WriteMem32(0x001AC570,0xffbf0010) 
eeObj.WriteMem32(0x001AC574,0x0080802d) 
eeObj.WriteMem32(0x001AC578,0x26060020)
eeObj.WriteMem32(0x001AC57C,0xc6000070)
eeObj.WriteMem32(0x001AC580,0x8e020004)
eeObj.WriteMem32(0x001AC584,0x46060202) --0x46070202

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)