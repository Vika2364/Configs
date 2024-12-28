-- SSX 3 (SLUS_20772)
-- emu used=Default PS2 Emu

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Freeze fix
eeObj.WriteMem32(0x002EC824, 0x0)
eeObj.WriteMem32(0x002EC68C, 0x0)
end
emuObj.AddVsyncHook(patcher)