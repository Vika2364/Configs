-- Second Sight (PAL)
-- emu used=JakX v2

apiRequest(1.0)  

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

local gsObj  = getGsObject()

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

if (R1 ~= 0 and LEFT ~= 0) then --R1+LEFT disable2x2
   gsObj.SetUprenderMode(0) -- 0=none <> 1=2x2
   gsObj.SetUpscaleMode(0)
end

if (R1 ~= 0 and RIGHT ~= 0) then --R1+RIGHT enable2x2
   gsObj.SetUprenderMode(1) -- 0=none <> 1=2x2
   gsObj.SetUpscaleMode(0)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- 16:9
eeObj.WriteMem32(0x001a8da8,0x3c013f40) -- 00000000 hor fov
eeObj.WriteMem32(0x001a8dac,0x4481f000) -- 00000000
eeObj.WriteMem32(0x001a8de8,0x461e6303) -- 00000000

end

emuObj.AddVsyncHook(patcher)