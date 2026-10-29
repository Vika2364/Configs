-- Spiderman - The Movie NTSC (SLUS-20336)
-- Widescreen + Cheats
-- emu used=psychonauts v2 (fixed missing street and other blackouts)


local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack 16:9
eeObj.WriteMem32(0x004d13d4,0x3fe38e2a) --3faaaaab
eeObj.WriteMem32(0x002b5c64,0x3c013c28) --3c013c0e
--All Art/Most Movies by InterAct
eeObj.WriteMem32(0x1194B7B8,0x00000001)
--Unlock Vulture Movie by InterAct
eeObj.WriteMem32(0x1194B770,0x00000001)
--Unlock Shocker Movie by InterAct
eeObj.WriteMem32(0x1194B774,0x00000001)
--All Combat Controls by InterAct
eeObj.WriteMem32(0x1194B7B0,0x00000001)
--Unlock Secret Store Costumes by InterAct
eeObj.WriteMem32(0x1194B45C,0x00000019)

end

emuObj.AddVsyncHook(patcher)