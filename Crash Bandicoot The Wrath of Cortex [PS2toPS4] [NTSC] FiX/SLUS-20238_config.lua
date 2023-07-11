-- Crash Bandicoot The Wrath of Cortex [SLUS-20238] (U)
-- emu used=KOF 98

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--16:9 hack
eeObj.WriteMem32(0x001138B8,0x3c013f11) --vertical fov
eeObj.WriteMem32(0x001127A0,0x3c013f2a) --zoom value
eeObj.WriteMem32(0x0011287C,0x3c013f2a) --render value

--No interlace
eeObj.WriteMem32(0x2016A048,0xAF80E750) 
eeObj.WriteMem32(0x2016A054,0xAF80E750)

--Underwater FX Fix
eeObj.WriteMem32(0x202438AC,0x0000182D) 

--Mech FX Fix
eeObj.WriteMem32(0x20257CF0,0x0000182D) 

--Cortex Vortex FX Fix
eeObj.WriteMem32(0x20242894,0x100000BC) 

--Disable Dark Effect
eeObj.WriteMem32(0x20258588,0x44801000) 

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } ) --texMode=1
