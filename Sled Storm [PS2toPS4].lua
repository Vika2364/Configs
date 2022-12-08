-- Sled Storm (NTSC)
-- emu used=aofa

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- Fix for thin vertical lines that separate screen picture, misallignment/tearing of screen during upscaling
-- psm= SCE_GS_PSMCT32 (0)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

local patcher = function()

--All Characters
eeObj.WriteMem32(0x20B0CD40,0x01010101)
eeObj.WriteMem32(0x20B0CD44,0x01010101) 
eeObj.WriteMem8(0x20B0CD48,0x01)
--All Levels
eeObj.WriteMem8(0x20B0CD49,0x01)
eeObj.WriteMem16(0x20B0CD4A,0x0101) 
eeObj.WriteMem16(0x20B0CD4C,0x0101) 
eeObj.WriteMem8(0x20B0CD4E,0x01)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)