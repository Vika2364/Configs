-- Shadow Hearts (SLES-50822)
-- Widescreen + Graphical bugs FiX
-- emu used=RECVX v1

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x0028FA98,0x3C043F40)
eeObj.WriteMem32(0x00284814,0x3C023F40)

-- no interlace
eeObj.WriteMem32(0x202016EC,0x00000000)
eeObj.WriteMem32(0x203081C0,0xA2200279)

-- Fixed random missing graphics on characters
eeObj.WriteMem32(0x24fbdc,0x00000000)

end

emuObj.AddVsyncHook(patcher)