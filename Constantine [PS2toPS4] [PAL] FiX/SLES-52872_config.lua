-- Constantine (SLES_52872)
-- emu used=Default PS2 Emu

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen hack

--X-Fov ELF hack
--803f013c 00108144 0c00438e
eeObj.WriteMem32(0x002b5118,0x3c013f40) --3c013f80

--Forces NTSC mode at startup
eeObj.WriteMem32(0x0040E3E0,0x34050002)
eeObj.WriteMem32(0x0040E3E4,0x24030002)
eeObj.WriteMem32(0x0040E3E8,0x0000000C)
eeObj.WriteMem32(0x0040E3EC,0x03E00008)
eeObj.WriteMem32(0x002B505C,0x24050280)
eeObj.WriteMem32(0x002B5060,0x240601C0)

--Dumpster FiX
eeObj.WriteMem32(0x00339EEC,0x00000000) -- 1040000E

end

emuObj.AddVsyncHook(patcher)