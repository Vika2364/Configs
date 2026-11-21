-- Grand Theft Auto Vice City (US)
-- emu used=Red Faction

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

if (UP ~= 0 and L1 ~= 0) then
-- Infinite Run
eeObj.WriteMem32(0x205D0DFC,0x00000001)
end

if (DOWN ~= 0 and L1 ~= 0) then
-- All Weapons At Ocean View
eeObj.WriteMem32(0x205D0D64,0x00000064)
end

if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x20158C00,0x14009DE5)
eeObj.WriteMem32(0x20158C08,0x24020063)
eeObj.WriteMem32(0x20158C70,0x24020063)
end

if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite Cash
eeObj.WriteMem32(0x205D0D5C,0x00989680)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

-- Widescreen hack
eeObj.WriteMem32(0x0013233c,0x3c013f9d) --00000000
eeObj.WriteMem32(0x00132340,0x44810000) --03e00008
eeObj.WriteMem32(0x00132344,0x46006302) --e78c86f8
eeObj.WriteMem32(0x00132348,0x03e00008) --00000000
eeObj.WriteMem32(0x0013234c,0xe78c86f8) --00000000

eeObj.WriteMem32(0x0024846c,0x0c04c8cf) --0c04c8d0
eeObj.WriteMem32(0x0027541c,0x0c04c8d2) --0c04c8d0
eeObj.WriteMem32(0x002759ec,0x0c04c8d2) --0c04c8d0

end

emuObj.AddVsyncHook(patcher)

-- Performace fix
local emuObj = getEmuObject()	
local thresholdArea = 600
emuObj.SetGsTitleFix( "ignoreUpRender", thresholdArea , {alpha=0x80008068 , zmsk=1 } )

-- Bug#9147
-- workaround ... -2104(gp) value is something wrong. the value comes from CCamera::Process().
--                unfortunately accurate math or any other flags don't help for this problem,
--				  even though it should be calculation error issue.
--				  for here, it's just given 0 radian for CSprite::RenderBufferedOneXLUSprite_Rotate_Dimension()
--				  actually the cloud is a billboard, so it should have 0 degree in view-space.
--				  so given 0 degree must be OK.... but could cause some corruption (wrong perspective or something)
eeInsnReplace(0x0032b864,0xc792f7c8,0x44809000) -- 	lwc1	$f18,-2104(gp)

-- Fix for bug #9161. The 'flying cars' cheat causes crashes when attempting to
-- fly an helicopter. We avoid that by disabling recognition of the cheat altogether.
-- The SLPM version comes with the cheat disabled out of the box.
eeInsnReplace(0x00277f24, 0x14400015, 0x10000015)	-- bnez -> b