-- 25 to Life  (U)(SLUS-21016)
-- Widescreen Hack by Arapapa
-- 60 FPS by asasega
-- 60 FPS Stutter fix(PS4) by Stayhye
-- ported to PS4 Lua
-- emu used=kof98um

apiRequest(0.1)

local eeObj         = getEEObject()
local emuObj       = getEmuObject()

emuObj.PadSetLightBar(0, 45,65,55)
emuObj.SetDeinterlace(true)
emuObj.SetDisplayAspectWide()
emuObj.ForceRefreshRate(60)
emuObj.EnableImposeMenu(true)

--stutter fix(60fps)
eeObj.AddHook(0x00577cf8,0x0260b82d,function() -- daddu s7, s3, zero
         eeObj.AdvanceClock(11000)
end)      

local WS = function()
--Widescreen hack 16:9

--X-Fov
--00000000 00000000 43030d46
eeObj.WriteMem32(0x00417e68,0x080978f8) --00000000

eeObj.WriteMem32(0x0025e3e0,0x3c013faa) --00000000
eeObj.WriteMem32(0x0025e3e4,0x3421aaab) --00000000
eeObj.WriteMem32(0x0025e3e8,0x4481f000) --00000000
eeObj.WriteMem32(0x0025e3ec,0x461e6b42) --00000000
eeObj.WriteMem32(0x0025e3f0,0x08105f9b) --00000000

--Render fix
--003f013c 00008144 6a00023c (1st)
eeObj.WriteMem32(0x003989b8,0x3c013f10) --3c013f00

--60 FPS by asasega
--020000000000000040020000000000002206813F
eeObj.WriteMem32(0x207067D8,0x00000001) --00000002

--Unlock All Levels by MadCatz
eeObj.WriteMem32(0x20156548,0x24020001)
eeObj.WriteMem32(0x20156550,0xAC621F4C)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)