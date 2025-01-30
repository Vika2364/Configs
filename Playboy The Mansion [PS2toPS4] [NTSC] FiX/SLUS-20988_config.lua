-- Playboy - The Mansion (NTSC-U)
-- emu used=ADK

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

if (L3 ~= 0) then
-- Maximum cash & Infinite Bank Account
eeObj.WriteMem32(0x203444B0,0x3C050000)
eeObj.WriteMem32(0x200C2000,0x3E0605F5)
eeObj.WriteMem32(0x200C2004,0x34C6E0FF)
eeObj.WriteMem32(0x200C2008,0x080D1060)
eeObj.WriteMem32(0x200C200C,0xACA601C8)
eeObj.WriteMem32(0x2037B6D0,0x08030800)
eeObj.WriteMem32(0x2037B6D4,0x00000000)
end
if (UP ~= 0 and R1 ~= 0) then
-- Unlock All Archives by Code Master
eeObj.WriteMem32(0x200C0240,0xA261000C)
eeObj.WriteMem32(0x200C0244,0x08106FE0)
eeObj.WriteMem32(0x200C0248,0x24130001)
eeObj.WriteMem32(0x2041E424,0x0C030090)
eeObj.WriteMem32(0x2041E428,0x24010001)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--math.random() + math.random(1, 99)