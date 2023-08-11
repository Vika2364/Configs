--gametitle=Ghost Rider [SLES-54317]
--emu used=bully v.2

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()
local gsObj  = getGsObject()

local widescreen = function()

--Unlock All Cheats
eeObj.WriteMem32(0x206BDA10,0x00000001)

--Unlock Movies
eeObj.WriteMem32(0x206BE7A8,0x00000001)
eeObj.WriteMem32(0x206BE7E8,0x00000001)
eeObj.WriteMem32(0x206BE848,0x00000001)
eeObj.WriteMem32(0x206BE8A8,0x00000001)

--Unlock Gallery
eeObj.WriteMem32(0x206BEC88,0x00000001)
eeObj.WriteMem32(0x206BECE8,0x00000001)
eeObj.WriteMem32(0x206BED48,0x00000001)
eeObj.WriteMem32(0x206BEFA8,0x00000001)
eeObj.WriteMem32(0x206BF008,0x00000001)

--Unlock Comics Codes
eeObj.WriteMem32(0x206BDEE8,0x00000004)
eeObj.WriteMem32(0x206BDF28,0x00000001)
eeObj.WriteMem32(0x206BDF68,0x00000001)
eeObj.WriteMem32(0x206BE048,0x00000006)
eeObj.WriteMem32(0x206BE0C8,0x00000003)
eeObj.WriteMem32(0x206BE108,0x00000001)
eeObj.WriteMem32(0x206BE148,0x00000001)
eeObj.WriteMem32(0x206BE3C8,0x00000003)
eeObj.WriteMem32(0x206BE408,0x00000001)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(widescreen)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) 
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } ) 

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )