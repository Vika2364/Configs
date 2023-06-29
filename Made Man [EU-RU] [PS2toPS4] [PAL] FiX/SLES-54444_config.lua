-- Made Man - Confessions of the Family Blood (E)(SLES-54444)
-- Widescreen Hack by Arapapa
-- ported to PS4
-- emu used=swjsf v1

apiRequest(0.1)   
 
local emuObj  = getEmuObject()
local eeObj  = getEEObject()

--emuObj.SetDisplayAspectWide()

local patcher =  function()
--Widescreen hack 16:9
--Y-Fov
eeObj.WriteMem32(0x00152E08,0x3c013fab) --3c013f80
--Zoom
eeObj.WriteMem32(0x002203E0,0x3c013f20) --3c013f00
--Black Bar Fix
eeObj.WriteMem32(0x00100b8c,0x3c010000) --3c014420 Bottom
eeObj.WriteMem32(0x00100ba0,0x3c010000) --3c014270 Upper
--Black Scene Fix
--f043013c 00a08144 2d200002
eeObj.WriteMem32(0x00100e2c,0x3c010000) --3c0143f0
--Zoom (Event, Menu)  3F508228
eeObj.WriteMem32(0x001B2D78,0x3c013ee0) --0x3c013f1c
eeObj.WriteMem32(0x001B2D7C,0x342180ff) --0x342161ab

emuObj.ThrottleMax()
end
 
emuObj.AddVsyncHook(patcher)