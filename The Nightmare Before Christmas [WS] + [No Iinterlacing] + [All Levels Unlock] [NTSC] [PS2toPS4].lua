-- Tim Burton's The Nightmare Before Christmas Oogie's Revenge(NTSC-U)(SLUS-20860)
-- Widescreen Hack by Arapapa
-- no interlace by Second Reality @PCSX2 forums
-- emu used=psychonauts v2

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

if eeObj.ReadMem32(0x204F2614) == 0x00000001 then

--No interlacing
eeObj.WriteMem32(0x2021C60C,0x30420000) --30420001

end

--Widescreen hack 16:9

--d7a3f03e 00000045 00000045 0000a040
eeObj.WriteMem32(0x2070CDD8,0x3F206D2F) -- 3ef0a3d7

eeObj.WriteMem32(0x2151E1D4,0x3F19999A) -- 3D figures
eeObj.WriteMem32(0x206FA908,0x3F400000) -- 2D figures

eeObj.WriteMem32(0x20D5BA90,0x3F400000) --area 1
eeObj.WriteMem32(0x20D5BAE4,0x3F400000) --area 2

eeObj.WriteMem32(0x206F9D40,0x3F400000) --FMV subtitles
eeObj.WriteMem32(0x204A4500,0x3F400000) --cutscene subtitles
eeObj.WriteMem32(0x204A1200,0x3F400000) --conversation subtitles
eeObj.WriteMem32(0x204AC350,0x3F400000) --musical subtitles
eeObj.WriteMem32(0x204A1A3C,0x3F400000) --pumpkin width
eeObj.WriteMem32(0x204A0870,0x3F400000) --closet text

eeObj.WriteMem32(0x2049771C,0x3F400000) --inventory item icon
eeObj.WriteMem32(0x203A1AF0,0x3F400000) --inventory item text
eeObj.WriteMem32(0x203A1B10,0x3F400000) --inventory item description text

eeObj.WriteMem32(0x204988A8,0x3F400000) --index selected
eeObj.WriteMem32(0x20498944,0x3F400000) --index unselected
eeObj.WriteMem32(0x204989E0,0x3F400000) --index description text
eeObj.WriteMem32(0x20498A7C,0x3F400000) --index residents
eeObj.WriteMem32(0x2049880C,0x3F400000) --index portraits

eeObj.WriteMem32(0x204A50B4,0x3F400000) --shop item text
eeObj.WriteMem32(0x204A5150,0x3F400000) --shop item icon

eeObj.WriteMem32(0x204B72A8,0x3F400000) --results chapter
eeObj.WriteMem32(0x204B7424,0x3F400000) --results info
eeObj.WriteMem32(0x204B74C0,0x3F400000) --results time rank
eeObj.WriteMem32(0x204B755C,0x3F400000) --results combo rank
eeObj.WriteMem32(0x204B75F8,0x3F400000) --results damage rank
eeObj.WriteMem32(0x204B7694,0x3F400000) --results count rank
eeObj.WriteMem32(0x204B7730,0x3F400000) --results nightmare rank
eeObj.WriteMem32(0x204B7904,0x3F400000) --results "press any button"

eeObj.WriteMem32(0x204B77CC,0x3F400000) --results menu 1
eeObj.WriteMem32(0x204B7868,0x3F400000) --results menu 2

--Max Health
eeObj.WriteMem32(0x2049B494,0x0000001E)

--Infinite Health 
eeObj.WriteMem32(0x2049B498,0x0000001E)

--Max Soul Robber Level
eeObj.WriteMem32(0x2049B49C,0x00000002)

--Max Souls
eeObj.WriteMem32(0x2049B4D4,0x0001869F)

--Infinite Blue Souls
eeObj.WriteMem32(0x2049B4E4,0x00000009)

--Infinite Red Souls
eeObj.WriteMem32(0x2049B534,0x00000032)

--4 Crystal Skulls
--eeObj.WriteMem32(0x2049B54C,0x00000004)

--Infinite Crystal Skull
eeObj.WriteMem32(0x2049B54C,0x00000009)

--Unlock All Chapters
eeObj.WriteMem32(0x204F2618,0x00000018) --00000001

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)