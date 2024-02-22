-- D.I.C.E. (DNA Integrated Cybernetic Enterprises) SLUS21181
-- emu kof98um

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

--Blur FiX
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

local patcher = function()

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)