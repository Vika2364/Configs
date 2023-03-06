-- 007 From Russia with Love
-- emu used=eternal ring v2

local gpr = require("ee-gpr-alias")

apiRequest(1.5)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
-- Unlock All Characters
eeObj.WriteMem32(0x20A7D358,0xFFFFFFFF)

eeObj.WriteMem32(0x0040560c,0x46140002)
eeObj.WriteMem32(0x00405610,0x27a50030)
eeObj.WriteMem32(0x00405614,0x46010003)
eeObj.WriteMem32(0x00405618,0x3c013f40) --hor val
eeObj.WriteMem32(0x0040561c,0x44810800)
eeObj.WriteMem32(0x00405620,0x4601a503)
eeObj.WriteMem32(0x00405624,0xe7b40030)
eeObj.WriteMem32(0x00405628,0x46020002)
eeObj.WriteMem32(0x0040562c,0x0c0c87e6)
eeObj.WriteMem32(0x00405630,0xe7a00034)
eeObj.WriteMem32(0x00405634,0x7bb00050)
eeObj.WriteMem32(0x00405638,0xdfbf0040)
eeObj.WriteMem32(0x0040563c,0xc7b40060)
eeObj.WriteMem32(0x00405640,0x03e00008)
eeObj.WriteMem32(0x00405644,0x27bd0070)

eeObj.Vu1MpgCycles(500)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetDisplayAspectWide()

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } )