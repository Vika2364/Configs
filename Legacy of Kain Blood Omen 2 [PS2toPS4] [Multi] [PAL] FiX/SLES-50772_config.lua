-- Legacy of Kain - Blood Omen 2 [SLES-50772] (E)
-- emu used=KOF 2000 v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--ws
eeObj.WriteMem32(0x00311810,0x3c013fe3)
eeObj.WriteMem32(0x00311814,0x34218e38)
eeObj.WriteMem32(0x002e9ff0,0x240575e0)
eeObj.WriteMem32(0x002ea008,0x240a1440)
--mipmap fix
eeObj.WriteMem32(0x002F30A0,0x10000006)
--no interlace(incomplete) by Juano V
eeObj.WriteMem32(0x00462a14,0x00000000)
eeObj.WriteMem32(0x002F0350,0x00000000)
end
emuObj.AddVsyncHook(patcher)
local fix = function()
--skip debugger hook by Kozarovv
eeObj.WriteMem32(0x2967C0, 0x10000006)
eeObj.WriteMem32(0x2967B8, 0x00000000)
end
emuObj.AddEntryPointHook(fix)
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } ) --optional
emuObj.SetDisplayAspectWide()