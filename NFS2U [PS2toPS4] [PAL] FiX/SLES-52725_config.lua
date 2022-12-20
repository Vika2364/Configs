-- Need for Speed Underground 2 (PAL)
-- emu used=aofa

apiRequest(1.0)   

local gpr = require("ee-gpr-alias")

local eeObj = getEEObject()
local emuObj = getEmuObject()

-- Fix for thin vertical lines that separate screen picture, misallignment/tearing of screen during upscaling
-- psm= SCE_GS_PSMCT32 (0)
emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )

local patcher = function()

eeObj.WriteMem32(0x001D78A8,0x100000B4) --speed fix

eeObj.WriteMem32(0x001d7fbc,0x2C420001) --60FPS

--Disable eAttachTargetMoveSprites
eeObj.WriteMem32(0x001d39d0,0x03e00008)
eeObj.WriteMem32(0x001d39d4,0x0)

--Disable DepthIntoAlpha
eeObj.WriteMem32(0x00565da4,0x0)

--Disable DepthOfField
eeObj.WriteMem32(0x00566068,0x0)

--Disable Fog
eeObj.WriteMem32(0x00565e4c,0x0)

--Disable Smear (require depthIntoAlpha to work anyway)
eeObj.WriteMem32(0x00565e98,0x0)

--Rain modifier (hacked from RainInTheHeadlights)
-- 3e000000 for full screen, 40000000 for light rain only
eeObj.WriteMem32(0x00569f10,0x40000000)

--Better Car Brightness (orig. 437F)
eeObj.WriteMem32(0x001c271c,0x3C01439F)

--Lower World Lights Flare
eeObj.WriteMem32(0x001c3ef8,0x3C013F40)

--Lower Road/Traffic Yellow/Orange Lights Flare
eeObj.WriteMem32(0x001c3278,0x3C013F50)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)