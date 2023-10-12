-- Shadow Hearts (SLUS-20347)(UnDUB)
-- Widescreen + Graphical bugs FiX
-- emu used=RECVX v1

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x0028d4f0,0x3c043f40)
eeObj.WriteMem32(0x00282394,0x3c023f40)
--eeObj.WriteMem32(0x00324530,0x3c023f40) -- field
--eeObj.WriteMem32(0x0034a728,0x3c033f50) --3c033f80  font size
eeObj.WriteMem32(0x0039fe08,0x3c023f40)
eeObj.WriteMem32(0x003d5704,0x3c023f40)
eeObj.WriteMem32(0x003eec44,0x3c023f40)

-- no interlace
eeObj.WriteMem32(0x202016EC,0x00000000)
eeObj.WriteMem32(0x20305630,0xA2200279)

-- Fixed random missing graphics on characters
eeObj.WriteMem32(0x24e6ec,0x0000000)

end

emuObj.AddVsyncHook(patcher)