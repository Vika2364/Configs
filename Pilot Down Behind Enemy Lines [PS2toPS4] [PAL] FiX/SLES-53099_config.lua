-- Pilot Down: Behind Enemy Lines SLES_530.99
-- ported to PS4 Lua
-- emu used=psychonauts v1

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()


emuObj.SetDisplayAspectWide()


local FFC = function()
   eeObj.FastForwardClock()
end

local ADVC = function()
   eeObj.AdvanceClock(8000)
end

local VU1 = function()
   eeObj.Vu1MpgCycles(600)
end

-- title screen fix
eeObj.AddHook(0x00104f90, 0x8c850000, ADVC)
--in game stutter fix
eeObj.AddHook(0x00104f94, 0x30a2000c, FFC, VU1)
eeObj.AddHook(0x002d605c, 0x27bd0060, FFC, VU1)

local WS = function()
-- allow sending VU1 mpg successfully.
eeObj.WriteMem32(0x00426140,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)