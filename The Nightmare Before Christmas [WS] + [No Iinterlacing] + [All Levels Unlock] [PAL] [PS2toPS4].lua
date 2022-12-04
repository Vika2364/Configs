-- Tim Burton's The Nightmare Before Christmas Oogie's Revenge(PAL)(SLES-53192)
-- emu used=psychonauts v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

if eeObj.ReadMem32(0x204E4E34) == 0x00000001 then

--No interlacing
eeObj.WriteMem32(0x2021D57C,0x30420000) --30420001

end

--Widescreen hack 16:9

eeObj.WriteMem32(0x00368C38,0x3F206D2F) --3EF0A3D7 (Increases hor. axis)

--All other stuff in 16:9
eeObj.WriteMem32(0x006FB57C,0x3F400000) --3F800000 Selected 2D flag languages
eeObj.WriteMem32(0x006FB4E0,0x3F400000) --3F800000 Selected flag languages text
eeObj.WriteMem32(0x006FB618,0x3F400000) --3F800000 Default 2D flag and languages text
eeObj.WriteMem32(0x006FB6B4,0x3F400000) --3F800000 Selector video mode text
eeObj.WriteMem32(0x006FB750,0x3F400000) --3F800000 Selector video mode description text
eeObj.WriteMem32(0x003941C0,0x3F400000) --3F800000 System detection load/save game text

eeObj.WriteMem32(0x00394060,0x3F400000) --3F800000 Video subtitles
eeObj.WriteMem32(0x00394020,0x3F400000) --3F800000 Cutscene subtitles
eeObj.WriteMem32(0x00493A00,0x3F400000) --3F800000 Conversation subtitles

eeObj.WriteMem32(0x0049423C,0x3F400000) --3F800000 Pumpkin width

eeObj.WriteMem32(0x00394160,0x3F400000) --3F800000 Menu load/save game text

eeObj.WriteMem32(0x006EA474,0x3F400000) --3F800000 Main menu new game text
eeObj.WriteMem32(0x006EA510,0x3F400000) --3F800000 Main menu loading text
eeObj.WriteMem32(0x006EA5AC,0x3F400000) --3F800000 Main menu options text
eeObj.WriteMem32(0x006EA3D8,0x3F400000) --3F800000 Main menu copyright text
eeObj.WriteMem32(0x006EA6E4,0x3F400000) --3F800000 Main menu easy difficulty
eeObj.WriteMem32(0x006EA780,0x3F400000) --3F800000 Main menu normal difficulty
eeObj.WriteMem32(0x006EA81C,0x3F400000) --3F800000 Main menu nightmare difficulty

eeObj.WriteMem32(0x00487E48,0x3F400000) --3F800000 Loading text
eeObj.WriteMem32(0x00487DAC,0x3F400000) --3F800000 Chapter description text
eeObj.WriteMem32(0x0049EB70,0x3F400000) --3F800000 Musical subtitles

eeObj.WriteMem32(0x00489F1C,0x3F400000) --3F800000 Inventory item icon
eeObj.WriteMem32(0x003940E0,0x3F400000) --3F800000 Inventory item name
eeObj.WriteMem32(0x00394100,0x3F400000) --3F800000 Inventory item description text
eeObj.WriteMem32(0x00489BD4,0x3F700000) --3F800000 Inventory item 2D box text
eeObj.WriteMem32(0x008914C4,0x3F400000) --3F800000 Inventory box
eeObj.WriteMem32(0x00891504,0x3F400000) --3F800000 Inventory background box
eeObj.WriteMem32(0x00489A00,0x3F400000) --3F800000 Inventory internal light box
eeObj.WriteMem32(0x00891764,0x3F400000) --3F800000 Inventory rectangle box
eeObj.WriteMem32(0x008917A4,0x3F400000) --3F800000 Inventory rectangle background box
eeObj.WriteMem32(0x00489A9C,0x3F400000) --3F800000 Inventory collection text
eeObj.WriteMem32(0x00891210,0x3F400000) --3F800000 Inventory collection box
eeObj.WriteMem32(0x00891264,0x3F400000) --3F800000 Inventory collection background box
eeObj.WriteMem32(0x008919F0,0x3F400000) --3F800000 Inventory unselected arrow
eeObj.WriteMem32(0x00489C70,0x3F400000) --3F800000 Inventory selected arrow

eeObj.WriteMem32(0x00394140,0x3f400000) --3f800000 Map objective description text

eeObj.WriteMem32(0x0094CDF0,0x3F400000) --3F800000 Action 2D portraits
eeObj.WriteMem32(0x0048AE20,0x3F400000) --3F800000 Action selected weapon name text
eeObj.WriteMem32(0x0048AEBC,0x3F400000) --3F800000 Action unselected weapon name text
eeObj.WriteMem32(0x0048AF58,0x3F400000) --3F800000 Action description text and portrait attack

eeObj.WriteMem32(0x00489964,0x3F400000) --3F800000 Index graphic screen up
eeObj.WriteMem32(0x0048B27C,0x3F400000) --3F800000 Index residents
eeObj.WriteMem32(0x0048B144,0x3F400000) --3F800000 Index name and unselected locations text
eeObj.WriteMem32(0x0048B0A8,0x3F400000) --3F800000 Index selected locations text
eeObj.WriteMem32(0x0048B00C,0x3F400000) --3F800000 Index portraits 
eeObj.WriteMem32(0x0048B1E0,0x3F400000) --3F800000 Index description locations text
eeObj.WriteMem32(0x0048B3B4,0x3F400000) --3F800000 Index arrow in movement 1
eeObj.WriteMem32(0x0048B318,0x3F400000) --3F800000 Index arrow in movement 2
eeObj.WriteMem32(0x0048C9BC,0x3F400000) --3F800000 Index arrow in movement 3
eeObj.WriteMem32(0x0048C920,0x3F400000) --3F800000 Index arrow in movement 4


eeObj.WriteMem32(0x016DE034,0x3F700000) --3F800000 Results menu
eeObj.WriteMem32(0x004A9B68,0x3F400000) --3F800000 Results choose chapter and difficulty text
eeObj.WriteMem32(0x016E0290,0x3F400000) --3F800000 Results chapter description text 1
eeObj.WriteMem32(0x016E02E4,0x3F400000) --3F800000 Results chapter description text 2
--eeObj.WriteMem32(0x016DE964,0x3F400000) --3F800000 Results time rank
eeObj.WriteMem32(0x016DE9B8,0x3F400000) --3F800000 Results combo rank
eeObj.WriteMem32(0x016DEA0C,0x3F400000) --3F800000 Results damage rank
eeObj.WriteMem32(0x016DEAB4,0x3F400000) --3F800000 Results count rank
eeObj.WriteMem32(0x016DE088,0x3F400000) --3F800000 Results bonus graphic
eeObj.WriteMem32(0x016DEB08,0x3F400000) --3F800000 Results nightmare rank
eeObj.WriteMem32(0x016DE130,0x3F400000) --3F800000 Results letter rank 1
eeObj.WriteMem32(0x016E296C,0x3F400000) --3F800000 Results chapter system text

eeObj.WriteMem32(0x006E54BC,0x3F400000) --3F800000 System selected memory card text
eeObj.WriteMem32(0x006E5420,0x3F400000) --3F800000 System unselected memory card text
eeObj.WriteMem32(0x008AFE50,0x3F400000) --3F800000 System question memory card text
eeObj.WriteMem32(0x006E5558,0x3F400000) --3F800000 System selected file text
eeObj.WriteMem32(0x006E55F4,0x3F700000) --3F800000 System menu memory card
eeObj.WriteMem32(0x008B07B8,0x3F400000) --3F800000 System description chapter text

eeObj.WriteMem32(0x006ED158,0x3F400000) --3F800000 Figures 2D graphic
eeObj.WriteMem32(0x00958110,0x3F440000) --3F800000 Figures name
eeObj.WriteMem32(0x006ED1F4,0x3F400000) --3F800000 Figures icon selection
eeObj.WriteMem32(0x006ED464,0x3F400000) --3F800000 Figures arrow right
eeObj.WriteMem32(0x006ED32C,0x3F400000) --3F800000 Figures arrow up
--eeObj.WriteMem32(0x006ED290,0x3F400000) --3F800000 Figures arrow down, Cause problem in music screen
eeObj.WriteMem32(0x006ED3C8,0x3F400000) --3F800000 Figures arrow left
eeObj.WriteMem32(0x01513B90,0x3F400000) --3F800000 Figures 3D graphic
eeObj.WriteMem32(0x006ED500,0x3F400000) --3F800000 Figures control camera text

eeObj.WriteMem32(0x20829948,0x3F400000) --3F800000 Total numbers part 1
eeObj.WriteMem32(0x20829B80,0x3F400000) --3F800000 Total numbers part 2
eeObj.WriteMem32(0x20829A98,0x3F400000) --3F800000 Total numbers part 3
--eeObj.WriteMem32(0x208204FC,0x3F400000) --3F800000 Numbers big graphic
eeObj.WriteMem32(0x20820050,0x3F400000) --3F800000 Total title 1
eeObj.WriteMem32(0x208200A4,0x3F400000) --3F800000 Total title 2
eeObj.WriteMem32(0x20820494,0x3F400000) --3F800000 Total Secret word
eeObj.WriteMem32(0x20820440,0x3F400000) --3F800000 Total Nightmare rank word
eeObj.WriteMem32(0x208200F8,0x3F400000) --3F800000 Total Difficulty mode word
eeObj.WriteMem32(0x208201F4,0x3F400000) --3F800000 Total Time word
eeObj.WriteMem32(0x20820248,0x3F400000) --3F800000 Total Souls word
eeObj.WriteMem32(0x2082029C,0x3F400000) --3F800000 Total Ranking word
eeObj.WriteMem32(0x208202F0,0x3F400000) --3F800000 Total External graphic big symbol rank
eeObj.WriteMem32(0x2082B470,0x3F400000) --3F800000 Total Symbol secret
eeObj.WriteMem32(0x2082B320,0x3F400000) --3F800000 Total Symbol rank little

eeObj.WriteMem32(0x206ED138,0x3F400000) --3F800000 Music title
--eeObj.WriteMem32(0x206ED1D4,0x3F400000) --3F800000 Music graphic musical note
eeObj.WriteMem32(0x20958110,0x3F400000) --3F800000 Music name track
eeObj.WriteMem32(0x206ED270,0x3F400000) --3F800000 Music arrow up
eeObj.WriteMem32(0x206ED30C,0x3F400000) --3F800000 Music arrow down

--eeObj.WriteMem32(0x204976E0,0x3F700000) --3F800000 Shop item wall
eeObj.WriteMem32(0x20497950,0x3F400000) --3F800000 Shop item graphic
eeObj.WriteMem32(0x204978B4,0x3F400000) --3F800000 Shop item name
eeObj.WriteMem32(0x2049A45C,0x3F400000) --3F800000 Shop icon right 2
eeObj.WriteMem32(0x2049A3C0,0x3F400000) --3F800000 Shop icon aura right 2

--Unlock All Chapters
eeObj.WriteMem32(0x204E4E38,0x00000018) --00000001

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)
