--title=Devil May Cry Trial Edition (SLPM-65023)
--emu kof98

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

if (UP ~= 0 and R1 ~= 0) then
-- Graphics Booster
eeObj.WriteMem32(0x001655c8,0x64030000)
eeObj.WriteMem32(0x001752fc,0x3c02437f)
eeObj.WriteMem32(0x00175308,0x00000000)
eeObj.WriteMem32(0x0017535c,0xac20bd4c)
eeObj.WriteMem32(0x00165a78,0x0000102D)
eeObj.WriteMem32(0x00165a7c,0x64020040)
eeObj.WriteMem32(0x002528a4,0x46000830)
eeObj.WriteMem32(0x002528ac,0x4500000a)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


end

emuObj.AddVsyncHook(patcher)