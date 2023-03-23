-- Kingdom Hearts - Re - Chain of Memories (SLUS21799)
-- Widescreen by asmodean
-- 60 FPS Ladder Fix by Sirius902
-- Bergolino gamer... Fix SPS
-- Jak v2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

eeObj.WriteMem32(0x20b470,0x0)        -- 10600047            --     Fix SPS 
eeObj.WriteMem32(0x34aa50,0x0)        -- 80005efc  xgkick

eeObj.WriteMem32(0x203328BC,0x3F19999A) --Widescreen(16:9)

eeObj.WriteMem32(0x004386B0,0x00000000) --60 FPS

eeObj.WriteMem32(0x0021D6CC,0x3C013FC6) --60 FPS Ladder Fix by Sirius902
eeObj.WriteMem32(0x0021D71C,0x3C01BFC6)
eeObj.WriteMem32(0x001E1870,0x087FFFD4)
eeObj.WriteMem32(0x001E1874,0x00000000)
eeObj.WriteMem32(0x01FFFF50,0x3C050033)
eeObj.WriteMem32(0x01FFFF54,0x34A5C720)
eeObj.WriteMem32(0x01FFFF58,0x8CA50000)
eeObj.WriteMem32(0x01FFFF5C,0x24A502E8)
eeObj.WriteMem32(0x01FFFF60,0x8CA50000)
eeObj.WriteMem32(0x01FFFF64,0x38A50002)
eeObj.WriteMem32(0x01FFFF68,0x10A00003)
eeObj.WriteMem32(0x01FFFF6C,0x00000000)
eeObj.WriteMem32(0x01FFFF70,0x0C078556)
eeObj.WriteMem32(0x01FFFF74,0x0000282D)
eeObj.WriteMem32(0x01FFFF78,0x0807861E)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )  

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )