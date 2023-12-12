-- Crash Twinsanity [SLES-52568] (E)
-- emu used=KOF 2000

apiRequest(0.1)    -- request version 0.1 API. Calling apiRequest() is mandatory.

-- Fix random crashes
eeInsnReplace(0x1923E8,0x5440FFFB,0x00000000)
eeInsnReplace(0x1923EC,0x0071182F,0x00000000)
eeInsnReplace(0x1923F0,0x0223102F,0x00000000)

-- Eliminate color scan lines
local emuObj = getEmuObject()

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )