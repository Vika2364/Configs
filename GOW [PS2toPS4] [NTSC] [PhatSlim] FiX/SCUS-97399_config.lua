-- God Of War US SCUS-97399
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

if (L3 ~= 0) then
--Removes Title screen flames
eeObj.WriteMem32(0x011123BC,0x00000000)
end
if (R3 ~= 0) then
--Use Athena's Blades In All Modes
eeObj.WriteMem32(0x2076D808,0x00000005)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Widescreen hack by nemesis2000
eeObj.WriteMem32(0x00169250,0x3c013f11)
eeObj.WriteMem32(0x00169254,0x342135fc)
eeObj.WriteMem32(0x00169258,0x44812000)
eeObj.WriteMem32(0x0016925c,0x54620002)
eeObj.WriteMem32(0x00169260,0x8c620008)
eeObj.WriteMem32(0x00169264,0x0000102d)
eeObj.WriteMem32(0x00169268,0x1040000a)
eeObj.WriteMem32(0x0016926c,0x27a40030)
eeObj.WriteMem32(0x00169270,0xc44000f8)
eeObj.WriteMem32(0x00169274,0x3c013f00)
eeObj.WriteMem32(0x00169278,0x44816000)
eeObj.WriteMem32(0x0016927c,0x0c060ee2)
eeObj.WriteMem32(0x00169280,0x460c0302)
eeObj.WriteMem32(0x00169284,0xc7a10030)
eeObj.WriteMem32(0x00169288,0x46010003)
eeObj.WriteMem32(0x0016928c,0x10000002)
eeObj.WriteMem32(0x00169290,0xe600037c)
eeObj.WriteMem32(0x00169294,0xe604037c)
eeObj.WriteMem32(0x00169298,0xc601037c)
eeObj.WriteMem32(0x0016929c,0x44800000)
eeObj.WriteMem32(0x001692a0,0x46010034)
eeObj.WriteMem32(0x001692a4,0x45030003)
eeObj.WriteMem32(0x001692a8,0xc605037c)
eeObj.WriteMem32(0x001692ac,0xe604037c)
eeObj.WriteMem32(0x001692b0,0xc605037c)
eeObj.WriteMem32(0x001692b4,0x3c020033)
eeObj.WriteMem32(0x001692b8,0x3c013f40)
eeObj.WriteMem32(0x001692bc,0x44810800)
eeObj.WriteMem32(0x001692c0,0xc442f1b0)
eeObj.WriteMem32(0x001692c4,0x46020842)
eeObj.WriteMem32(0x001692c8,0x46012942)
eeObj.WriteMem32(0x001692cc,0xe605037c)
eeObj.WriteMem32(0x001692d0,0xc6010368)
eeObj.WriteMem32(0x001692d4,0x26050100)
eeObj.WriteMem32(0x001692d8,0xc6000370)
eeObj.WriteMem32(0x001692dc,0xc6020378)
eeObj.WriteMem32(0x001692e0,0xc604036c)
eeObj.WriteMem32(0x001692e4,0xc6030374)
eeObj.WriteMem32(0x001692e8,0x46022882)
eeObj.WriteMem32(0x001692ec,0x46012101)
eeObj.WriteMem32(0x001692f0,0x460018c1)
eeObj.WriteMem32(0x001692f4,0xc441f1b0)
eeObj.WriteMem32(0x001692f8,0x46010803)
eeObj.WriteMem32(0x001692fc,0x46041082)
eeObj.WriteMem32(0x00169300,0x46030842)
eeObj.WriteMem32(0x00169304,0x46050003)
eeObj.WriteMem32(0x00169308,0x46011083)
eeObj.WriteMem32(0x0016930c,0xe6020380)
eeObj.WriteMem32(0x00169310,0x44030000)
eeObj.WriteMem32(0x00169314,0x48a30800)
eeObj.WriteMem32(0x00169318,0x4be000ec)
eeObj.WriteMem32(0x0016931c,0x4be41b3c)
eeObj.WriteMem32(0x00169320,0x3c01bf80)
eeObj.WriteMem32(0x00169324,0x44810000)
eeObj.WriteMem32(0x00169328,0x4b012100)
eeObj.WriteMem32(0x0016932c,0x46020003)
eeObj.WriteMem32(0x00169330,0x44070000)
eeObj.WriteMem32(0x00169334,0x48a70800)
eeObj.WriteMem32(0x00169338,0x4be21b3c)
eeObj.WriteMem32(0x0016933c,0x4a811080)
eeObj.WriteMem32(0x00169340,0xc6020384)
eeObj.WriteMem32(0x00169344,0xc6030388)
eeObj.WriteMem32(0x00169348,0x46031040)
eeObj.WriteMem32(0x0016934c,0x46031001)
eeObj.WriteMem32(0x00169350,0x46000843)
eeObj.WriteMem32(0x00169354,0x24040000)
eeObj.WriteMem32(0x00169358,0x24060000)
eeObj.WriteMem32(0x0016935c,0x70861b89)
eeObj.WriteMem32(0x00169360,0x46021000)
eeObj.WriteMem32(0x00169364,0x3c08bf80)
eeObj.WriteMem32(0x00169368,0x46021881)
eeObj.WriteMem32(0x0016936c,0x46030002)
eeObj.WriteMem32(0x00169370,0x44070800)
eeObj.WriteMem32(0x00169374,0x71071389)
eeObj.WriteMem32(0x00169378,0x46020003)
eeObj.WriteMem32(0x0016937c,0x704314c8)
eeObj.WriteMem32(0x00169380,0x7fa20040)
eeObj.WriteMem32(0x00169384,0x7fa20000)
eeObj.WriteMem32(0x00169388,0x0000402d)
eeObj.WriteMem32(0x0016938c,0x44070000)
eeObj.WriteMem32(0x00169390,0x71071389)
eeObj.WriteMem32(0x00169394,0xfa040100)
eeObj.WriteMem32(0x00169398,0x704314c8)
eeObj.WriteMem32(0x0016939c,0x7fa20050)
eeObj.WriteMem32(0x001693a0,0x26040280)
eeObj.WriteMem32(0x001693a4,0x7fa20010)
eeObj.WriteMem32(0x001693a8,0xf8a20010)
eeObj.WriteMem32(0x001693ac,0x7ba20040)
eeObj.WriteMem32(0x001693b0,0x7ca20020)
eeObj.WriteMem32(0x001693b4,0x7ba20050)
eeObj.WriteMem32(0x001693b8,0x7ca20030)
eeObj.WriteMem32(0x001693bc,0x8e08037c)
eeObj.WriteMem32(0x001693c0,0x48a80800)
eeObj.WriteMem32(0x001693c4,0x4be41b3c)
eeObj.WriteMem32(0x001693c8,0x4b012100)
eeObj.WriteMem32(0x001693cc,0xc6000380)
eeObj.WriteMem32(0x001693d0,0x46000007)
eeObj.WriteMem32(0x001693d4,0x44050000)
eeObj.WriteMem32(0x001693d8,0x48a50800)
eeObj.WriteMem32(0x001693dc,0x4be21b3c)
eeObj.WriteMem32(0x001693e0,0x4a811080)
eeObj.WriteMem32(0x001693e4,0xc6010384)
eeObj.WriteMem32(0x001693e8,0xc6030388)
eeObj.WriteMem32(0x001693ec,0x46010880)
eeObj.WriteMem32(0x001693f0,0x46011801)
eeObj.WriteMem32(0x001693f4,0x46031082)
eeObj.WriteMem32(0x001693f8,0x46020003)
eeObj.WriteMem32(0x001693fc,0x44070000)
eeObj.WriteMem32(0x00169400,0x48a70800)
eeObj.WriteMem32(0x00169404,0x4a2118c0)
eeObj.WriteMem32(0x00169408,0x46030840)
eeObj.WriteMem32(0x0016940c,0x46000847)
eeObj.WriteMem32(0x00169410,0x46020843)
eeObj.WriteMem32(0x00169414,0x44080800)
eeObj.WriteMem32(0x00169418,0x3c07bf80)
eeObj.WriteMem32(0x0016941c,0x71071389)
eeObj.WriteMem32(0x00169420,0xdfbf0070)
eeObj.WriteMem32(0x00169424,0xfa040280)
eeObj.WriteMem32(0x00169428,0x704314c8)
eeObj.WriteMem32(0x0016942c,0x7fa20060)
eeObj.WriteMem32(0x00169430,0x7fa20020)
eeObj.WriteMem32(0x00169434,0xf8820010)
eeObj.WriteMem32(0x00169438,0xf8830020)
eeObj.WriteMem32(0x0016943c,0x7bb00080)
eeObj.WriteMem32(0x00169440,0x7ba20060)
eeObj.WriteMem32(0x00169444,0x7c820030)
eeObj.WriteMem32(0x00169448,0x03e00008)
eeObj.WriteMem32(0x0016944c,0x27bd0090)

--Disable Fog
eeObj.WriteMem32(0x00128278,0x24020000) --24020001

--Disable Bloom
eeObj.WriteMem32(0x00126F80,0x24030000) --24030001

end

emuObj.AddVsyncHook(patcher)

-- Fix shadow
emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )