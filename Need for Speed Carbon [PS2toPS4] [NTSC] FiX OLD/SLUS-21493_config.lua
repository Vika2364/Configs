-- Need for Speed - Carbon (SLUS-21493)
-- -> use KOF2000 emu // PS4 Pro optimized (boost mode enabled)
-- MD5: 4F325C12F0D07E5C138CD779E0EF2F94

local gpr = require("ee-gpr-alias")
apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()
local patcher = function()

eeObj.WriteMem32(0x00263ab0,0x00000000) --overlay/uprender/speed fix
-- force 480p/progressive
eeObj.WriteMem32(0x005408bc,0x3c050000)
eeObj.WriteMem32(0x005408c4,0x3c060050)
eeObj.WriteMem32(0x005408cc,0x3c070001)
end

emuObj.AddVsyncHook(patcher)
emuObj.SetDisplayAspectWide() -- 16:9
-- Graphic improvement: removes corrupted lines on screen with uprender on for PAL/NTSC-U/NTSC-J version
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) --texMode=1