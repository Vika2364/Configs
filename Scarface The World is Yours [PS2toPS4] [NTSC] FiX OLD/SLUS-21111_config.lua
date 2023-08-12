-- Scarface - The World is Yours (NTSC)
-- speed fix by Agrippa & Kozarovv
-- graphical issues fix by kozarovv
-- emu used=star ocean 3

apiRequest(0.1)

local cpr    		= require("ee-cpr0-alias")

local emuObj 		= getEmuObject()
local eeObj			= getEEObject()

emuObj.SetFormattedCard("scarface.card")
emuObj.SetDisplayAspectWide()

--PS3 config(speed up)
eeInsnReplace(0x00643790, 0xc4810020, 0x03e00008) -- pop ins might be more distracting.
eeInsnReplace(0x00643794, 0x3c033f80, 0x00000000)
eeInsnReplace(0x0064292c, 0x45010012, 0x10000012) -- This patch would affect the smaller objects also (e.g. stillages).
eeInsnReplace(0x0050ffa0, 0x3c034320, 0x3c034220)
eeInsnReplace(0x0050ff50, 0x3c033f80, 0x3c033f00)

local gfx_fix = function()
--graphics fix C
eeObj.WriteMem32(0x004F4D8C,0x10000003)
eeObj.WriteMem32(0x004F4F34,0x00000000)
eeObj.WriteMem32(0x004F4F58,0x10000007)

	if eeObj.ReadMem16(0x1B99E0, 0xE614) then 
		eeObj.AdvanceClock(500)
		eeObj.WriteMem32(0x001B90DC,0x00000000) -- bloom backbuffer
		eeObj.WriteMem32(0x001B8B88,0x00000000) -- MotionBlurEnable
		eeObj.WriteMem32(0x001B9318,0x00000000) -- MipMapLevel
		
	end	

eeObj.Vu1MpgCycles(330)
end

emuObj.AddVsyncHook(gfx_fix)

-- Uprender/Upscale fix
emuObj.SetGsTitleFix( "ignoreAreaUpdate", 0, { } )
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} ) 