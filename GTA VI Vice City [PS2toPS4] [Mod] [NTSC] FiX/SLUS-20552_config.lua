-- Grand Theft Auto VI Vice City (Mod)(NTSC)
-- emu used=kofos

apiRequest(0.1)


local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()
local iopObj        = getIOPObject()


gsObj.SetUpscaleMode("EdgeSmooth")
gsObj.SetUprenderMode("2x2")
gsObj.SetL2HMode(true)

emuObj.PadSetLightBar(0, 255, 5, 2)
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

if (UP ~= 0 and L1 ~= 0) then
-- Infinite Run
eeObj.WriteMem32(0x205C6FFC,0x00000001)
end
if (DOWN ~= 0 and L1 ~= 0) then
-- All Weapons At Ocean View
eeObj.WriteMem32(0x205C6F64,0x00000064)
end
if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x20158868,0x14009DE5)
eeObj.WriteMem32(0x20158870,0x24020063)
eeObj.WriteMem32(0x201588C8,0x24020063)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite Cash
eeObj.WriteMem32(0x205C6F5C,0x00989680)
end
if (LEFT ~= 0 and L1 ~= 0) then
-- Infinite Health
eeObj.WriteMem32(0x200FFF00,0x3C0542C8)
eeObj.WriteMem32(0x200FFF04,0xAC450368)
eeObj.WriteMem32(0x200FFF08,0x03E00008)
eeObj.WriteMem32(0x200FFF0C,0x46000024)
eeObj.WriteMem32(0x202D2034,0x0C03FFC0)
eeObj.WriteMem32(0x202B9D48,0x00000000)
end

end

emuObj.AddVsyncHook(CheckInputs)

local WS = function()

 
emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

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
