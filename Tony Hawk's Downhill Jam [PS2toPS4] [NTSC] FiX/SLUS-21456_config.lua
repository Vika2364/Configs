-- Tony Hawk's Downhill Jam NTSC (SLUS-21456)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--koza's vu rounding
eeObj.WriteMem32(0x003CC3B0,0xD3400000) --53400000

--freeze skip
eeObj.WriteMem32(0x001C6250,0x100000A6) -- 0x120000A6

--16:9
eeObj.WriteMem32(0x00127cd4,0x3c013f10)
eeObj.WriteMem32(0x00157dc4,0x3c013fe3)
eeObj.WriteMem32(0x00157dc8,0x34218e39)

--mtvu
eeObj.WriteMem32(0x001C4F2C,0x0803fff0) --000fffc0
eeObj.WriteMem32(0x000fffc0,0x0C07140C) --001C5030
eeObj.WriteMem32(0x000fffc4,0x24186000)
eeObj.WriteMem32(0x000fffc8,0x3c191200)
eeObj.WriteMem32(0x000fffcc,0x37391010)
eeObj.WriteMem32(0x000fffd0,0x2718ffff)
eeObj.WriteMem32(0x000fffd4,0x1418fffe)
eeObj.WriteMem32(0x000fffdc,0x080713CD) --001C4F34
eeObj.WriteMem32(0x000fffe0,0xaf200000)

--emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )