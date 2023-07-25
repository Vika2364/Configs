--gametitle=Ghost Rider [SLUS-21306]
--emu used=bully v.2

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()
local gsObj  = getGsObject()

local widescreen = function()

--Unlock All Cheats
eeObj.WriteMem32(0x206BD890,0x00000001)

--Unlock Movies
eeObj.WriteMem32(0x206BE628,0x00000001)
eeObj.WriteMem32(0x206BE668,0x00000001)
eeObj.WriteMem32(0x206BE6C8,0x00000001)
eeObj.WriteMem32(0x206BE728,0x00000001)

--Unlock Gallery
eeObj.WriteMem32(0x206BEB08,0x00000001)
eeObj.WriteMem32(0x206BEB68,0x00000001)
eeObj.WriteMem32(0x206BEBC8,0x00000001)
eeObj.WriteMem32(0x206BEE28,0x00000001)
eeObj.WriteMem32(0x206BEE88,0x00000001)

--Unlock Comics Codes
eeObj.WriteMem32(0x206BDD68,0x00000004)
eeObj.WriteMem32(0x206BDDA8,0x00000001)
eeObj.WriteMem32(0x206BDDE8,0x00000001)
eeObj.WriteMem32(0x206BDEC8,0x00000006)
eeObj.WriteMem32(0x206BDF48,0x00000003)
eeObj.WriteMem32(0x206BDF88,0x00000001)
eeObj.WriteMem32(0x206BDFC8,0x00000001)
eeObj.WriteMem32(0x206BE248,0x00000003)
eeObj.WriteMem32(0x206BE288,0x00000001)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(widescreen)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )  

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )  

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )