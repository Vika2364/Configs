-- Quake III - Revolution NTSC
-- Skip FMV 1 by Kozarovv (eeInsn)
-- Skip FMV 2 by Unknown (WriteMem)
-- emu used=rise of the kasai v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

eeInsnReplace(0x72C1E0, 0x63706D2E, 0x63706E2E)
eeInsnReplace(0x7226F4, 0x6D2E7374, 0x6E2E7374)

local patcher = function()
-- Sabotage movie file extension, causing it to skip
eeObj.WriteMem32(0x0072C1E1,0x00000061)
eeObj.WriteMem32(0x007226F7,0x00000061)
--mipmap fix(ps3 config)
eeObj.WriteMem32(0x002d0398,0x03e00008)
eeObj.WriteMem32(0x002d039c,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)