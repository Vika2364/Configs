-- Battlestar Galactica SLES_517.02
-- ported to PS4
-- emu used=rotk v1

apiRequest(0.1)

local eeObj    = getEEObject()
local emuObj    = getEmuObject()

--16:9 A
eeInsnReplace(0x00102354, 0x3c013f99, 0x3c013f66) -- Gameplay
eeInsnReplace(0x00102358, 0x3421999a, 0x34216666)

local patcher = function()
--16:9 B
eeObj.WriteMem32(0x001cb818,0x3c013f66) --menu
eeObj.WriteMem32(0x001cb81c,0x34216666)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)