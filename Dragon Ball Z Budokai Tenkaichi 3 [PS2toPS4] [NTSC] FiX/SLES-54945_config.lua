-- DragonBall Z - Budokai Tenkaichi 3 SLES_549.45
-- Jak v2

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen Hack
eeObj.WriteMem32(0x002ff8fc,0x3fe38e34)
eeObj.WriteMem32(0x00130d08,0x3c013f10)
--Speed improvement
eeObj.WriteMem32(0x2025FCF0,0x10000008)
eeObj.WriteMem32(0x201E4494,0x3C013F80)
--Unlock all characters
eeObj.WriteMem32(0x206b8d90,0xffffffff)
eeObj.WriteMem32(0x206b8d94,0xffffffff)
eeObj.WriteMem32(0x206b8d98,0xffffffff)
eeObj.WriteMem32(0x206b8d9c,0xffffffff)
eeObj.WriteMem32(0x206b8da0,0xffffffff)
eeObj.WriteMem32(0x206b8da4,0x000001ff)
--Have 7 dragon balls
eeObj.WriteMem32(0x206b8188,0x0000007f)
--Dragon history unlocked
eeObj.WriteMem32(0x2033AD14,0x24020001)
eeObj.WriteMem32(0x203358B4,0x2403FFFF)
--All stages unlocked
eeObj.WriteMem32(0x206b8da8,0xffffFFFF)
eeObj.WriteMem32(0x206b8dac,0x00000007)
--Disable fx ki (Duel)
eeObj.WriteMem32(0x21995104,0x00000000)
emuObj.ThrottleFast()   --> if you change it to max, it lags.
end

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )  --> fix outlines

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )  --> fix outlines

emuObj.AddVsyncHook(patcher)