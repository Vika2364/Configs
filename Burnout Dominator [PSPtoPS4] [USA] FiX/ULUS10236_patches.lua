-- Burnout Dominator
-- lua by Stayhye

apiRequest(1.0)  -- request version 1.0 API. Calling apiRequest() is mandatory.

local emuObj  = getEmuObject() -- emulator
local axObj  = getAXObject() -- allegrex

local patcher = function()
--30 FPS V.2 [Default]
local code_check1 = axObj.ReadMem16(0x02574C)
if code_check1 == 0x0000 then
axObj.WriteMem32(0x2002574C,0x14A0001A)
axObj.WriteMem32(0x201A0358,0xE60C0034)
axObj.WriteMem32(0x204F08BC,0x3D088888)
axObj.WriteMem32(0x2019AE90,0x3C043F80)
end
--[[
--60 FPS V.2
local code_check2 = axObj.ReadMem16(0x02574C)
if code_check2 == 0x001A then
axObj.WriteMem32(0x2002574C, 0x00000000)
axObj.WriteMem32(0x201A0358, 0x00000000)
axObj.WriteMem32(0x204F08BC, 0x3C888888)
axObj.WriteMem32(0x2019AE90, 0x3C043F00)
end
--]]
end

emuObj.AddVsyncHook(patcher)

emuObj.SetTextureHashMode("patchworkheroes")