-- SEGA Superstar Tennis
-- Graphical issue fix by Kozarovv
-- ported to PS4 Lua
-- emu used=kof98um

apiRequest(0.1)

local eeObj         = getEEObject()
local emuObj       = getEmuObject()

emuObj.PadSetLightBar(0, 5,5,255)
emuObj.SetDeinterlace(true)
emuObj.SetDisplayAspectWide()
--emuObj.ForceRefreshRate(60)
emuObj.EnableImposeMenu(true)

-- Rearrange code to not corrupt previous
-- result by new VU0 microprogram.
eeInsnReplace(0x0010c800,0x4a001ab8,0x48309800) -- vcallms $006a
eeInsnReplace(0x0010c804,0x48309800,0x4a001ab8) -- qmfc2 s0, vf19
eeInsnReplace(0x0010c874,0x4a002178,0x4830b800) -- vcallms $0085
eeInsnReplace(0x0010c878,0x4830b800,0x4a002178) -- qmfc2 s0, vf23
eeInsnReplace(0x0010c8f0,0x4a001ab8,0x48309800) -- vcallms $006a
eeInsnReplace(0x0010c8f4,0x48309800,0x4a001ab8) -- qmfc2 s0, vf19
eeInsnReplace(0x0010c978,0x4a002178,0x4830b800) -- vcallms $0085
eeInsnReplace(0x0010c97c,0x4830b800,0x4a002178) -- qmfc2 s0, vf23
eeInsnReplace(0x0010c990,0x4a002178,0x4830b800) -- vcallms $0085
eeInsnReplace(0x0010c994,0x4830b800,0x4a002178) -- qmfc2 s0, vf23
eeInsnReplace(0x0010c9c8,0x4a001ab8,0x48309800) -- vcallms $006a
eeInsnReplace(0x0010c9d0,0x48309800,0x4a001ab8) -- qmfc2 s0, vf19
eeInsnReplace(0x0010ca00,0x4a002178,0x4830b800) -- vcallms $0085
eeInsnReplace(0x0010ca08,0x4830b800,0x4a002178) -- qmfc2 s0, vf23

local WS = function()


end

emuObj.AddVsyncHook(WS)