-- 7 Sins (PAL)
-- emu used=JakX v2

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

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

if (L3 ~= 0) then
-- Infinite Sins
eeObj.WriteMem32(0x2025B9BC,0x24030000)
end
if (DOWN ~= 0 and L1 ~= 0) then
-- Display Likes
eeObj.WriteMem32(0x201782A4,0x00000000)
end
if (R3 ~= 0) then
-- Infinite Money
eeObj.WriteMem32(0x2017DC28,0x0803FFC5)
eeObj.WriteMem32(0x2017DC2C,0x00000000)
eeObj.WriteMem32(0x200FFF14,0x3C04461C)
eeObj.WriteMem32(0x200FFF18,0xAC440008)
eeObj.WriteMem32(0x200FFF1C,0xC4400008)
eeObj.WriteMem32(0x200FFF20,0x46000024)
eeObj.WriteMem32(0x200FFF24,0x0805F70C)
end
if (UP ~= 0 and L1 ~= 0) then
-- Never Fill Weakness Gauges
eeObj.WriteMem32(0x202C85CC,0x0803FFC0)
eeObj.WriteMem32(0x200FFF00,0x3C040000)
eeObj.WriteMem32(0x200FFF04,0xAC640008)
eeObj.WriteMem32(0x200FFF08,0xC4610008)
eeObj.WriteMem32(0x200FFF0C,0x080B2175)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--Widescreen hack 16:9

--Zoom
--0040023c 00088244 00000000 02080046
--2a40023c abaa4234 02080046 02080046
eeObj.WriteMem32(0x00226abc,0x3c02402a) --3c024000
eeObj.WriteMem32(0x00226ac0,0x3442aaab) --44820800
eeObj.WriteMem32(0x00226ac4,0x44820800) --00000000

--Y-Fov
--03080046 2400a0e7 2d200002
eeObj.WriteMem32(0x00226ae4,0x080bf5c4) --46000803

eeObj.WriteMem32(0x002fd710,0x46000803) --00000000
eeObj.WriteMem32(0x002fd714,0x3c013f40) --00000000
eeObj.WriteMem32(0x002fd718,0x4481f000) --00000000
eeObj.WriteMem32(0x002fd71c,0x461e0002) --00000000
eeObj.WriteMem32(0x002fd720,0x08089aba) --00000000

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )