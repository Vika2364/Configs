-- The Ant Bully PAL
-- emu used=red dead

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--blurry graphics fix
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1  } )
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2  } )