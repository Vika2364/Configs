--gametitle=Mafia [PAL] (SLES_522.78) ENG-ITA hybrid ISO of Mafia.
-- emu used=kinetica v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Gameplay 16:9
eeObj.WriteMem32(0x20FFB1F4,0x3FAB0000) --3F800000 Vertical axis
eeObj.WriteMem32(0x20FFB2DC,0x3FAB0000) --3F800000 Horizontal axis

--Render fix
eeObj.WriteMem32(0x20FFB244,0x3D000000) --3D4CCCCD

--Rendering distancce
eeObj.WriteMem32(0x20FFB248,0x44000000) --43660000

--avoid hang before molotov party
eeObj.WriteMem32(0x003E2BB4,0x00000000) --00000000

--fix crash in The priest mission
eeObj.WriteMem32(0x0016F04C,0x1000000D) --1000000D

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)