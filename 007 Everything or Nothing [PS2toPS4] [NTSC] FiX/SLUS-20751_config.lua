-- James Bond 007: Everything or Nothing (SLUS-20751)
-- Widescreen hack by nemesis2000
-- FMV, freeze and stutter fixes by Stayhye
-- emu used=kof98um
 
local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj    = getEEObject()
local emuObj    = getEmuObject()

emuObj.SetDeinterlace(true)
emuObj.SetDisplayAspectWide()

--[[
Notes:  Game uses 2 ELF files(DRIVING.ELF and ACTION.ELF). Must use "if/then loop"
to not hit the wrong offset in the wrong ELF during different missions.
--]]

local Game_Fixes = function()
--16:9
eeObj.WriteMem32(0x00315D28,0x24020001)

-- Fix FMVs
local FMVs = eeObj.ReadMem16(0x38b358)
   if FMVs == 0xfffb then
     eeObj.WriteMem32(0x0038b358,0x00000000) -- 0x5440fffb >> bnel v0, zero, $0038b348
   end

--60 fps (normal missions)
local FPS = eeObj.ReadMem16(0x3891D4)
   if FPS == 0x000e then
     eeObj.WriteMem32(0x003891D4,0x00000000)
   end
 
--mission 4 freeze/stutter fix
local M4 = eeObj.ReadMem16(0x3b8114)
   if M4 == 0xfffa then
     eeObj.WriteMem32(0x003b8114,0x00000000)
   end
local M4_speed = eeObj.ReadMem16(0x3b4430)
   if M4_speed == 0x0004 then
     eeObj.Vu1MpgCycles(1800)
   end
 
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(Game_Fixes)