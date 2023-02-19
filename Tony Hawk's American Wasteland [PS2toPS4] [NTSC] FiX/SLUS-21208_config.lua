-- Tony Hawk's American Wasteland NTSC (SLUS-21208)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--koza's vu rounding
eeObj.WriteMem32(0x00493B30,0xD3400000)

--freeze skip
eeObj.WriteMem32(0x001c52c8,0x100000a6) -- 0x120000a6

--mtvu
eeObj.WriteMem32(0x001C3FB4,0x0803fff0) --000fffc0
eeObj.WriteMem32(0x000fffc0,0x0C07102E) --001C40B8
eeObj.WriteMem32(0x000fffc4,0x24186000)
eeObj.WriteMem32(0x000fffc8,0x3c191200)
eeObj.WriteMem32(0x000fffcc,0x37391010)
eeObj.WriteMem32(0x000fffd0,0x2718ffff)
eeObj.WriteMem32(0x000fffd4,0x1418fffe)
eeObj.WriteMem32(0x000fffdc,0x08070FEF) --001C3FBC
eeObj.WriteMem32(0x000fffe0,0xaf200000)

--emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )