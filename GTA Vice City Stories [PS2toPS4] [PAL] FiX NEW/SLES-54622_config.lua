-- Grand Theft Auto Vice City Stories (PAL)
-- emu used=jakx v2

apiRequest(2.2)

local gpr              = require("ee-gpr-alias")
local cpr              = require("ee-cpr0-alias")
local hwaddr       = require("ee-hwaddr")
local emuObj       = getEmuObject()
local eeObj          = getEEObject()
local gsObj          = getGsObject()
local eeOverlay   = eeObj.getOverlayObject()
local iopObj      = getIOPObject()

local thresholdArea = 500

local ApplyVifCycleSettings = function()
   eeObj.Vu1MpgCycles(1000)
   eeObj.SetVifDataCycleScalar(1, 2.6)
end
ApplyVifCycleSettings()

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

if (UP ~= 0 and Select ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x200C0220,0x3C0142FA)
eeObj.WriteMem32(0x200C0224,0xAC6104E4)
eeObj.WriteMem32(0x200C0228,0x080C7FCB)
eeObj.WriteMem32(0x200C022C,0xC46004E4)
eeObj.WriteMem32(0x2031FF28,0x08030088)
end
if (DOWN ~= 0 and Select ~= 0) then
-- Never Wanted
eeObj.WriteMem32(0x203AAAFC,0x24030000)
end
if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x202C1A64,0x24420000)
eeObj.WriteMem32(0x202C1AC8,0x24420000)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite Cash
eeObj.WriteMem32(0x204E4CCC,0x05F5E0FF)
eeObj.WriteMem32(0x204E4CD0,0x05F5E0FF)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
--widescreen
eeObj.WriteMem32(0x00265568,0x3c013f9d)--27BD0030
eeObj.WriteMem32(0x0026556C,0x44810000)--00000000
eeObj.WriteMem32(0x00265570,0x46006302)--3C020048
eeObj.WriteMem32(0x00265574,0x3c020048)--03E00008
eeObj.WriteMem32(0x00265578,0x03e00008)--E44C7484
eeObj.WriteMem32(0x0026557c,0xe44c7784)
eeObj.WriteMem32(0x0037AFB4,0x0c09955a)--0C0994F8
eeObj.WriteMem32(0x003BA014,0x0c09955d)--0C0994F8
eeObj.WriteMem32(0x003B9EB0,0x0c09955d)--0C0994F8
--60fps
--eeObj.WriteMem32(0x203704F4,0x10820019)--14820019
--trails off
eeObj.WriteMem32(0x21FB588C,0x00000000)--00000001
--subtitles on
eeObj.WriteMem32(0x21FB580C,0x00000001)--00000000
--widescreen on
eeObj.WriteMem32(0x21FB5830,0x00000001)--00000000
--disable rain
eeObj.WriteMem32(0x204CD5A0,0x00000000)--00000000
--graphics fix by Juano V
eeObj.WriteMem32(0x00486848,0x0)
eeObj.WriteMem32(0x00486B3C,0x0)
eeObj.WriteMem32(0x00487324,0x0)
eeObj.WriteMem32(0x2048683C,0x0)
end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

emuObj.SetGsTitleFix( "setRejectionArea", 500,{twIsNot=8, thIsNot=8 } )