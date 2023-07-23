-- Downhill Domination (NTSC-U) [SCUS-97177]
-- Widescreen Hacks (by Aced14)
-- no interlacing by someother1ne
-- ported to PS4
-- emu used=star wars racer's revenge v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

-- no interlace
eeInsnReplace(0x00243D34,0x30420001,0x30420000)

local patcher = function()

--Conditional live memory fixes for Bike Shop menu
local code_check1 = eeObj.ReadMem16(0xA095D0) 
if code_check1 == 0x0002 then
eeObj.WriteMem32(0x20A095D0,0x3FAA3D71) --00000000 - Bike Shop Top HUD Width (Live Memory)
eeObj.WriteMem32(0x20A09610,0x3FAA3D71) --00000000 - Bike Shop Bottom HUD Width (Live Memory)
eeObj.WriteMem32(0x20A60038,0xC2DE0000) --00000000 - Bike Shop Shadow Shape/Width (Live Memory)
end
--16:9
eeObj.WriteMem32(0x001B9EF0,0x3C014401) --  0x3C01442C, - Shell Menu Master X FOV **PS4
--eeObj.WriteMem32(0x2027F500,0x434FC000) --  0x438A8000, - Loading Screen Master X FOV
--eeObj.WriteMem32(0x2027F520,0x3F471C26) --  0x3F15551D, - Loading Screen Master Y FOV
eeObj.WriteMem32(0x001B68F4,0x3C0143d1) --  0x3C01442C, - Title Menu Master X FOV **PS4
eeObj.WriteMem32(0x2026C5C0,0x434FC000) --  0x438A8000, - Tree Sprite Width #1
eeObj.WriteMem32(0x2026C700,0x434FC000) --  0x438A8000, - Tree Sprite Width #2
eeObj.WriteMem32(0x2026C758,0x434FC000) --  0x438A8000, - Tree Sprite Width #3
eeObj.WriteMem32(0x001F8510,0x3C014401) --  0x3C01442C, - Bike Shop Menu Goggles Default Master X FOV (added to close-up float by game engine to produce a "final" close-up X FOV)
eeObj.WriteMem32(0x001F84F8,0x3C0144D8) --  0x3C014510, - Bike Shop Menu Goggles Close-up Master X FOV #1
eeObj.WriteMem32(0x001F84FC,0x3421C000) --  0x34218000, - Bike Shop Menu Goggles Close-up Master X FOV #2
eeObj.WriteMem32(0x2027F0A0,0x3F206D3A) --  0x3EF0A3D7, - Menu Master Y FOV

eeObj.WriteMem32(0x0016BA30,0x3C01434F) --  0x3C01438A, - 1P P1 Master X FOV #1
eeObj.WriteMem32(0x0016BA34,0x3421C000) --  0x34218000, - 1P P1 Master X FOV #2
eeObj.WriteMem32(0x001A8D4C,0x3C01434F) --  0x3C01438A, - 1P P1 Replay Master X FOV #1
eeObj.WriteMem32(0x001A8D50,0x3421C000) --  0x34218000, - 1P P1 Replay Master X FOV #2
eeObj.WriteMem32(0x2027ECE0,0x3F471C26) --  0x3F15551D, - 1P P1 Master Y FOV

eeObj.WriteMem32(0x2027EF00,0x43268000) --  0x435E0000, - 2P Vertical P1 Master X FOV
eeObj.WriteMem32(0x2027EF20,0x3F471C26) --  0x3F15551D, - 2P Vertical P1 Master Y FOV
eeObj.WriteMem32(0x2027EFC0,0x43268000) --  0x435E0000, - 2P Vertical P2 Master X FOV
eeObj.WriteMem32(0x2027EFE0,0x3F471C26) --  0x3F15551D, - 2P Vertical P2 Master Y FOV

eeObj.WriteMem32(0x2027ED80,0x434FC000) --  0x438A8000, - 2P Horizontal P1 Master X FOV
eeObj.WriteMem32(0x2027EDA0,0x3F471C6A) --  0x3F155550, - 2P Horizontal P1 Master Y FOV
eeObj.WriteMem32(0x2027EE40,0x434FC000) --  0x438A8000, - 2P Horizontal P2 Master X FOV
eeObj.WriteMem32(0x2027EE60,0x3F471C6A) --  0x3F155550, - 2P Horizontal P2 Master Y FOV

eeObj.WriteMem32(0x2027F140,0x431D8000) --  0x43520000, - 4P P1 Master X FOV
eeObj.WriteMem32(0x2027F160,0x3F206D3A) --  0x3EF0A3D7, - 4P P1 Master Y FOV
eeObj.WriteMem32(0x2027F200,0x431D8000) --  0x43520000, - 4P P2 Master X FOV
eeObj.WriteMem32(0x2027F220,0x3F206D3A) --  0x3EF0A3D7, - 4P P2 Master Y FOV
eeObj.WriteMem32(0x2027F2C0,0x431D8000) --  0x43520000, - 4P P3 Master X FOV
eeObj.WriteMem32(0x2027F2E0,0x3F206D3A) --  0x3EF0A3D7, - 4P P3 Master Y FOV
eeObj.WriteMem32(0x2027F380,0x431D8000) --  0x43520000, - 4P P4 Master X FOV
eeObj.WriteMem32(0x2027F3A0,0x3F206D3A) --  0x3EF0A3D7, - 4P P4 Master Y FOV

eeObj.WriteMem32(0x2027ECC0,0x434FC000) --  0x438A8000, - 2-4P P1-4 Paused Master X FOV

--Disable Sun and its Cones
--eeObj.WriteMem32(0x0029DBA5,0x0)
--Disable Characters Shadows
eeObj.WriteMem32(0x0029E268,0)
--Disable Stages Backdrop
--eeObj.WriteMem32(0x0029E200,0x0)


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)