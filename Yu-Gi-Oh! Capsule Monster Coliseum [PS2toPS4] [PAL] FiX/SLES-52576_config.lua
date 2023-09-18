-- Yu-Gi-Oh! Capsule Monster Coliseum (PAL)
-- emu used=RECVX
apiRequest(0.1)	-- request version 0.1 API. Calling apiRequest() is mandatory.


local emuObj = getEmuObject()
local eeObj  = getEEObject()

local WS = function()


emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(WS)
