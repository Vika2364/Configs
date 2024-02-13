-- Tekken Tag Tournament (NTSC v2.00)
-- emu used=Siren v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj  = getEEObject()
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
--Unlock Everything
eeObj.WriteMem32(0x00439C70,0xFFFFFFFF)
eeObj.WriteMem32(0x00439C74,0x0000003F)
eeObj.WriteMem32(0x00439C78,0x00000026)
eeObj.WriteMem32(0x00439C82,0x00000103)
end

if (R3 ~= 0) then
--Allow Players To Choose Same Characters
eeObj.WriteMem32(0x003CA104,0x00000000)
end

if (Select ~= 0 and LEFT ~= 0) then
--16x9
eeObj.WriteMem32(0x0034b014,0x3c013f40)
eeObj.WriteMem32(0x0034b018,0x44810000)
eeObj.WriteMem32(0x0034b020,0x4600c602)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--No interlacing (US V2.0)
eeObj.WriteMem32(0x208BD0C8,0x00000066) --00007F67
eeObj.WriteMem32(0x208BD0D0,0x00000001) --00000003
eeObj.WriteMem32(0x208BD0D8,0x00009400) --0000948C

end

emuObj.AddVsyncHook(patcher)