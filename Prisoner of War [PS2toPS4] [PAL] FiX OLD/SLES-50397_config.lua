-- Prisoner of War (PAL)
-- emu used=default emu from the PS2 Classics GUI

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

--Widescreen hack 

--16:9
eeObj.WriteMem32(0x0039c3dc,0x0c1127e8)  --3c013f80
eeObj.WriteMem32(0x0039c3e0,0x00000000)  --4481a000
eeObj.WriteMem32(0x00449fa0,0x3c013f40)  --00000000 hor fov
eeObj.WriteMem32(0x00449fa8,0x4481a000)  --00000000
eeObj.WriteMem32(0x00449fac,0x46146b42)  --00000000
eeObj.WriteMem32(0x00449fb0,0x4614a503)  --00000000
eeObj.WriteMem32(0x00449fb4,0x03e00008)  --00000000
eeObj.WriteMem32(0x0013e6fc,0x3c0140c0)  --3c013f99 renderfix
eeObj.WriteMem32(0x001a6b60,0x3c013f2b)  --3c013f00 renderfix

--16:10
eeObj.WriteMem32(0x0039c3dc,0x0c1127e8)  --3c013f80
eeObj.WriteMem32(0x0039c3e0,0x00000000)  --4481a000
eeObj.WriteMem32(0x00449fa0,0x3c013f55)  --00000000 hor fov
eeObj.WriteMem32(0x00449fa4,0x34215555)  --00000000
eeObj.WriteMem32(0x00449fa8,0x4481a000)  --00000000
eeObj.WriteMem32(0x00449fac,0x46146b42)  --00000000
eeObj.WriteMem32(0x00449fb0,0x4614a503)  --00000000
eeObj.WriteMem32(0x00449fb4,0x03e00008)  --00000000
eeObj.WriteMem32(0x0013e6fc,0x3c0140a0)  --3c013f99 renderfix
eeObj.WriteMem32(0x001a6b60,0x3c013f1a)  --3c013f00 renderfix

end

emuObj.AddVsyncHook(patcher)