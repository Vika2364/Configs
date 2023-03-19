-- NBA Street Vol.2 (NTSC-U)
-- Widescreen Hack by Ko81e24wy
-- ported to ps4 lua by Stayhye
-- emulator used=jak and daxter the precursor legacy

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen 16:9
eeObj.WriteMem32(0x208D6AA0,0x3F400000)
eeObj.WriteMem32(0x208D6AD8,0x3FA66666)
eeObj.WriteMem32(0x208D6ADC,0x3FA66666)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--math.random() + math.random(1, 99)