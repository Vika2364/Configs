-- Max Payne 2 Fall of Max Payne (SLES51954)
-- Widescreen by Arapapa
-- Jak v2

apiRequest(0.1)

local gpr = require("ee-gpr-alias")
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Zoom fix (Internal widescreen)
--abaaaa3e 8988083e
eeObj.WriteMem32(0x0056a0c8,0x3faccccd) --3eaaaaab

end
emuObj.AddVsyncHook(patcher)