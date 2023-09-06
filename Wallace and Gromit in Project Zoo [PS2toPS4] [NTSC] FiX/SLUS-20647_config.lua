-- Wallace and Gromit in Project Zoo (U)(SLUS-20647)
-- Widescreen hack by Arapapa
-- emu used=kof98um

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- psm= SCE_GS_PSMCT32 (0)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

emuObj.SetDeinterlace(true)
emuObj.SetDisplayAspectWide()

local patcher = function()
--Widescreen hack 16:9
eeObj.WriteMem32(0x00235f20,0x3c014080) --0x3c014040

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)