-- Tom Clancy's Splinter Cell (PAL)
-- emu used=kof98um

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

emuObj.PadSetLightBar(0, 0, 255, 0)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)


--in-game stutter fix A
eeObj.AddHook(0x002CCAE0, 0x78a30000, function() -- lq v1, $0000(a1)
          eeObj.AdvanceClock(21000)
          eeObj.Vu1MpgCycles(2000)
end)

--in-game stutter fix B
eeObj.AddHook(0x002CCAE4, 0x27bdffd0, function() -- addiu sp, sp, $ffd0
          eeObj.FastForwardClock(8000)
end)

local WS = function()
--16:9
eeObj.WriteMem32(0x001CF890,0x3C053F40) -- 3C053F80 - X-axis

end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )