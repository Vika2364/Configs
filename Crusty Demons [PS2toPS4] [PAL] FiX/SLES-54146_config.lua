-- Crusty Demons PAL
-- emu used=Red Faction

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patches = function()
--2nd freeze fix
eeObj.WriteMem32(0x006afd9c,0x1400fffa) -- 0x1440fffa >> bne v0, zero, $006afd88
--1st freeze fix
eeObj.WriteMem32(0x0076656c,0x1400ffec) -- 0x1440ffec >> bne v0, zero, $00766520

end

emuObj.AddVsyncHook(patches)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) 
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } ) 

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )