-- Metal Gear Solid 3 - Subsistence (SLUS_21359)
-- Widescreen hack by No.47
-- 30 FPS/Speed Fix by applepiejr @PCSX2 Forums
-- emu used=star ocean v2

local gpr = require("ee-gpr-alias")

apiRequest(1.3)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
-- Force 30 FPS
eeObj.WriteMem32(0x001D5AD8,0x00000040) -- 40=30fps / 00=60fps / 20=15 or20fps? <camera>
eeObj.WriteMem32(0x001D6DB8,0x00000002) -- 01=60fps / 02=30fps / 3=20fps / 4=16.67fps? <cut-scenes/fmv>
eeObj.WriteMem32(0x001D6DBC,0x00000001) -- 0=double speed / 1=normal speed <gameplay>
-- 480p 512x448
eeObj.WriteMem32(0x201741F4,0x3C050000)
eeObj.WriteMem32(0x201741F8,0xFFB20020)
eeObj.WriteMem32(0x201741FC,0x3C060050)
eeObj.WriteMem32(0x20174200,0xFFB10010)
eeObj.WriteMem32(0x20174204,0x3C070001)
-- REMOVES MOST OF THEM, BUT SOME ARE NOW RED?
-- Remove Black Bars
local code_check = eeObj.ReadMem16(0x25E1CC)
if code_check == 0x0000 then
eeObj.WriteMem32(0x2025E6A4,0x00000000)
end
local code_check = eeObj.ReadMem16(0x20B3FC)
if code_check == 0x0001 then
eeObj.WriteMem32(0x2025E6A4,0x00000000)
end
local code_check = eeObj.ReadMem16(0x214D80)
if code_check == 0x0001 then
eeObj.WriteMem32(0x2025E6A4,0x00000000)
end
local code_check = eeObj.ReadMem16(0x214D70)
if code_check == 0x0001 then
eeObj.WriteMem32(0x2025E6A4,0x00000000)
end
----16:9---//Widescreen water fix
eeObj.WriteMem32(0x202050AC,0x3F400000)

local code_check = eeObj.ReadMem16(0x4CCD42)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x204CCD40,0x3FAB0000)
eeObj.WriteMem32(0x204CCD44,0x3F400000)
eeObj.WriteMem32(0x204CCD4C,0xBFAB0000)
end
local code_check = eeObj.ReadMem16(0x580CE2)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x20580CE0,0x3FAB0000)
eeObj.WriteMem32(0x20580CE4,0x3F400000)
eeObj.WriteMem32(0x20580CEC,0xBFAB0000)
end
local code_check = eeObj.ReadMem16(0x591C72)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x20591C70,0x3FAB0000)
eeObj.WriteMem32(0x20591C74,0x3F400000)
eeObj.WriteMem32(0x20591C7C,0xBFAB0000)
end
local code_check = eeObj.ReadMem16(0x599C12)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x20599C10,0x3FAB0000)
eeObj.WriteMem32(0x20599C14,0x3F400000)
eeObj.WriteMem32(0x20599C1C,0xBFAB0000)
end
local code_check = eeObj.ReadMem16(0x4A14D2)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x204A14D0,0x3FAB0000)
eeObj.WriteMem32(0x204A14D4,0x3F400000)
eeObj.WriteMem32(0x204A14DC,0xBFAB0000)
end
local code_check = eeObj.ReadMem16(0x557CFA)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x20557CF8,0x3FAB0000)
eeObj.WriteMem32(0x20557CFC,0x3F400000)
eeObj.WriteMem32(0x20557D04,0xBFAB0000)
end
local code_check = eeObj.ReadMem16(0x4B7082)
if code_check == 0x3F80 then
eeObj.WriteMem32(0x204B7080,0x3FAB0000)
eeObj.WriteMem32(0x204B7084,0x3F400000)
eeObj.WriteMem32(0x204B708C,0xBFAB0000)
end

end

emuObj.AddVsyncHook(patcher)

emuObj.SetDisplayAspectWide()

-- Fix shadow
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } )