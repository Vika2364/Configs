-- Disney's PK - Out of the Shadows
-- boot fix by kozarovv
-- Widescreen Hack by Arapapa
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local WS2 = function()
--16:9
eeObj.WriteMem32(0x003324b0,0xbf400000) --0x3f800000
--0x48c83000 >> ctc2 t0, $vi6
eeObj.WriteMem32(0x001dfa8c,0x4a0000b8)
eeObj.WriteMem32(0x001dfc24,0x4a0000b8)
eeObj.WriteMem32(0x001dfcac,0x4a0000b8)
eeObj.WriteMem32(0x001dfd00,0x4a000938)
eeObj.WriteMem32(0x001dffdc,0x4a000938)
eeObj.WriteMem32(0x001e003c,0x4a000938)
eeObj.WriteMem32(0x001e022c,0x4a000938)
eeObj.WriteMem32(0x001e028c,0x4a000938)
eeObj.WriteMem32(0x001e0348,0x4a000938)
-- No need to loop here, just e-bit and wait for vcallms from EE.
eeObj.WriteMem32(0x00324a90,0x8000033c) -- 500607ff
eeObj.WriteMem32(0x00324a94,0x400002ff)
eeObj.WriteMem32(0x00324bc0,0x8000033c)
eeObj.WriteMem32(0x00324bc4,0x400002ff)
-- skip videos
--eeObj.WriteMem32(0x0010ae80,0x24020001)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS2)

-- Fix vertical lines
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } )
