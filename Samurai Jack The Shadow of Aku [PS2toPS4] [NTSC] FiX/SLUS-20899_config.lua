-- Samurai Jack The Shadow of Aku (NTSC)
-- emu used=jak 3 v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local iopObj  = getIOPObject()

emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)
     
local patcher = function()
--16:9
eeObj.WriteMem32(0x0019884c,0x3c013f1a) -- 0x3c013f00
eeObj.WriteMem32(0x2040918c,0x43a80000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)