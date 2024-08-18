-- Starsky & Hutch (E)(SLES-51617)
-- Widescreen hack by Arapapa
-- Cheats by Code Master and Codejunkies
-- kof98

local gpr = require("ee-gpr-alias")

apiRequest(1.0)

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

if (L1 ~= 0 and UP ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x201C1FDC,0x24420000)
end
if (L3 ~= 0) then
-- Have All Items
eeObj.WriteMem32(0x20514CB0,0xFFFFFFFF)
eeObj.WriteMem32(0x20514CB4,0xFFFFFFFF)
eeObj.WriteMem32(0x20514CB8,0xFFFFFFFF)
eeObj.WriteMem32(0x20514CBC,0xFFFFFFFF)
eeObj.WriteMem32(0x20514CC0,0xFFFFFFFF)
end
if (R3 ~= 0) then
-- Unlock All Levels And Bonus Cars
eeObj.WriteMem32(0x20514C64,0x00060606)
eeObj.WriteMem32(0x20514C68,0x4D1C0003)
eeObj.WriteMem32(0x20514C6C,0x4D1C0003)
eeObj.WriteMem32(0x20514C70,0x4D1C0003)
eeObj.WriteMem32(0x20514C74,0x4D1C0003)
eeObj.WriteMem32(0x20514C78,0x4D1C0003)
eeObj.WriteMem32(0x20514C7C,0x4D1C0003)
eeObj.WriteMem32(0x20514C80,0x4D1C0003)
eeObj.WriteMem32(0x20514C84,0x4D1C0003)
eeObj.WriteMem32(0x20514C88,0x4D1C0003)
eeObj.WriteMem32(0x20514C8C,0x4D1C0003)
eeObj.WriteMem32(0x20514C90,0x4D1C0003)
eeObj.WriteMem32(0x20514C94,0x4D1C0003)
eeObj.WriteMem32(0x20514C98,0x4D1C0003)
eeObj.WriteMem32(0x20514C9C,0x4D1C0003)
eeObj.WriteMem32(0x20514CA0,0x4D1C0003)
eeObj.WriteMem32(0x20514CA4,0x4D1C0003)
eeObj.WriteMem32(0x20514CA8,0x4D1C0003)
eeObj.WriteMem32(0x20514CAC,0x4D1C0003)
end

end

emuObj.AddVsyncHook(CheckInputs)

local fix = function()

-- Widescreen hack 16:9
eeObj.WriteMem32(0x00123e4c,0x3c033f2a)
eeObj.WriteMem32(0x204CCEDC,0x3F19999A)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(fix)
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=2 } )