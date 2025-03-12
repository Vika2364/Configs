-- Shadow The Hedgehog NTSC
-- emu used=Star Wars Racer's Revenge v1

local gpr = require("ee-gpr-alias")

apiRequest(0.4)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

local pad_bits = emuObj.GetPad()

local UP       = pad_bits &  0x0010
local DOWN     = pad_bits &  0x0040
local LEFT     = pad_bits &  0x0080
local RIGHT    = pad_bits &  0x0020
local Triangle = pad_bits &  0x1000
local Cross    = pad_bits &  0x4000
local Square   = pad_bits &  0x8000
local Circle   = pad_bits &  0x2000
local L1       = pad_bits &  0x0400
local L2       = pad_bits &  0x0100
local L3       = pad_bits &  0x0002
local R1       = pad_bits &  0x0800
local R2       = pad_bits &  0x0200
local R3       = pad_bits &  0x0004
local Select   = pad_bits &  0x0001
local Start    = pad_bits &  0x0008

if (R1 ~= 0 and LEFT ~= 0) then -- Normal Screen
   -- original value
   eeObj.WriteMem32(0x207CF188,0x3F9DA591) -- chaos control fov
   eeObj.WriteMem32(0x20845ED8,0x3F800000) -- main fov
end

if (R1 ~= 0 and RIGHT ~= 0) then -- Widescreen Screen
   eeObj.WriteMem32(0x207CF188,0x3F199999) -- 3F9DA591 chaos control fov
   eeObj.WriteMem32(0x20845ED8,0x3FAAAAAA) -- 3F800000 main fov
end

if (R1 ~= 0 and UP ~= 0) then
-- Have 999 Rings
eeObj.WriteMem32(0x209BFF3C,0x000003E7)
end

if (R1 ~= 0 and DOWN ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x209BFF30,0x000003E7)
end

if (L3 ~= 0) then
-- Unlock All Levels
eeObj.WriteMem32(0x209BC058,0x00000001)
eeObj.WriteMem32(0x209BC0AC,0x00000001)
eeObj.WriteMem32(0x209BC100,0x00000001)
eeObj.WriteMem32(0x209BC154,0x00000001)
eeObj.WriteMem32(0x209BC1A8,0x00000001)
eeObj.WriteMem32(0x209BC1FC,0x00000001)
eeObj.WriteMem32(0x209BC250,0x00000001)
eeObj.WriteMem32(0x209BC2A4,0x00000001)
eeObj.WriteMem32(0x209BC2F8,0x00000001)
eeObj.WriteMem32(0x209BC34C,0x00000001)
eeObj.WriteMem32(0x209BC3A0,0x00000001)
eeObj.WriteMem32(0x209BC3F4,0x00000001)
eeObj.WriteMem32(0x209BC448,0x00000001)
eeObj.WriteMem32(0x209BC49C,0x00000001)
eeObj.WriteMem32(0x209BC4F0,0x00000001)
eeObj.WriteMem32(0x209BC544,0x00000001)
eeObj.WriteMem32(0x20A2FF18,0x46ED0661)
eeObj.WriteMem32(0x209BC5EC,0x00000001)
eeObj.WriteMem32(0x209BC640,0x00000001)
eeObj.WriteMem32(0x209BC694,0x00000001)
eeObj.WriteMem32(0x209BC6E8,0x00000001)
eeObj.WriteMem32(0x209BC73C,0x00000001)
end

if (R3 ~= 0) then
-- Infinite Lives
eeObj.WriteMem32(0x209BFF34,0x00000009)
end

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)