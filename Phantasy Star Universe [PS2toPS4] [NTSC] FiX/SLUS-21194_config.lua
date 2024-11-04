-- Phantasy Star Universe (NTSC-U) (SLUS-21194)
-- Widescreen Hack (16:9) by TechieSaru
-- ported to PS4 by Drobovik
-- emu used=jakx v2

local gpr = require("ee-gpr-alias")
apiRequest(0.1)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen 16x9
local code_check = eeObj.ReadMem16(0x277960)
if code_check == 0xFF90 then
eeObj.WriteMem32(0x20277994,0x08030000)
eeObj.WriteMem32(0x200C0000,0x3C023F40)
eeObj.WriteMem32(0x200C0004,0x44820000)
eeObj.WriteMem32(0x200C0008,0xC4810000)
eeObj.WriteMem32(0x200C000C,0x46000842)
eeObj.WriteMem32(0x200C0010,0xE4810000)
eeObj.WriteMem32(0x200C0014,0x0C0A0F4C)
eeObj.WriteMem32(0x200C001C,0x0809DE67)
end
--Battle Cursor Fix
local code_check = eeObj.ReadMem16(0x2ACF80)
if code_check == 0xFF80 then
eeObj.WriteMem32(0x202ACFD4,0x3C02BF40)
end
--Remove Cutscene Letterboxing
--local code_check = eeObj.ReadMem16(0x2D24C0)
--if code_check == 0xFFB0 then
--eeObj.WriteMem32(0x202D2560,0x44801000)
--eeObj.WriteMem32(0x202D2570,0x44802000)
--end

 emuObj.ThrottleMax()

end
emuObj.AddVsyncHook(patcher)