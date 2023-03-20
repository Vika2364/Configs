-- Tom Clancy's Splinter Cell Chaos Theory (SLUS_21137)
-- Widescreen hack by nemesis2000
-- Menu/In-game Stutter fix by Stayhye
-- ported to PS4 lua
-- emu used=kof98um

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

emuObj.PadSetLightBar(0, 0, 255, 10)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

--in-game stutter fix
eeObj.AddHook(0x0061e108, 0x8d240000, function() -- lw a0, $0000(t1)
          eeObj.AdvanceClock(10000)
          --eeObj.Vu1MpgCycles(2500)
end)

local WS = function()
-- menu stutter fix
eeObj.WriteMem32(0x0077e968,0x10000013) -- 0x12000013 >> beq s0, zero, $0077e9b8
--16:9
eeObj.WriteMem32(0x001f2904,0xe6600084)
eeObj.WriteMem32(0x001f2908,0x3c01007e)
eeObj.WriteMem32(0x001f290c,0xc42069d0)
eeObj.WriteMem32(0x001f2910,0x24030004)
eeObj.WriteMem32(0x001f2914,0x3c023f80)
eeObj.WriteMem32(0x001f2918,0xe66000d0)
eeObj.WriteMem32(0x001f291c,0x3c01007e)
eeObj.WriteMem32(0x001f2920,0xc42069d4)
eeObj.WriteMem32(0x001f2924,0xe66000d4)
eeObj.WriteMem32(0x001f2928,0x3c01007e)
eeObj.WriteMem32(0x001f292c,0xc42069d8)
eeObj.WriteMem32(0x001f2930,0xe66000d8)
eeObj.WriteMem32(0x001f2934,0x3c01007e)
eeObj.WriteMem32(0x001f2938,0xc42069dc)
eeObj.WriteMem32(0x001f293c,0xe66000dc)
eeObj.WriteMem32(0x001f2940,0x3c01007e)
eeObj.WriteMem32(0x001f2944,0xc42069d0)
eeObj.WriteMem32(0x001f2948,0xe6600110)
eeObj.WriteMem32(0x001f294c,0x3c01007e)
eeObj.WriteMem32(0x001f2950,0xc42069d4)
eeObj.WriteMem32(0x001f2954,0xe6600114)
eeObj.WriteMem32(0x001f2958,0x3c01007e)
eeObj.WriteMem32(0x001f295c,0xc42069d8)
eeObj.WriteMem32(0x001f2960,0xe6600118)
eeObj.WriteMem32(0x001f2964,0x3c01007e)
eeObj.WriteMem32(0x001f2968,0xc42069dc)
eeObj.WriteMem32(0x001f296c,0xe660011c)
eeObj.WriteMem32(0x001f2970,0x3c01007e)
eeObj.WriteMem32(0x001f2974,0xc42069d0)
eeObj.WriteMem32(0x001f2978,0xe6600120)
eeObj.WriteMem32(0x001f297c,0x3c01007e)
eeObj.WriteMem32(0x001f2980,0xc42069d4)
eeObj.WriteMem32(0x001f2984,0xe6600124)
eeObj.WriteMem32(0x001f2988,0x3c01007e)
eeObj.WriteMem32(0x001f298c,0xc42069d8)
eeObj.WriteMem32(0x001f2990,0xe6600128)
eeObj.WriteMem32(0x001f2994,0x3c01007e)
eeObj.WriteMem32(0x001f2998,0xc42069dc)
eeObj.WriteMem32(0x001f299c,0xe660012c)
eeObj.WriteMem32(0x001f29a0,0x3c01007f)
eeObj.WriteMem32(0x001f29a4,0xae600130)
eeObj.WriteMem32(0x001f29a8,0xae600138)
eeObj.WriteMem32(0x001f29ac,0xae600134)
eeObj.WriteMem32(0x001f29b0,0xae6300a4)
eeObj.WriteMem32(0x001f29b4,0xae600098)
eeObj.WriteMem32(0x001f29b8,0xae600094)
eeObj.WriteMem32(0x001f29bc,0xae62009c)
eeObj.WriteMem32(0x001f29c0,0x3c023f80)
eeObj.WriteMem32(0x001f29c4,0xae6200a0)

eeObj.SchedulerDelayEvent("vif1.dma", 0x1600)
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )