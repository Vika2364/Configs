-- Malice SLUS-20358
-- ps3 config by mrjaredbeta
-- jakv2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- ps3 config (Fixes slowdown)
-- 3D 00 00 00 57 44 00 00 0A 00 00 00 01 00 00 00
-- 74 5E 16 00  10 E1 62 AC  10 E1 60 AC

eeObj.WriteMem32(0x00165e74,0xac60e110)

-- no interlaced
eeObj.WriteMem32(0x002550bc,0x00000000) --64420008

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)

--gfx fix
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )