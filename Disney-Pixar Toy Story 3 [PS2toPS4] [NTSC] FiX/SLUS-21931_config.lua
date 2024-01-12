-- Disney-Pixar's Toy Story 3 (SLUS21931)
-- Widescreen by Arapapa
-- Jak v2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9

--Zoom fix (Internal Widescreen)
--aa3f033c 00188444 713d6334
eeObj.WriteMem32(0x004f6ee8,0x3c033f80)
eeObj.WriteMem32(0x004f6ef0,0x34630000)

end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) 
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } ) 

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )