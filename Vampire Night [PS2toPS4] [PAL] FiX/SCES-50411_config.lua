
--gametitle=Vampire Night (PAL-M5) (SCES-50411)
--comment=Widescreen Hack by ElHecht
--JakX v2

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9 
eeObj.WriteMem32(0x002147e0,0x3c013f40) -- 00000000 hor fov

-- 16:10 
--eeObj.WriteMem32(0x002147e0,0x3c013f55) -- 00000000 hor fov
--eeObj.WriteMem32(0x00214800,0x34215555) -- 00000000 hor fov

-- cut-scenes black bar removal
eeObj.WriteMem32(0x002027a8,0x3c030000) -- 3c034420 remove black bars in cut-scenes


-- 16:9 and 16:10 main modifications
-- no need to change anything here! all modifications are calculated
-- based on the hor fov value in the upper 16:9/16:10 section
eeObj.WriteMem32(0x00214810,0x4481f000) -- 00000000 register preparation
eeObj.WriteMem32(0x00214828,0x46001003) -- 00000000 register preparation
eeObj.WriteMem32(0x0021482c,0x461e0742) -- 46001003 register preparation
eeObj.WriteMem32(0x00214840,0x461e0703) -- 44820000 register preparation
eeObj.WriteMem32(0x00214844,0x44820000) -- 00000000 register preparation


eeObj.WriteMem32(0x00214798,0x3c023fb6) -- 00000000 hor fov1
eeObj.WriteMem32(0x002147a0,0x3442db6e) -- 3c023fb6 hor fov1
eeObj.WriteMem32(0x002147a4,0x44826000) -- 3442db6e hor fov1
eeObj.WriteMem32(0x002147ac,0x461e6303) -- 44826000 hor fov1


eeObj.WriteMem32(0x002148f8,0x3c023fb6) -- 00000000 hor fov2
eeObj.WriteMem32(0x00214900,0x3442db6e) -- 3c023fb6 hor fov2
eeObj.WriteMem32(0x00214904,0x44826000) -- 3442db6e hor fov2
eeObj.WriteMem32(0x0021490c,0x461e6303) -- 44826000 hor fov2


eeObj.WriteMem32(0x0021506c,0x461e0843) -- 00000000 renderfix

--eeObj.WriteMem32(0x00203434,0x4601e042) -- 46012842 crosshair/aiming fix main menu
eeObj.WriteMem32(0x0020fb8c,0x461d0803) -- 46000803 crosshair/aiming fix gameplay

eeObj.WriteMem32(0x001afa48,0x3c083f80) -- 00000000 crosshair/aiming fix unit vector
eeObj.WriteMem32(0x001afa4c,0x44882000) -- 3c083f80 crosshair/aiming fix unit vector
eeObj.WriteMem32(0x001afa50,0x46002103) -- 44882000 crosshair/aiming fix unit vector
eeObj.WriteMem32(0x001afa54,0x461e26c3) -- 46002103 crosshair/aiming fix unit vector
eeObj.WriteMem32(0x001afa58,0x461b0842) -- 46040842 crosshair/aiming fix unit vector

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)