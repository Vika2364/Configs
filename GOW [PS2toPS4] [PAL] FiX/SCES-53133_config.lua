-- God Of War EU SCES-53133
-- JakX v2

apiRequest(2.2)

local gpr = require("ee-gpr-alias")
local cpr = require("ee-cpr0-alias")
local hwaddr = require("ee-hwaddr")

local emuObj = getEmuObject()
local eeObj = getEEObject()
local gsObj = getGsObject()
local eeOverlay = eeObj.getOverlayObject()
local iopObj = getIOPObject()

local thresholdArea = 600

emuObj.SetDisplayAspectWide()
gsObj.SetDeinterlaceShift(0)

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

if (Select ~= 0 and R1 ~= 0) then
--Removes Title screen flames (EN)
eeObj.WriteMem32(0x2112222c,0x00000000)
end

if (Select ~= 0 and UP ~= 0) then
--Use Athena's Blades In All Modes (EN)
eeObj.WriteMem32(0x2073E8C8,0x00000005)
end

if (Select ~= 0 and DOWN ~= 0) then
--Use Athena's Blades In All Modes (SPA)
eeObj.WriteMem32(0x2067F3D0,0x00000005)
eeObj.WriteMem32(0x2067F3D4,0x00000005)
eeObj.WriteMem32(0x2067F3D8,0x00000005)
eeObj.WriteMem32(0x20680E10,0x00000005)
eeObj.WriteMem32(0x20680E68,0x00000005)
eeObj.WriteMem32(0x2070A608,0x00000005)
end

if (Select ~= 0 and LEFT ~= 0) then
--Widescreen hack by nemesis2000
eeObj.WriteMem32(0x20169268,0x3c013f11)
eeObj.WriteMem32(0x2016926c,0x342135fc)
eeObj.WriteMem32(0x20169270,0x44812000)
eeObj.WriteMem32(0x20169274,0x54620002)
eeObj.WriteMem32(0x20169278,0x8c620008)
eeObj.WriteMem32(0x2016927c,0x0000102d)
eeObj.WriteMem32(0x20169280,0x1040000a)
eeObj.WriteMem32(0x20169284,0x27a40030)
eeObj.WriteMem32(0x20169288,0xc44000f8)
eeObj.WriteMem32(0x2016928c,0x3c013f00)
eeObj.WriteMem32(0x20169290,0x44816000)
eeObj.WriteMem32(0x20169294,0x0c060f1e)
eeObj.WriteMem32(0x20169298,0x460c0302)
eeObj.WriteMem32(0x2016929c,0xc7a10030)
eeObj.WriteMem32(0x201692a0,0x46010003)
eeObj.WriteMem32(0x201692a4,0x10000002)
eeObj.WriteMem32(0x201692a8,0xe600037c)
eeObj.WriteMem32(0x201692ac,0xe604037c)
eeObj.WriteMem32(0x201692b0,0xc601037c)
eeObj.WriteMem32(0x201692b4,0x44800000)
eeObj.WriteMem32(0x201692b8,0x46010034)
eeObj.WriteMem32(0x201692bc,0x45030003)
eeObj.WriteMem32(0x201692c0,0xc605037c)
eeObj.WriteMem32(0x201692c4,0xe604037c)
eeObj.WriteMem32(0x201692c8,0xc605037c)
eeObj.WriteMem32(0x201692cc,0x3c020033)
eeObj.WriteMem32(0x201692d0,0x3c013f40)
eeObj.WriteMem32(0x201692d4,0x44810800)
eeObj.WriteMem32(0x201692d8,0xc4421330)
eeObj.WriteMem32(0x201692dc,0x46020842)
eeObj.WriteMem32(0x201692e0,0x46012942)
eeObj.WriteMem32(0x201692e4,0xe605037c)
eeObj.WriteMem32(0x201692e8,0xc6010368)
eeObj.WriteMem32(0x201692ec,0x26050100)
eeObj.WriteMem32(0x201692f0,0xc6000370)
eeObj.WriteMem32(0x201692f4,0xc6020378)
eeObj.WriteMem32(0x201692f8,0xc604036c)
eeObj.WriteMem32(0x201692fc,0xc6030374)
eeObj.WriteMem32(0x20169300,0x46022882)
eeObj.WriteMem32(0x20169304,0x46012101)
eeObj.WriteMem32(0x20169308,0x460018c1)
eeObj.WriteMem32(0x2016930c,0xc4411330)
eeObj.WriteMem32(0x20169310,0x46010803)
eeObj.WriteMem32(0x20169314,0x46041082)
eeObj.WriteMem32(0x20169318,0x46030842)
eeObj.WriteMem32(0x2016931c,0x46050003)
eeObj.WriteMem32(0x20169320,0x46011083)
eeObj.WriteMem32(0x20169324,0xe6020380)
eeObj.WriteMem32(0x20169328,0x44030000)
eeObj.WriteMem32(0x2016932c,0x48a30800)
eeObj.WriteMem32(0x20169330,0x4be000ec)
eeObj.WriteMem32(0x20169334,0x4be41b3c)
eeObj.WriteMem32(0x20169338,0x3c01bf80)
eeObj.WriteMem32(0x2016933c,0x44810000)
eeObj.WriteMem32(0x20169340,0x4b012100)
eeObj.WriteMem32(0x20169344,0x46020003)
eeObj.WriteMem32(0x20169348,0x44070000)
eeObj.WriteMem32(0x2016934c,0x48a70800)
eeObj.WriteMem32(0x20169350,0x4be21b3c)
eeObj.WriteMem32(0x20169354,0x4a811080)
eeObj.WriteMem32(0x20169358,0xc6020384)
eeObj.WriteMem32(0x2016935c,0xc6030388)
eeObj.WriteMem32(0x20169360,0x46031040)
eeObj.WriteMem32(0x20169364,0x46031001)
eeObj.WriteMem32(0x20169368,0x46000843)
eeObj.WriteMem32(0x2016936c,0x24040000)
eeObj.WriteMem32(0x20169370,0x24060000)
eeObj.WriteMem32(0x20169374,0x70861b89)
eeObj.WriteMem32(0x20169378,0x46021000)
eeObj.WriteMem32(0x2016937c,0x3c08bf80)
eeObj.WriteMem32(0x20169380,0x46021881)
eeObj.WriteMem32(0x20169384,0x46030002)
eeObj.WriteMem32(0x20169388,0x44070800)
eeObj.WriteMem32(0x2016938c,0x71071389)
eeObj.WriteMem32(0x20169390,0x46020003)
eeObj.WriteMem32(0x20169394,0x704314c8)
eeObj.WriteMem32(0x20169398,0x7fa20040)
eeObj.WriteMem32(0x2016939c,0x7fa20000)
eeObj.WriteMem32(0x201693a0,0x0000402d)
eeObj.WriteMem32(0x201693a4,0x44070000)
eeObj.WriteMem32(0x201693a8,0x71071389)
eeObj.WriteMem32(0x201693ac,0xfa040100)
eeObj.WriteMem32(0x201693b0,0x704314c8)
eeObj.WriteMem32(0x201693b4,0x7fa20050)
eeObj.WriteMem32(0x201693b8,0x26040280)
eeObj.WriteMem32(0x201693bc,0x7fa20010)
eeObj.WriteMem32(0x201693c0,0xf8a20010)
eeObj.WriteMem32(0x201693c4,0x7ba20040)
eeObj.WriteMem32(0x201693c8,0x7ca20020)
eeObj.WriteMem32(0x201693cc,0x7ba20050)
eeObj.WriteMem32(0x201693d0,0x7ca20030)
eeObj.WriteMem32(0x201693d4,0x8e08037c)
eeObj.WriteMem32(0x201693d8,0x48a80800)
eeObj.WriteMem32(0x201693dc,0x4be41b3c)
eeObj.WriteMem32(0x201693e0,0x4b012100)
eeObj.WriteMem32(0x201693e4,0xc6000380)
eeObj.WriteMem32(0x201693e8,0x46000007)
eeObj.WriteMem32(0x201693ec,0x44050000)
eeObj.WriteMem32(0x201693f0,0x48a50800)
eeObj.WriteMem32(0x201693f4,0x4be21b3c)
eeObj.WriteMem32(0x201693f8,0x4a811080)
eeObj.WriteMem32(0x201693fc,0xc6010384)
eeObj.WriteMem32(0x20169400,0xc6030388)
eeObj.WriteMem32(0x20169404,0x46010880)
eeObj.WriteMem32(0x20169408,0x46011801)
eeObj.WriteMem32(0x2016940c,0x46031082)
eeObj.WriteMem32(0x20169410,0x46020003)
eeObj.WriteMem32(0x20169414,0x44070000)
eeObj.WriteMem32(0x20169418,0x48a70800)
eeObj.WriteMem32(0x2016941c,0x4a2118c0)
eeObj.WriteMem32(0x20169420,0x46030840)
eeObj.WriteMem32(0x20169424,0x46000847)
eeObj.WriteMem32(0x20169428,0x46020843)
eeObj.WriteMem32(0x2016942c,0x44080800)
eeObj.WriteMem32(0x20169430,0x3c07bf80)
eeObj.WriteMem32(0x20169434,0x71071389)
eeObj.WriteMem32(0x20169438,0xdfbf0070)
eeObj.WriteMem32(0x2016943c,0xfa040280)
eeObj.WriteMem32(0x20169440,0x704314c8)
eeObj.WriteMem32(0x20169444,0x7fa20060)
eeObj.WriteMem32(0x20169448,0x7fa20020)
eeObj.WriteMem32(0x2016944c,0xf8820010)
eeObj.WriteMem32(0x20169450,0xf8830020)
eeObj.WriteMem32(0x20169454,0x7bb00080)
eeObj.WriteMem32(0x20169458,0x7ba20060)
eeObj.WriteMem32(0x2016945c,0x7c820030)
eeObj.WriteMem32(0x20169460,0x03e00008)
eeObj.WriteMem32(0x20169464,0x27bd0090)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--Disable Fog
eeObj.WriteMem32(0x00128278,0x24020000) --24020001

--Disable Bloom
eeObj.WriteMem32(0x00126F80,0x24030000) --24030001

end

emuObj.AddVsyncHook(patcher)

-- Fix shadow
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )