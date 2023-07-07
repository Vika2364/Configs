-- Grand Theft Auto III (NTSC)
-- emu used=KOF 98

require( "ee-gpr-alias" ) -- you can access EE GPR by alias (gpr.a0 / gpr["a0"])

apiRequest(0.1)	
 
local emuObj  = getEmuObject()
local eeObj   = getEEObject()

emuObj.PadSetLightBar(0, 145, 255, 10)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)
 
local patcher = function()
--widescreen fix
eeObj.WriteMem32(0x00184A4C,0x3C013F9D)
eeObj.WriteMem32(0x00184A50,0x44810000)
eeObj.WriteMem32(0x00184A54,0x46006302)
eeObj.WriteMem32(0x00184A58,0x03E00008)
eeObj.WriteMem32(0x00184A5C,0xE78C85C8)

eeObj.WriteMem32(0x00253BB8,0x0C061293)
eeObj.WriteMem32(0x00253D6C,0x0C061296)
eeObj.WriteMem32(0x0027B214,0x0C061296)
eeObj.WriteMem32(0x0027B6EC,0x0C061296)
-- Press L1+Up 60fps Enable

if eeObj.ReadMem16(0x00508D42) == 0xFBEF then -- L1+Up
eeObj.WriteMem32(0x2027CEAC,0x28420001) --28420002
end

-- Press L1+Down 60fps Disable

if eeObj.ReadMem16(0x00508D42) == 0xFBBF then -- L1+Down
eeObj.WriteMem32(0x2027CEAC,0x28420002) --28420002
end
--no interlace
eeObj.WriteMem32(0x2011299C,0x00000000)
--Infinite Run
eeObj.WriteMem32(0x20510490,0x00000064)

emuObj.ThrottleMax()
end
 
emuObj.AddVsyncHook(patcher)

-- Performace fix
local thresholdArea = 600
emuObj.SetGsTitleFix( "ignoreUpRender", thresholdArea , {alpha=0x80008068 , zmsk=1 } )


-- Bug#9133
-- workaround ... -16020(gp) value is something wrong. the value comes from CCamera::Process().
--                unfortunately accurate math or any other flags don't help for this problem,
--				  even though it should be calculation error issue.
--				  for here, it's just given 0 radian for CSprite::RenderBufferedOneXLUSprite_Rotate_Dimension()
--				  actually the cloud is a billboard, so it should have 0 degree in view-space.
--				  so given 0 degree must be OK.... but could cause some corruption (wrong perspective or something)
eeInsnReplace(0x318344,	0xc792c16c, 0x44809000) -- 	lwc1	$f18,-16020(gp)

local USEWIDESCREEN_ADDRESS = 0x416748

local H1 =	-- start of main()
	function()
		eeObj.WriteMem8(USEWIDESCREEN_ADDRESS, 1)	-- enable widescreen
	end

local H2 =	-- change widescreen flag
	function()
		local isWidescreen = eeObj.GetGpr(gpr.v0)
		
		if isWidescreen == 0 then
			emuObj.SetDisplayAspectNormal()
		else
			emuObj.SetDisplayAspectWide()
		end
	end

local hook1 = eeObj.AddHook(0x27ed04, 0x7fbf0000, H1)	-- <main>:
local hook2 = eeObj.AddHook(0x270e50, 0xa382b8d8, H2)	-- <CMenuManager::AnaliseMenuContents(void)>: