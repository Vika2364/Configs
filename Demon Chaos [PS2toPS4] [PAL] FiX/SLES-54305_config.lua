-- Demon Chaos (PAL-M5) (SLES-54305)
-- Crash fix by Kozarovv
-- emu used=jak2 v2

local gpr = require("ee-gpr-alias")

apiRequest(2.0)

local eeObj  = getEEObject()
local iopObj = getIOPObject()
local emuObj = getEmuObject()

local patcher = function()
-- 16:9
eeObj.WriteMem32(0x0017a87c,0x3c023f80) -- 3c023faa hor fov
eeObj.WriteMem32(0x0017a880,0x344a0000) -- 344aaaaa hor fov

--Disable Bloom 0x20= 25%, 0x40=50%
eeObj.WriteMem32(0x00244924,0x0)

--title screen crash fix
-- Skip -1 sector reads
iopObj.WriteMem32(0x0a7ed8, 0x0c07fffa)
iopObj.WriteMem32(0x1fffe8, 0x04800003)
iopObj.WriteMem32(0x1ffff0, 0x08029f58)
iopObj.WriteMem32(0x1ffff8, 0x03e00008)
iopObj.WriteMem32(0x1ffffc, 0x24020001)


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)