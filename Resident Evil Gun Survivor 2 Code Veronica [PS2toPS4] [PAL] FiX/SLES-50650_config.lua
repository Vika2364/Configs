-- Resident Evil - Survivor 2 - Code Veronica (PAL-E) (SLES-50650)
-- freeze fix by Stayhye
-- View selector by Stayhye
-- RE4 View & Widescreen hack by ElHecht
-- emu used=jak tpl v1

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

emuObj.SetDisplayAspectWide()

local WS = function()
--fix annoying slow FMVs
eeObj.WriteMem32(0x00369d34,0)

-- 16:9
eeObj.WriteMem32(0x00339528,0x3c023f61) -- 3c023f96 hor fov
eeObj.WriteMem32(0x0033952c,0x34436873) -- 344345a2 hor fov

-- View Selector
local pad_bits    = emuObj.GetPad()

local L3  = pad_bits &  0x0002
local R3  = pad_bits &  0x0004

if (L3 ~= 0) then
   -- RE4 style camera
   eeObj.WriteMem32(0x2037e2c0,0x40900000) -- tori_x (horizontal)
   eeObj.WriteMem32(0x2037e2d0,0xC0000000) -- tory_y (height)
   eeObj.WriteMem32(0x2037e2e0,0x41100000) -- tori_z (distance)
end

if (R3 ~= 0) then
   -- Normal Camera
   eeObj.WriteMem32(0x2037e2c0,0x00000000) -- tori_x (horizontal)
   eeObj.WriteMem32(0x2037e2d0,0x00000000) -- tory_y (height)
   eeObj.WriteMem32(0x2037e2e0,0x00000000) -- tori_z (distance)
end

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)