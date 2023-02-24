--Gungrave (NTSC-U) (SLUS-20493)
--Widescreen Hack + Cheats
--emu used=rogue v1

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--No-Interlacing
eeObj.WriteMem32(0x001af74c,0x00000000) --64420008
--Widescreen
eeObj.WriteMem32(0x001bec1c,0x3c013f40) --00000000
eeObj.WriteMem32(0x001bec20,0x44810000) --00000000
eeObj.WriteMem32(0x001bec28,0x4600c602) --00000000
eeObj.WriteMem32(0x00143504,0x2402010e) --24020168 renderfix

end
emuObj.AddVsyncHook(patcher)