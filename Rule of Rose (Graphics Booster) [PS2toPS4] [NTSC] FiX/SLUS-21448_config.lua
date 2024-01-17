-- Rule of Rose (NTSC)
-- emu used=KOF 2000

apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen Hack
eeObj.WriteMem32(0x0013bd54,0x3c013f12)
eeObj.WriteMem32(0x0013bd7c,0x3c013f10)

-- Camera Zoom Out
eeObj.WriteMem32(0x00726958,0x3F400000)

-- Remove Black Bars in Cutscenes
eeObj.WriteMem32(0x00190d58,0x24020000)

-- Noise Filter Off
eeObj.WriteMem32(0x001d3ab0,0x64050000)

-- Maximum far clear Sight
-- Outdoors and in Rooms
eeObj.WriteMem32(0x00726794,0x461C4000)
eeObj.WriteMem32(0x007268E0,0x00000000)
eeObj.WriteMem32(0x007268E4,0x00000000)
eeObj.WriteMem32(0x00726860,0x00000000)
eeObj.WriteMem32(0x00726864,0x00000000)
eeObj.WriteMem32(0x00726868,0x00000000)
eeObj.WriteMem32(0x0072686C,0x00000000)
eeObj.WriteMem32(0x00726870,0x461C4000)
eeObj.WriteMem32(0x00726874,0x00000000)
eeObj.WriteMem32(0x00726878,0x00000000)
eeObj.WriteMem32(0x0072687C,0x3F800000)

-- Remove all Characters Body Shadow on the
-- Ground and the Shadow around their Feet
eeObj.WriteMem32(0x0013a898,0x00000000)

-- Disable Extra Light [light1]
eeObj.WriteMem32(0x00174ec0,0x0000882D)

-- Disable Extra Light [light2]
eeObj.WriteMem32(0x00175390,0x0000902D)

-- Last Part of the Game where
-- Jennifer is a little Girl
-- completely in Real-Colours!
eeObj.WriteMem32(0x00144eb8,0x24030000)

-- Jennifer Never gets Exhausted
eeObj.WriteMem32(0x00726C10,0x000003E8)
eeObj.WriteMem32(0x001211d4,0x0000202D)

-- All Costumes in "Four Leaf Clover"-Room unlocked
eeObj.WriteMem32(0x00836200,0x80B70000)

end

emuObj.AddVsyncHook(patcher)