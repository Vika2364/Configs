-- Pac-Man World 2 NTSC
-- no interlace/framebuffer by felixthecat1970
-- emu used=rogue v1


local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--official Widescreen auto-enable (vertical screen skewed - code from widescreen forums)
eeObj.WriteMem32(0x205A68C0,0x00000001) -- change value to 0 for 4:3

--Framebuffer workaround
local code_fb1 = eeObj.ReadMem16(0x330050)
if fb1 == 0x800E then
eeObj.WriteMem32(0x20330008,0x00000002)
eeObj.WriteMem32(0x20330010,0x000014A0)
eeObj.WriteMem32(0x20330030,0x00000002)
eeObj.WriteMem32(0x20330038,0x000014A0)
end

local code_fb2 = eeObj.ReadMem16(0x330050)
if fb2 == 0x8008 then
eeObj.WriteMem32(0x2032F988,0x00000002)
eeObj.WriteMem32(0x2032F990,0x00001038)
end


--No interleacing videos (maybe some parts too, but with framebuffer code is no necessary)
eeObj.WriteMem32(0x202B95BC,0x64420000)

--render camera (for testing) * official code widescreen do same, change values affect positions etc.
--eeObj.WriteMem32(0x20119274,0x3C013F40) -- halfword values 40=wide (still skewed) 80=4:3 others
--eeObj.WriteMem32(0x20119278,0x44810000)
--eeObj.WriteMem32(0x20119280,0x4600C602)


end

emuObj.AddVsyncHook(patcher)

--math.random() + math.random(1, 99)