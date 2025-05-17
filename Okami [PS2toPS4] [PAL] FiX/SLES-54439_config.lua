-- Okami (SLES-54439)
-- emu used=RECVX v1

apiRequest(1.0)

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
-- 16:9
eeObj.WriteMem32(0x001974d4,0x3c014455)
eeObj.WriteMem32(0x00344864,0x3c014455)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- [Disable post-processing effect] by Gabominated
eeObj.WriteMem32(0x00190A5C,0x00000000) -- 0C06191A
eeObj.WriteMem32(0x00190A24,0x00000000) -- 0C063A6C
eeObj.WriteMem32(0x00190B34,0x00000000) -- 0C063710
eeObj.WriteMem32(0x001916D4,0x00000000) -- 0C060E70

end

emuObj.AddVsyncHook(patcher)