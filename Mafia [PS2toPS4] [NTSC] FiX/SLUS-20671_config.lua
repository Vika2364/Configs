-- Mafia NTSC (SLUS-20671) (EN)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local CheckInputs = function()

local pad_bits = emuObj.GetPad()

local UP    = pad_bits &  0x0010
local DOWN    = pad_bits &  0x0040
local LEFT    = pad_bits &  0x0080
local RIGHT    = pad_bits &  0x0020
local Triangle  = pad_bits &  0x1000
local Cross    = pad_bits &  0x4000
local Square    = pad_bits &  0x8000
local Circle  = pad_bits &  0x2000
local L1    = pad_bits &  0x0400
local L2    = pad_bits &  0x0100
local L3    = pad_bits &  0x0002
local R1    = pad_bits &  0x0800
local R2    = pad_bits &  0x0200
local R3    = pad_bits &  0x0004
local Select  = pad_bits &  0x0001
local Start    = pad_bits &  0x0008

if (UP ~= 0 and R1 ~= 0) then
-- No Traffic
eeObj.WriteMem32(0x20219400,0x03E00008)
eeObj.WriteMem32(0x20219404,0x00000000)
end

if (DOWN ~= 0 and R1 ~= 0) then
-- Unlock All Cars
eeObj.WriteMem32(0x204F6254,0xFFFFFFFF)
eeObj.WriteMem32(0x204F6258,0xFFFFFFFF)
end

if (LEFT ~= 0 and R1 ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x2047D718,0x00000000)
end

if (RIGHT ~= 0 and R1 ~= 0) then
-- Infinite Time
eeObj.WriteMem32(0x202AFAB0,0x00000000)
eeObj.WriteMem32(0x202AFAD8,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--Gameplay 16:9
eeObj.WriteMem32(0x20FF8D64,0x3FAB0000) --3F800000 Vertical axis
eeObj.WriteMem32(0x20FF8E4C,0x3FAB0000) --3F800000 Horizontal axis

--Render fix
eeObj.WriteMem32(0x20FF8DB4,0x3D000000) --3D4CCCCD

--Rendering distancce
eeObj.WriteMem32(0x20FF8DB8,0x44000000) --43660000

--avoid hang before molotov party
eeObj.WriteMem32(0x003E2BB4,0x00000000) --00000000

--fix crash in The priest mission
eeObj.WriteMem32(0x0016F04C,0x1000000D) --1000000D

end

emuObj.AddVsyncHook(patcher)

-- Performace fix
local emuObj = getEmuObject()	
local thresholdArea = 600
emuObj.SetGsTitleFix( "ignoreUpRender", thresholdArea , {alpha=0x80008068 , zmsk=1 } )