-- Red Ninja - End of Honor PAL
-- Widescreen hack by ElHecht
-- emu used=Twisted Metal v2

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

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
-- Infinite Health
eeObj.WriteMem32(0x2016E190,0x8E211198)
eeObj.WriteMem32(0x2016E198,0xAE211194)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()
-- 16:9
eeObj.WriteMem32(0x0036dedc,0x3c013f40) -- 3c013f80 hor fov1
eeObj.WriteMem32(0x0036dee0,0x44817000) -- 44816000
eeObj.WriteMem32(0x0036def0,0x460e7303) -- 46006386

eeObj.WriteMem32(0x00402680,0x3c013f40) -- 00000000 hor fov2 (background trees)
eeObj.WriteMem32(0x00402688,0x4481f000) -- 00000000
eeObj.WriteMem32(0x004026d8,0x4602f782) -- 00000000
eeObj.WriteMem32(0x004026ec,0x461e0842) -- 46020842

eeObj.WriteMem32(0x003625c4,0x3c013f2b) -- 3c013f00 renderfix enemies

eeObj.WriteMem32(0x0010a694,0x3c01c380) -- 3c01c316 remove black bars in cut-scenes
eeObj.WriteMem32(0x0010a6c8,0x3c014380) -- 3c014316 remove black bars in cut-scenes

end

emuObj.AddVsyncHook(patcher)