-- Buffy the Vampire Slayer Chaos Bleeds (PAL)
-- ported to PS4
-- emu used=wotm 

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Replace bad VIF1 CMD (0x12) with VIF1 NOP.
eeObj.WriteMem32(0x0026B6E8,0x3C060000) -- 0x3c061200 >> lui a2, $1200 (____12000000)

end

emuObj.AddVsyncHook(patcher)