--Hitman 2 Silent Assassin (SLUS20374)
--emu used=Star Ocean v1

apiRequest(0.1)

local emuObj         = getEmuObject()
local eeObj            = getEEObject()

local fix = function()
--16:9 Widescreen
eeObj.WriteMem32(0x00313f7c,0x3c013f10) --3c013f40 vert FOV
eeObj.WriteMem32(0x002bbe18,0x3c1b3f40) --00000000 zoom
eeObj.WriteMem32(0x002bc00c,0x3c013f00) --3c013f80
eeObj.WriteMem32(0x002bc010,0x4481a800) --4481a000
eeObj.WriteMem32(0x002bc014,0x4615ad00) --3c013f00
eeObj.WriteMem32(0x002bc018,0x449bf000) --4481a800
eeObj.WriteMem32(0x002bc054,0x461e0002) --46150002
eeObj.WriteMem32(0x002bc058,0x46150002) --4600a583
eeObj.WriteMem32(0x002bc05c,0x4600a583) --e6200054
eeObj.WriteMem32(0x002bc060,0xe6200054) --3c01bf00
eeObj.WriteMem32(0x002bc064,0x4600a807) --44810000

end
emuObj.AddVsyncHook(fix)