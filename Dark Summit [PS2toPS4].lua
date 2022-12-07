-- Dark Summit
-- emu used=Fahrenheit
apiRequest(1.2)	-- request version 0.1 API. Calling apiRequest() is mandatory.

local emuObj = getEmuObject()
local eeObj  = getEEObject()

local WS = function()

--Widescreen hack 16:9

--X-Fov
--02000446 280100ae 42080546
eeObj.WriteMem32(0x003d2240,0x08030000) 

eeObj.WriteMem32(0x000c0000,0x46040002) 
eeObj.WriteMem32(0x000c0004,0x3c013f40) 
eeObj.WriteMem32(0x000c0008,0x00000000) 
eeObj.WriteMem32(0x000c000c,0x4481f000) 
eeObj.WriteMem32(0x000c0010,0x461e0002) 
eeObj.WriteMem32(0x000c0014,0x080f4891) 

--Render fix
--003f013c 00a88144 0000b07f
eeObj.WriteMem32(0x0036305c,0x3c013f2b) --3c013f00

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(WS)
