-- Rule of Rose (PAL)
-- emu used=KOF 2000

apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x0013bf48,0x3c013f12)
eeObj.WriteMem32(0x0013bf70,0x3c013f10)

-- Remove Black Bars in Cutscenes
eeObj.WriteMem32(0x001914AC,0x24030000)

-- Camera Zoom Out
eeObj.WriteMem32(0x00750878,0x3F400000)

-- Noise Filter Off
-- [Control Address and its Value: 007675A0 00000000]
eeObj.WriteMem32(0x001d4d88,0x64050000)

-- Maximum far clear Sight
-- Outdoors and in Rooms
eeObj.WriteMem32(0x007506B4,0x461C4000)
eeObj.WriteMem32(0x00750800,0x00000000)
eeObj.WriteMem32(0x00750804,0x00000000)
eeObj.WriteMem32(0x00750780,0x00000000)
eeObj.WriteMem32(0x00750784,0x00000000)
eeObj.WriteMem32(0x00750788,0x00000000)
eeObj.WriteMem32(0x0075078C,0x00000000)
eeObj.WriteMem32(0x00750790,0x461C4000)
eeObj.WriteMem32(0x00750794,0x00000000)
eeObj.WriteMem32(0x00750798,0x00000000)
eeObj.WriteMem32(0x0075079C,0x3F800000)

-- Remove all Characters Body Shadow on the
-- Ground and the Shadow around their Feet
eeObj.WriteMem32(0x0013AA8C,0x00000000)

-- Disable Extra Light [light1]
eeObj.WriteMem32(0x0017569C,0x44800000)
eeObj.WriteMem32(0x001756A0,0x44800800)

-- Disable Extra Light [light2]
eeObj.WriteMem32(0x00175AE4,0x44800000)
eeObj.WriteMem32(0x00175AEC,0x44801000)

-- Last Part of the Game where
-- Jennifer is a little Girl
-- completely in Real-Colours!
-- [Control Address and its Value: 00727F64 00000000]
eeObj.WriteMem32(0x00145454,0x24030000)

-- Jennifer Never gets Exhausted
-- [Control Address and its Value: 00750B30 000003E8]
eeObj.WriteMem32(0x0011bf70,0x2402FFFF)

-- All Costumes in "Four Leaf Clover"-Room unlocked
eeObj.WriteMem32(0x00860100,0x80B70000)

end

emuObj.AddVsyncHook(patcher)