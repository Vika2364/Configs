-- Batman - Rise of Sin Tzu (Prototype) Aug 15 2003
-- emu used=recvx v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
--X-Fov
eeObj.WriteMem32(0x004ad5d8,0x3f5a7408) 
--Render Fix
eeObj.WriteMem32(0x00306928,0x3c023f40) 

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--60 fps
eeInsnReplace(0x20532748,0x00000002,0x00000001) 