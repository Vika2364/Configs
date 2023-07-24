-- Speed Racer NTSC
-- Widescreen hack by pelvicthrustman
-- emu used=kof98um

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local iopObj      = getIOPObject()

emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)
emuObj.ForceRefreshRate(60)

--In-game stutter removal
eeObj.AddHook(0x00127590,0x3c033f80,function() -- lui v1, $3f80
       eeObj.AdvanceClock(18000)
end)  

local WS2 = function()
--16:9
eeObj.WriteMem32(0x004c314c,0x3c013f00) --00000000
eeObj.WriteMem32(0x004c315c,0x4481f800) --00000000
eeObj.WriteMem32(0x004c31b0,0x461f0003) --46000803

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS2)

--blur fix
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2  } )