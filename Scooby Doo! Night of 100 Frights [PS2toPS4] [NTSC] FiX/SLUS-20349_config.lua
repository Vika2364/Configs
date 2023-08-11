-- Scooby-Doo! Night of 100 Frights (U)(SLUS-20349)
-- Widescreen hack by Arapapa
-- emu used=jakx v2

apiRequest(0.1)   
 
local emuObj  = getEmuObject()
local eeObj  = getEEObject()

emuObj.SetDisplayAspectWide()

local patcher = function()
--Widescreen hack 16:9

--X-Fov
--680001c6 6c0002c6
eeObj.WriteMem32(0x001e6268,0x080a04ac) --c6010068

eeObj.WriteMem32(0x002812b0,0x3c013f40) -- 00000000
eeObj.WriteMem32(0x002812b4,0x4481f000) -- 00000000
eeObj.WriteMem32(0x002812b8,0xc6010068) -- 00000000
eeObj.WriteMem32(0x002812bc,0xc602006c) -- 00000000
eeObj.WriteMem32(0x002812c0,0x461e0843) -- 00000000
eeObj.WriteMem32(0x002812c4,0xe6010068) -- 00000000
eeObj.WriteMem32(0x002812c8,0x0807989c) -- 00000000

--60 fps
eeObj.WriteMem32(0x20131DB0,0x2C420001)

emuObj.ThrottleMax()
end

eeObj.AddHook(0x001d56a4, 0xc6010008, function() -- lwc1 $f1, $0008(s0)
         eeObj.AdvanceClock(3500)
end)
   
emuObj.AddVsyncHook(patcher)