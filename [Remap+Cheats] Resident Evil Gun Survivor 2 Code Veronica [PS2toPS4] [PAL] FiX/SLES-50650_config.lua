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

--Remap Buttons
eeObj.WriteMem32(0x2010BFF4,0x0803F414)
eeObj.WriteMem32(0x200FD050,0x00C0C821)
eeObj.WriteMem32(0x200FD054,0x08042FFF)
eeObj.WriteMem32(0x200FD058,0x24030070)
eeObj.WriteMem32(0x2010C064,0x0803F417)
eeObj.WriteMem32(0x200FD05C,0x87240002)
eeObj.WriteMem32(0x200FD060,0x308573FF)
eeObj.WriteMem32(0x200FD064,0x93260010)
eeObj.WriteMem32(0x200FD068,0x93270011)
eeObj.WriteMem32(0x200FD06C,0x9328000F)
eeObj.WriteMem32(0x200FD070,0x93290004)
eeObj.WriteMem32(0x200FD074,0x30810800)
eeObj.WriteMem32(0x200FD078,0x34A38000)
eeObj.WriteMem32(0x200FD07C,0x0061280B)
eeObj.WriteMem32(0x200FD080,0xA327000F)
eeObj.WriteMem32(0x200FD084,0x34A30400)
eeObj.WriteMem32(0x200FD088,0x2D210041)
eeObj.WriteMem32(0x200FD08C,0x0061280A)
eeObj.WriteMem32(0x200FD090,0x3923007F)
eeObj.WriteMem32(0x200FD094,0x00031840)
eeObj.WriteMem32(0x200FD098,0x2D21007F)
eeObj.WriteMem32(0x200FD09C,0x0001180A)
eeObj.WriteMem32(0x200FD0A0,0xA3230010)
eeObj.WriteMem32(0x200FD0A4,0x34A30800)
eeObj.WriteMem32(0x200FD0A8,0x2D2100BF)
eeObj.WriteMem32(0x200FD0AC,0x0061280B)
eeObj.WriteMem32(0x200FD0B0,0x2523FF80)
eeObj.WriteMem32(0x200FD0B4,0x00031840)
eeObj.WriteMem32(0x200FD0B8,0x2D210081)
eeObj.WriteMem32(0x200FD0BC,0x0001180B)
eeObj.WriteMem32(0x200FD0C0,0xA3230011)
eeObj.WriteMem32(0x200FD0C4,0x34090080)
eeObj.WriteMem32(0x200FD0C8,0x00060842)
eeObj.WriteMem32(0x200FD0CC,0x3821007F)
eeObj.WriteMem32(0x200FD0D0,0x0026480B)
eeObj.WriteMem32(0x200FD0D4,0x00080842)
eeObj.WriteMem32(0x200FD0D8,0x24230080)
eeObj.WriteMem32(0x200FD0DC,0x0068480B)
eeObj.WriteMem32(0x200FD0E0,0xA7250002)
eeObj.WriteMem32(0x200FD0E4,0x03E00008)
eeObj.WriteMem32(0x200FD0E8,0xA3290004)

--Infinity Life
eeObj.WriteMem32(0x205B12BC,0x000000FF)

--Infinity Timer
eeObj.WriteMem32(0x20280774,0x00000000)

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