--gametitle=Rygar The Legendary Adventure (PAL-M5) (SLES-51445)
--comment=Widescreen Hack by ElHecht
--JakX v2

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--16:9 
eeObj.WriteMem32(0x0020eb8c,0x3c013f40) -- 00000000 hor fov
eeObj.WriteMem32(0x0020eb90,0x4481f000) -- 00000000 
eeObj.WriteMem32(0x0020eb9c,0x461ec602) -- 00000000 
eeObj.WriteMem32(0x001efb7c,0x3c0144b0) -- 3c014480 renderfix 1
eeObj.WriteMem32(0x002076cc,0x3c013fab) -- 3c013f80 renderfix 2

--16:10 
--eeObj.WriteMem32(0x0020eb8c,0x3c013f55) -- 00000000 hor fov
--eeObj.WriteMem32(0x0020eb90,0x34215555) -- 00000000 hor fov
--eeObj.WriteMem32(0x0020eb98,0x4481f000) -- 00000000 
--eeObj.WriteMem32(0x0020eb9c,0x461ec602) -- 00000000 
--eeObj.WriteMem32(0x001efb7c,0x3c0144a0) -- 3c014480 renderfix 1
--eeObj.WriteMem32(0x002076cc,0x3c013f9a) -- 3c013f80 renderfix 2

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)