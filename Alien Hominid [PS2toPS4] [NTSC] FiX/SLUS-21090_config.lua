-- Alien Hominid NTSC
-- emu used=psychonauts v2

apiRequest(0.1)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--PDA Games
eeObj.WriteMem32(0x00506633,0x00000001)
--Challenge by MadCatz
eeObj.WriteMem32(0x00506634,0x00000001)
--Missile Master by MadCatz
eeObj.WriteMem32(0x00506635,0x00000001)
--Neutron Ball by MadCatz
eeObj.WriteMem32(0x00506636,0x00000001)
--Pinata Boss by MadCatz
eeObj.WriteMem32(0x00506637,0x00000001)

end

emuObj.AddVsyncHook(patcher)