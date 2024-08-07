-- Urban Reign NTSC (SLUS-21209)
-- Multitap fix by Kozarovv
-- emu used=kof98um

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()


emuObj.PadSetLightBar(0, 45,65,55)
emuObj.SetDeinterlace(true)
emuObj.SetDisplayAspectWide()

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

if (R1 ~= 0 and UP ~= 0) then
-- Player 1 Infinite Health
eeObj.WriteMem32(0x205A5FC8,0x05DC05DC)
end
if (L1 ~= 0 and UP ~= 0) then
-- Unlock Free and Challenge Modes
eeObj.WriteMem32(0x00946634,0x00010001)
eeObj.WriteMem32(0x00946636,0x00010001)
end
if (L3 ~= 0) then
-- Unlock All Fighters and Weapons
eeObj.WriteMem32(0x0094668E,0x00010001)
eeObj.WriteMem32(0x00946694,0x00010001)
eeObj.WriteMem32(0x00946696,0x00010001)
eeObj.WriteMem32(0x00946698,0x00010001)
eeObj.WriteMem32(0x0094669A,0x00010001)
eeObj.WriteMem32(0x0094669C,0x00010001)
eeObj.WriteMem32(0x0094669E,0x00010001)
eeObj.WriteMem32(0x009466A0,0x00010001)
eeObj.WriteMem32(0x009466A2,0x00010001)
eeObj.WriteMem32(0x009466A4,0x00010001)
eeObj.WriteMem32(0x009466A6,0x00010001)
eeObj.WriteMem32(0x009466A8,0x00010001)
eeObj.WriteMem32(0x009466AA,0x00010001)
eeObj.WriteMem32(0x009466AC,0x00010001)
eeObj.WriteMem32(0x009466AE,0x00010001)
eeObj.WriteMem32(0x009466B0,0x00010001)
eeObj.WriteMem32(0x009466B2,0x00010001)
eeObj.WriteMem32(0x009466B4,0x00010001)
eeObj.WriteMem32(0x009466B6,0x00010001)
eeObj.WriteMem32(0x009466B8,0x00010001)
eeObj.WriteMem32(0x009466BA,0x00010001)
eeObj.WriteMem32(0x009466BC,0x00010001)
eeObj.WriteMem32(0x009466BE,0x00010001)
eeObj.WriteMem32(0x009466C0,0x00010001)
eeObj.WriteMem32(0x009466C2,0x00010001)
eeObj.WriteMem32(0x009466C4,0x00010001)
eeObj.WriteMem32(0x009466C6,0x00010001)
eeObj.WriteMem32(0x009466C8,0x00010001)
eeObj.WriteMem32(0x009466CA,0x00010001)
eeObj.WriteMem32(0x009466CC,0x00010001)
eeObj.WriteMem32(0x009466CE,0x00010001)
eeObj.WriteMem32(0x009466D0,0x00010001)
eeObj.WriteMem32(0x009466D2,0x00010001)
eeObj.WriteMem32(0x009466D4,0x00010001)
eeObj.WriteMem32(0x009466D6,0x00010001)
eeObj.WriteMem32(0x009466D8,0x00010001)
eeObj.WriteMem32(0x009466DA,0x00010001)
eeObj.WriteMem32(0x009466DC,0x00010001)
eeObj.WriteMem32(0x009466DE,0x00010001)
eeObj.WriteMem32(0x009466E0,0x00010001)
eeObj.WriteMem32(0x009466E2,0x00010001)
eeObj.WriteMem32(0x009466E4,0x00010001)
eeObj.WriteMem32(0x009466E6,0x00010001)
eeObj.WriteMem32(0x009466E8,0x00010001)
eeObj.WriteMem32(0x009466EA,0x00010001)
eeObj.WriteMem32(0x009466EC,0x00010001)
eeObj.WriteMem32(0x009466EE,0x00010001)
eeObj.WriteMem32(0x009466F0,0x00010001)
eeObj.WriteMem32(0x009466F2,0x00010001)
eeObj.WriteMem32(0x009466F4,0x00010001)
eeObj.WriteMem32(0x009466F6,0x00010001)
eeObj.WriteMem32(0x009466F8,0x00010001)
eeObj.WriteMem32(0x009466FA,0x00010001)
eeObj.WriteMem32(0x009466FC,0x00010001)
eeObj.WriteMem32(0x009466FE,0x00010001)
eeObj.WriteMem32(0x00946700,0x00010001)
eeObj.WriteMem32(0x00946702,0x00010001)
eeObj.WriteMem32(0x00946704,0x00010001)
eeObj.WriteMem32(0x00946706,0x00010001)
eeObj.WriteMem32(0x00946718,0x00010001)
eeObj.WriteMem32(0x20274774,0x24030001)
eeObj.WriteMem32(0x2027477C,0xA443000E)

end

end

emuObj.AddVsyncHook(CheckInputs)

local WS = function()
-- Init first mtap
eeObj.WriteMem32(0x12BA88,0x24040000)
-- Read data from 1B port when 2A is requested
eeObj.WriteMem32(0x0ffc00,0x10040005)
eeObj.WriteMem32(0x0ffc04,0x00000000)
eeObj.WriteMem32(0x0ffc08,0x14050003)
eeObj.WriteMem32(0x0ffc10,0x24040000)
eeObj.WriteMem32(0x0ffc14,0x24050001)
eeObj.WriteMem32(0x0ffc18,0x080c5cbd)
eeObj.WriteMem32(0x0ffc1c,0x24030070)
eeObj.WriteMem32(0x3172ec,0x0803ff00)

end

emuObj.AddVsyncHook(WS)

emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 100000} )
emuObj.SetGsTitleFix( "globalSet",  "reserved", { waveThreshold = 90000} )
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )
--  Performance  fix ( bug# 9474 )
if 0 then   -- emuObj.IsNeoMode() then  -- neo mode check disabled, due to bug #10442
    emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 125000} )
else
    emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 100000} )
end