-- Total Overdose (E)(SLES-53492)
-- emu used=ADK

apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--Widescreen hack 16:9

--00 00 80 3F 83 F9 22 3F DB 0F C9 3F 00 00 00 BF
eeObj.WriteMem32(0x20692A2C,0x3F47AE14) -- Zoom

--00 00 80 3F 00 00 00 00 00 00 00 00 2F 00 00 00
eeObj.WriteMem32(0x206C64C4,0x3F400000) -- Vert fov
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) 
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } ) 

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )