-- Contra Shattered Soldier NTSC
-- Widescreen Hack (16:9) by ElHecht
-- emu used=rogue v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
-- 16:9
eeObj.WriteMem32(0x005dbffc,0x3c013f40) --00000000 hor fov
eeObj.WriteMem32(0x005dc000,0x44810000) --00000000
eeObj.WriteMem32(0x005dc008,0x4600c602) --00000000
eeObj.WriteMem32(0x00677bf4,0x44d8aaab) -- 44a28000 increase enemy spawn point right
eeObj.WriteMem32(0x00677bf8,0xc4d8aaab) -- c4a28000 increase enemy spawn point left

--Infinite Credits
eeObj.WriteMem32(0x00912534,0x00630063)

end

emuObj.AddVsyncHook(patcher)