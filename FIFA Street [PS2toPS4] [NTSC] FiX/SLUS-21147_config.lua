-- FIFA Street (SLUS_21147)
-- emu used=Default PS2 Emu

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Unlock All Venues
eeObj.WriteMem32(0x20480704,0x00000001)
--Unlock All Kits
eeObj.WriteMem32(0x20480708,0x00000001)
--Unlock Players
eeObj.WriteMem32(0x20480710,0x00000001)
--Unlock Tournaments
eeObj.WriteMem32(0x2048070C,0x00000001)
end
emuObj.AddVsyncHook(patcher)