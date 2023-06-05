-- Silent Hill 4 The Room (SLES52445)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Enhance Game Sharpness
eeObj.WriteMem32(0x0013b370,0x240F0000)
-- Constant correct Value 0x00000080 Adjustment to disable overall Fog Effect
eeObj.WriteMem32(0x002e75D8,0x64040080)
-- Disable Blur-Effect when Ghost hangs on the Wall in Henrys Room
eeObj.WriteMem32(0x002a67e8,0x0c04088d)
-- Disable local Blur-Effects
eeObj.WriteMem32(0x0024D584,0x24020000)
-- Disable global Blur-Effects
eeObj.WriteMem32(0x002C5DA0,0x24020000)
-- Disable World-, Cutscene-, Rooms- and
-- Outside World of Window Renderer
eeObj.WriteMem32(0x001cd1b8,0xac201f00)
-- Disable Noise Filter, Film Tear Effects
-- and Blur Cones
eeObj.WriteMem32(0x00249c70,0x03E00008)
eeObj.WriteMem32(0x00249c74,0x00000000)
eeObj.WriteMem32(0x002748a0,0x03E00008)
eeObj.WriteMem32(0x002748a4,0x00000000)
-- Create clean Window for Outlook
eeObj.WriteMem32(0x0021ACDC,0x24100000)
-- 16:9
eeObj.WriteMem32(0x001485c4,0x3c013f40) -- 00000000 hor fov
eeObj.WriteMem32(0x001485d0,0x4481f000) -- 00000000
eeObj.WriteMem32(0x00148600,0x461ed683) -- 4600d647
eeObj.WriteMem32(0x00148614,0x4600d647) -- 00000000
-- FMV fix
eeObj.WriteMem32(0x002f9e44,0x3c0203c0) -- 3c020008 FMV top
eeObj.WriteMem32(0x002f9e7c,0x340201a4) -- 2662ffe0 FMV bottom
-- Black borders fix
eeObj.WriteMem32(0x001a9980,0x24030000) -- 24030001

end

emuObj.AddVsyncHook(patcher)