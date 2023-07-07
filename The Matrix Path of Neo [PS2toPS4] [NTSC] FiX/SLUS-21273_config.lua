-- The Matrix Path of Neo NTSC
-- Graphics fix 
-- ported to PS4
-- emu used=jakx v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()


emuObj.PadSetLightBar(0, 0,255,0) -- green!
emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(1)
emuObj.SetDeinterlace(true)

--graphics fix! gif.dma does do something!
eeObj.AddHook(0x00102064,0xdfb00000, function() -- ld s0, $0000(sp)
       eeObj.SchedulerDelayEvent("gif.dma", 0x1600)
end)

--fps boost A
eeObj.AddHook(0x001d7154,0x9482002c, function() -- lhu v0, $002c(a0)
       eeObj.AdvanceClock(7000)
end)

--fps boost B
eeObj.AddHook(0x0027f4e8,0x34631000, function() -- ori v1, v1, $1000
       eeObj.Vu1MpgCycles(3700)
end)

local patcher = function()
--Unlock All Extras (View Extras To Unlock) by MadCatz
eeObj.WriteMem32(0x201DCCBC,0x2002FFFF)
eeObj.WriteMem32(0x201DCCC0,0xAC820000)
eeObj.WriteMem32(0x201DCCC4,0x03E00008)
eeObj.WriteMem32(0x201DCCC8,0x24020001)
eeObj.WriteMem32(0x20466750,0xFFFFFFFF)
eeObj.WriteMem32(0x20466754,0x00040011)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)