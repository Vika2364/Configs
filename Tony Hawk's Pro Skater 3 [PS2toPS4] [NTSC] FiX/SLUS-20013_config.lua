-- Tony Hawk's Pro Skater 3 NTSC (SLUS-20013)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--16:9
eeObj.WriteMem32(0x0017BEB8,0x3C013FF3) --3C013FB6
eeObj.WriteMem32(0x0017BEBC,0x3421CF00) --3421DB40
eeObj.WriteMem32(0x001F332C,0x3C013FF3) --3C013FB6
eeObj.WriteMem32(0x001F3330,0x3421CF00) --3421DB40
eeObj.WriteMem32(0x001F7D60,0x3C013FF3) --3C013FB6
eeObj.WriteMem32(0x001F7D64,0x3421CF00) --3421DB40
eeObj.WriteMem32(0x001F334C,0x3C013F73) --3C013F36
eeObj.WriteMem32(0x001F3350,0x3421CF00) --3421DB40
eeObj.WriteMem32(0x001F336C,0x3C014073) --3C014036
eeObj.WriteMem32(0x001F3370,0x3421CF00) --3421DB40

end

emuObj.AddVsyncHook(patcher)
