-- The Incredibles - Rise of the Underminer SLUS-21217
-- Widescreen hack
-- Cheats by MadCatz
-- ported to PS4 lua
-- emu used=kof98um

apiRequest(0.1)
 
local emuObj  = getEmuObject()
local eeObj  = getEEObject()
 
local patcher = function()
--16:9
eeObj.WriteMem32(0x00218E84,0x3C023F17)
eeObj.WriteMem32(0x00218EB0,0x3C023F10)

--Unlock All Mission Select by MadCatz
eeObj.WriteMem32(0x200C2000,0x8C410024)
eeObj.WriteMem32(0x200C2004,0x34210002)
eeObj.WriteMem32(0x200C2008,0xAC410024)
eeObj.WriteMem32(0x200C200C,0x080EFC22)
eeObj.WriteMem32(0x200C2010,0x8C420024)
eeObj.WriteMem32(0x203BF080,0x08030800)

emuObj.ThrottleMax()
end
 
emuObj.AddVsyncHook(patcher)