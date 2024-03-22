-- Dragon Ball Z: Infinite World (NTSC)
-- emu used=jak v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x2052E6B0,0x3f23d706) --3f5a740e
eeObj.WriteMem32(0x2049C054,0x3f23d706) --3f5a740e
--fight intro freeze skip
eeObj.WriteMem32(0x00101054,0)

end

emuObj.AddVsyncHook(patcher)