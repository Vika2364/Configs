-- Grand Theft Auto Vice City (PAL) (MOD)
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
-- Infinite Health
eeObj.WriteMem32(0x20B5ADA8,0x42C80000)
end
if (DOWN ~= 0 and L1 ~= 0) then
-- Sprint
eeObj.WriteMem32(0x20B5B05C,0x4479C000)
end
if (LEFT ~= 0 and Select ~= 0) then
-- Infinite Ammo
eeObj.WriteMem32(0x20158D8C,0x00000000)
eeObj.WriteMem32(0x20158DF4,0x00000000)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite Cash
eeObj.WriteMem32(0x205D265C,0x05F5E0FF)
eeObj.WriteMem32(0x205D2660,0x05F5E0FF)
end

end

emuObj.AddVsyncHook(CheckInputs)

local WS = function()
--widescreen fix
eeObj.WriteMem32(0x001324BC,0x3C013F9D)
eeObj.WriteMem32(0x001324C0,0x44810000)
eeObj.WriteMem32(0x001324C4,0x46006302)
eeObj.WriteMem32(0x001324C8,0x03E00008)
eeObj.WriteMem32(0x001324CC,0xE78C87F8)

eeObj.WriteMem32(0x002485dc,0x0C04C92F)
eeObj.WriteMem32(0x002764AC,0x0C04C932)
eeObj.WriteMem32(0x00276A7C,0x0C04C932)
 
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
eeInsnReplace(0x335d74,0xc792f8c8,0x44809000) -- 	lwc1	$f18,-1848(gp)

-- Fix for bug #9161. The 'flying cars' cheat causes crashes when attempting to
-- fly an helicopter. We avoid that by disabling recognition of the cheat altogether.
-- The SLPM version comes with the cheat disabled out of the box.
eeInsnReplace(0x27e93c, 0x14400015, 0x10000015)	-- bnez -> b
