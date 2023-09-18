-- Castlevania: Curse of Darkness (SLES_537.55)
-- Widescreen hack by nemesis2000
-- new graphics fix by kozarovv
-- emu used=Jak

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen
--gameplay
eeObj.WriteMem32(0x007526fc,0x3c013f40) --hor value
eeObj.WriteMem32(0x00752700,0x44810000)
eeObj.WriteMem32(0x00752708,0x4600c602)

--FMV's fix
eeObj.WriteMem32(0x004448d0,0x00000000)
eeObj.WriteMem32(0x00776718,0x24056d80)
eeObj.WriteMem32(0x00776724,0x24072380)

-- Clamp value manually. Clamping from emulator change value to FLT_MIN
-- While we need correct lower bits + 1 due to x86 rounding...
eeObj.WriteMem32(0x00931280, 0xFF7F8001)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)