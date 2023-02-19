-- Gun PAL SLES-53647
-- various fixes by kozarovv
-- emu used=redfaction

apiRequest(0.1)

local eeObj    = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- freeze fix
eeObj.WriteMem32(0x001A0CA8,0x100000a6) -- 0x120000a6 >> beq s0, zero, $001a11a4

-- rounding patch
eeObj.WriteMem32(0x00472F40,0xd3400000) -- 53400000

end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )