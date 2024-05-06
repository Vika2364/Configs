-- Futurama [SLES-51507] (E)
-- emu used=KOF 2000 v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
local emuObj = getEmuObject()

-- 16:9
eeInsnReplace(0x00101eac, 0xe60100b4, 0x0812aca8)
eeInsnReplace(0x00101eb0, 0xe60000b0, 0x00000000)
eeInsnReplace(0x004ab2a0, 0x00000000, 0x3c013f40)
eeInsnReplace(0x004ab2a4, 0x00000000, 0x4481f000)
eeInsnReplace(0x004ab2a8, 0x00000000, 0x461e0003)
eeInsnReplace(0x004ab2ac, 0x00000000, 0xe60100b4)
eeInsnReplace(0x004ab2b0, 0x00000000, 0xe60000b0)
eeInsnReplace(0x004ab2b4, 0x00000000, 0x080407ac)

local patcher = function()

-- Forces progressive scan at startup by PeterDelta
eeObj.WriteMem32(0x003EA94C,0x24110000)
eeObj.WriteMem32(0x003EA950,0x24120050)
eeObj.WriteMem32(0x003EA95C,0x24130001)

end

emuObj.AddVsyncHook(patcher)