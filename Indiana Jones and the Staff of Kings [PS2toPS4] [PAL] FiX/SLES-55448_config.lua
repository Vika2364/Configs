-- Indiana Jones and the Staff of Kings PAL
-- Widescreen Hack by Arapapa
-- emu jakxv2

local gpr = require("ee-gpr-alias")

apiRequest(2.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
-- 16:9
eeObj.WriteMem32(0x001a3d40,0x3c033ec0) -- 3c033f00

-- 50 fps by asasega @PCSX2 forums

-- Press L1+Up  50fps on

if eeObj.ReadMem16(0x004F4282) == 0xFBEF then -- L1+Up
eeObj.WriteMem32(0x201505B4,0x2C620000) --0062102B
end

-- Press L1+Down 50fps off

if eeObj.ReadMem16(0x004F4282) == 0xFBBF then -- L1+Down
eeObj.WriteMem32(0x201505B4,0x0062102B) --0062102B
end

emuObj.ThrottleMax()
end

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )

emuObj.AddVsyncHook(patcher)