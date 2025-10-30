-- Ghost Master - The Gravenville Chronicles (SLES-52671)
-- emu used=ADK

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

if (L3 ~= 0) then
--Infinite Plasma Bar 
eeObj.WriteMem32(0x202B5A80,0x0000000F)
eeObj.WriteMem32(0x202B5A84,0x0000000F)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- 16:9 
eeObj.WriteMem32(0x00105438,0x3c013f40) -- 3c013f80 hor fov
eeObj.WriteMem32(0x00105650,0x3c013f40) -- 00000000 renderfix
eeObj.WriteMem32(0x00105654,0x4481f000) -- 00000000
eeObj.WriteMem32(0x0010565c,0x461e6303) -- 00000000
end

emuObj.AddVsyncHook(patcher)