--Musashi - Samurai Legend (NTSC-U) (SLUS-20983)
--emu used=Star Wars Racer's Revenge v1

apiRequest(0.4)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen Hack
eeObj.WriteMem32(0x203DD108,0x3F19999A) --3F4CCCCD

--SPS FiX
eeObj.WriteMem32(0x001476A4,0x10000047) --10600047
eeObj.WriteMem32(0x002E8D78,0x8000033C) --80005EFC

end
emuObj.AddVsyncHook(patcher)