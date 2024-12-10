-- Grand Theft Auto: San Andreas (SLES-52541)
-- emu used=gta sa

apiRequest(0.6)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--widescreen fix
eeObj.WriteMem32(0x001130BC,0x3C013F9D)
eeObj.WriteMem32(0x001130C0,0x44810000)
eeObj.WriteMem32(0x001130C4,0x46006302)
eeObj.WriteMem32(0x001130C8,0x03E00008)
eeObj.WriteMem32(0x001130CC,0xE78C9A90)

eeObj.WriteMem32(0x0021DFE4,0x0C044C2F) -- 0C044C30
eeObj.WriteMem32(0x00242DB4,0x0C044C32) -- 0C044C30
--graphics fix (bloom/ghosting) by Juano V
eeObj.WriteMem32(0x00668DE8,0x0)
eeObj.WriteMem32(0x00668D5C,0x0)
eeObj.WriteMem32(0x00668D60,0x0)
--fix vertical lines
eeObj.WriteMem32(0x006681E4,0x0)
end
emuObj.AddVsyncHook(patcher)