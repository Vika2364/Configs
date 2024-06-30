-- Batman Begins NTSC
-- 60fps by asasega @pcsx2 forums
-- emu used=rogue v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

eeInsnReplace(0x00409BF8, 0x0000001E, 0x0000003C) --title screen freeze fix (Boot Enabled 60 fps)

local patcher = function()


local code_change1 = eeObj.ReadMem16(0x00448642)

--title screen freeze fix?? but breaks FMVs
if (code_change1 == 0xFBFD) then --Press L1+L3 Enabled 60 Fps
   eeObj.WriteMem32(0x00409BF8,0x0000003C)
end

if (code_change1 == 0xFBFB) then --Press L1+R3 Disabled 60 Fps
   eeObj.WriteMem32(0x00409BF8,0x0000001E)
end


if (code_change1 == 0xFBBF) then --Press L1+Down For Fast Game Speed
   eeObj.WriteMem32(0x2040E114,0x40000000)
end

if (code_change1 == 0xFAFF) then --Press L1+L2 For Normal Game Speed
   eeObj.WriteMem32(0x2040E114,0x3F800000)
end

if (code_change1 == 0xFB7F) then --Press L1+Left For Slow Game Speed
   eeObj.WriteMem32(0x2040E114,0x3F000000)
end

end

emuObj.AddVsyncHook(patcher)