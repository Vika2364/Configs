-- 18 Wheeler - American Pro Trucker
-- boot fix by Kozarovv
-- widescreen by Stayhye(ported from PAL version by El_Patas)
-- ported to PS4 lua
-- emu used=psycho v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x001d4c3c, 0x3c013f40) -- 0x3c013f80
-- Skip debugger hook.
eeObj.WriteMem32(0x001EB2A0, 0x00000000)
eeObj.WriteMem32(0x001EB2A8, 0x10000003)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--math.random() + math.random(1, 99)