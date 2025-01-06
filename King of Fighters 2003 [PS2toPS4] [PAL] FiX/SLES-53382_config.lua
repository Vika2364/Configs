-- The King of Fighters 2003  SLES53382
-- emu kof98

apiRequest(1.0)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

-- Fix for Depth precision
-- author=kozarovv (adapted by Immersion95)
-- Fix for Depth precision.
--Game fills upper 16bits of depth with 0xFFFF.
--This results in a really high 32 bit value which is then converted to float
--because both hw and sw renderers lack double precision the lower 16 bits of the initial 32 bit value lose precision.
eeObj.WriteMem32(0x000ffc00,0xf88a0000)
eeObj.WriteMem32(0x000ffc04,0xa080000b)
eeObj.WriteMem32(0x000ffc08,0x08053967)
eeObj.WriteMem32(0x0014E594,0x0803ff00)
eeObj.WriteMem32(0x0014E598,0x4bea497d)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)