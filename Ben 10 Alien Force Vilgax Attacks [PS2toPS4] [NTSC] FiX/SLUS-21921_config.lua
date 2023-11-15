-- Ben 10 - Alien Force - Vilgax Attacks (U)(SLUS-21921)
-- emu used=art of fighting anthology

apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

--60 fps
eeInsnReplace(0x201002F4,0x45000011,0x10000011)

local patcher = function()
--Gameplay 16:9
eeObj.WriteMem32(0x20741A54,0x3FE38E38) --3FAAAAAB (Increases hor. axis)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)