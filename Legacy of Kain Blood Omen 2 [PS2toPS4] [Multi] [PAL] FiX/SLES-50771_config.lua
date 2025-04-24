-- Legacy of Kain - Blood Omen 2 [SLES-50771] (E)
-- emu used=KOF 2000 v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--ws
eeObj.WriteMem32(0x00310BA0,0x3c013fe3)
eeObj.WriteMem32(0x00310BA4,0x34218e38)
eeObj.WriteMem32(0x002E9380,0x240575e0)
eeObj.WriteMem32(0x002E9398,0x240a1440)

--mipmap fix
eeObj.WriteMem32(0x002F2430,0x10000006)

--no interlace(incomplete) by Juano V
eeObj.WriteMem32(0x00461D2C,0x00000000) -- 64420008
eeObj.WriteMem32(0x002EF6E0,0x00000000) -- 30B40001

end

emuObj.AddVsyncHook(patcher)

local fix = function()
--skip debugger hook by Kozarovv
eeObj.WriteMem32(0x00295E38, 0x10000006)
eeObj.WriteMem32(0x00295E30, 0x00000000)
end

emuObj.AddEntryPointHook(fix)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } ) --optional