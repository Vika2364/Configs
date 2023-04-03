--gametitle=Gran Turismo 4 [SCES-51719] (E)
--emu=siren v2

apiRequest(0.1)

local eeObj     = getEEObject()
local emuObj = getEmuObject()
local gsObj     = getGsObject()

local widescreen = function()

-- force progressive scan
eeObj.WriteMem32(0x20A57E70,0x00000001)
eeObj.WriteMem32(0x201074A0,0x24050003) --8E050004
eeObj.WriteMem32(0x2061868C,0x00000001) --00000000
eeObj.WriteMem32(0x20618694,0x00000000) --00000001

-- Autoboot in 480p
eeObj.WriteMem32(0x20436820,0xAE0516B0) --AE0010E8
eeObj.WriteMem16(0x20436910,0x10E8) --

--Field of View

-- Screen Width   (mm)
eeObj.WriteMem32(0x20A567F0,0x446E0000) -- 952mm in my case

-- Screen Height (mm)
eeObj.WriteMem32(0x20A567F4,0x4405C000) -- 535mm in my case

-- Eye Distance to Screen (mm)
eeObj.WriteMem32(0x20A567EC,0x44610000) -- 900mm in my case

-- Zoom Level (-2.0 to 2.0)
eeObj.WriteMem32(0x20A567E8,0x3f800000) -- 1.0, we already have the right FoV Better don't touch this


--Aspect Ratio

--   Single Screen Aspect Ratios
--    1 x 16:9  3f800000 
--    1 x 21:9  3FAAAAAB 
--    1 x 32:9  40000000

--   Triple Screen Aspect Ratios
--    3 x 16:9  40400000

eeObj.WriteMem32(0x20A567F8,0x3f800000) -- 16:9 in my case

-- disable colour correction channel shuffle effect
eeObj.WriteMem32(0x0033F8B8,0x1000000B) --5440000B

-- disable rendering of light sources
eeObj.WriteMem32(0x0033F6B0,0x10000031) --10400031

-- Fix shadows
eeObj.WriteMem32(0x001D6598,0x00000000) --0C075A6A

-- Added GT4 First Preview camera mode (far chase camera)
eeObj.WriteMem32(0x2037AFAC,0x84E30000)
eeObj.WriteMem16(0x2037AFB0,0x0002)
eeObj.WriteMem16(0x2037AFC0,0x0004)
eeObj.WriteMem32(0x2037AFD0,0x84E30000)

eeObj.WriteMem16(0x2037AFE0,0x0004)
eeObj.WriteMem8(0x0037AFF8,0x40)
eeObj.WriteMem16(0x2037B00A,0x8442)

eeObj.WriteMem32(0x206211E8,0x00010000)
eeObj.WriteMem32(0x206211EC,0x00060014)

end

emuObj.AddVsyncHook(widescreen)