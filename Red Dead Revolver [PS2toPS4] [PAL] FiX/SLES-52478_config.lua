-- Red Dead Revolver PAL
-- emu used=red dead

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()

--Blur/Post Processing removal
eeObj.WriteMem32(0x004C71F8,0x03e00008) -- 27BDFFF0
eeObj.WriteMem32(0x004C71FC,0x00000000) -- FFBF0000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )