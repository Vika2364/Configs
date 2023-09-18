-- Raging Blades (E)(SLES-51235)
-- Widescreen hack by Arapapa
-- No Interlace by zoli576 
-- emu used=psychonauts v2

apiRequest(1.0)

local gpr       = require("ee-gpr-alias")
local cpr       = require("ee-cpr0-alias")
local hwaddr     = require("ee-hwaddr")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()
local iopObj  = getIOPObject()

local patcher = function()
--Widescreen hack 16:9
--X-fov
eeObj.WriteMem32(0x0022d420,0x3c013f40) --3c013f80
--Render fix
eeObj.WriteMem32(0x002e4b70,0x43e00000) --43a00000
--no interlace
eeObj.WriteMem32(0x2026410C,0x00000000)
eeObj.WriteMem32(0x20264194,0x00000000)
eeObj.WriteMem32(0x2022B1EC,0x00000000)
eeObj.WriteMem32(0x2022B254,0x00000000)
eeObj.WriteMem32(0x202E3C90,0x00001480)
eeObj.WriteMem32(0x202E3CB8,0x00001480)
eeObj.WriteMem32(0x202E3FC0,0x00001480)
eeObj.WriteMem32(0x202E3FE8,0x00001480)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)