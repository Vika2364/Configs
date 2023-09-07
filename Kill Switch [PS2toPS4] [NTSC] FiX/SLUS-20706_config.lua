--gametitle=Kill Switch [SLUS-20706]
--emu used=bully v.2

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()
local gsObj  = getGsObject()

local widescreen = function()

--Widescreen hack 16:9

--Force turn on Widescreen
--00 00 00 00 00 00 00 00 04 00 01 00 08 00 02 00 (2nd)
eeObj.WriteMem32(0x203C0E1C,0x00000001)

--Zoom fix
--00a08144 003f013c 00608144
eeObj.WriteMem32(0x0023b594,0x3c013f25) --3c013f00

-----------------------------------------------------------
--4:3 Y-Fov
--eeObj.WriteMem32(0x0023b574,0x3c013fe3) --3c013faa
--eeObj.WriteMem32(0x0023b578,0x34218ef3) --3421a993

--HUD Y-Size
--eeObj.WriteMem32(0x001fefd4,0x3c013bf8) --3c013b08

--HUD X-Size
--eeObj.WriteMem32(0x001fefe8,0x3c013a99) --3c013acc
--eeObj.WriteMem32(0x001fefec,0x34219dcb) --3421cccd

--HUD X-Position
--eeObj.WriteMem32(0x001ff010,0x3c01c254) --3c014220

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(widescreen)

