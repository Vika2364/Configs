-- Harry Potter and the Philosopher's Stone (PAL)
-- Widescreen hack by ElHecht
-- emu used=rotk v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
-- 16:9
eeObj.WriteMem32(0x0018da74,0x3c013f40) -- e494d5c4 hor fov gameplay
eeObj.WriteMem32(0x0018da78,0xac81d5c4) -- 0c0c17e4
eeObj.WriteMem32(0x0018da80,0x0c0c17e4) -- 00000000

eeObj.WriteMem32(0x2036D5C4,0x3F400000) -- troll greenhouse battle

eeObj.WriteMem32(0x002b4258,0x3c013f40) -- 3c013faa hor fov cut-scenes 1
eeObj.WriteMem32(0x002b425c,0x4481f000) -- 3421aaab
eeObj.WriteMem32(0x002b426c,0x0c0abc0d) -- 0c0abc0e
eeObj.WriteMem32(0x002b4270,0x460d6343) -- 460d6342

eeObj.WriteMem32(0x002b453c,0x3c013f40) -- 3c013faa hor fov cut-scenes 2
eeObj.WriteMem32(0x002b4540,0x4481f000) -- 3421aaab
eeObj.WriteMem32(0x002b4554,0x0c0abc0d) -- 0c0abc0e
eeObj.WriteMem32(0x002b4558,0x460d6343) -- 460d6342

eeObj.WriteMem32(0x002af034,0x461e6302) -- 00000000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)