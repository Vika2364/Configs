-- Onimusha Blade Warriors NTSC
-- Widescreen Hack by VIRGIN KLM
-- emu used=kof98um

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local iopObj  = getIOPObject()

emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

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

if (L3 ~= 0 and R1 ~= 0) then
-- Infinite Health Player 1
eeObj.WriteMem32(0x20509AB8,0x00640064)
end
if (L3 ~= 0 and L1 ~= 0) then
-- Infinite Special Player 1 
eeObj.WriteMem32(0x0509AC0,0x00320032)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
--force interrupt to happen, even if command is not nop
eeObj.WriteMem32(0x0030DFDC,0x00000000)
eeObj.WriteMem32(0x0030DFF0,0x10000015)
--Widescreen
eeObj.WriteMem32(0x204F7040,0x3F400000) -- 3F800000
--no interlace
eeObj.WriteMem32(0x2031359c,0x00000000)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)