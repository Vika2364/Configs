-- Crimson Tears PAL
-- ported to PS4
-- emu used=jakx v2

apiRequest(2.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
-- 16:9
--eeObj.WriteMem32(0x001bcb78,0x3c02bfe3) -- 3c02bfaa hor fov
--eeObj.WriteMem32(0x001bcb80,0x34438e39) -- 3443aaab hor fov

-- 16:10
eeObj.WriteMem32(0x001bcb78,0x3c02bfcc) -- 3c02bfaa hor fov
eeObj.WriteMem32(0x001bcb80,0x3443cccd) -- 3443aaab hor fov 

--Remove Ghosting and Bloom (Original PAL)
eeObj.WriteMem32(0x006544B8,0x00000000)
---------------Cheats--------------------
--Access All Levels From Teleporter
eeObj.WriteMem32(0x003AEA34,0x00000007)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)