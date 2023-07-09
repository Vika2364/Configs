-- Crash Tag Team Racing (SLES53439)
-- Widescreen by Arapapa
-- Jak v2

apiRequest(0.1)

local gpr         = require("ee-gpr-alias")
local eeObj     = getEEObject()
local emuObj  = getEmuObject()

local patcher = function()

-- Full credits to MrJaredbeta
-- Fix for the micro-stutters around coins
eeObj.WriteMem32(0x0022EE1C, 0x1000000c)
--Widescreen hack 16:9
--X-Fov
eeObj.WriteMem32(0x0039b420,0x3c013fab) --3c013f80
--Render fix
eeObj.WriteMem32(0x002da688,0x3c013fe0) --3c013f80
--60 FPS by asasega
eeObj.WriteMem32(0x207B3ADC,0x00000001) --00000002
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 125000} )