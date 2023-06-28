--gametitle=Grand Theft Auto Liberty City Stories (SLES-54135)
--JakX v2

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--no interlace
eeObj.WriteMem32(0x2035F394,0x00000000)

--Infinite Run by Codejunkies
eeObj.WriteMem32(0x20349058,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

