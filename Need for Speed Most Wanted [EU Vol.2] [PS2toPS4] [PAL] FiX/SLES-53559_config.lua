-- Need for Speed Most Wanted (PAL)
-- kof98um

apiRequest(1.0)

local emuObj    = getEmuObject()
local eeObj     = getEEObject()

local patcher = function()
--Disable some fx DepthIntoAlpha,smear,etc by Jvn9207
eeObj.WriteMem32(0x005503EC,0x0)
eeObj.WriteMem32(0x005503F0,0x0)
eeObj.WriteMem32(0x00550424,0x0)
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 200000} )