-- The Suffering NTSC
-- Widescreen by El_Patas
-- emu used=psycho v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local iopObj  = getIOPObject()

emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)
emuObj.ForceRefreshRate(50)


--upside-down white shadow fix
eeObj.AddHook(0x00212F7C,0xac620000,function() -- sw v0, $0000(v1)
       eeObj.SchedulerDelayEvent("gif.dma", 0x03ff)
end)

local patcher = function()
--graphics fix
eeObj.WriteMem32(0x00121A74,0x10000074) -- 0x10a00074 >> beq a1, zero, $00121C48

--Gameplay 16:9
eeObj.WriteMem32(0x001e6a8c,0xe7b40010)
eeObj.WriteMem32(0x001e6a90,0x8e020338)
eeObj.WriteMem32(0x001e6a94,0xae020330)
eeObj.WriteMem32(0x001e6a98,0x8e02033c)
eeObj.WriteMem32(0x001e6a9c,0xae020334)
eeObj.WriteMem32(0x001e6aa0,0xc6030338)
eeObj.WriteMem32(0x001e6aa4,0x468018e0)
eeObj.WriteMem32(0x001e6aa8,0x3c013f00)
eeObj.WriteMem32(0x001e6aac,0x4481b000)
eeObj.WriteMem32(0x001e6ab0,0xc600033c)
eeObj.WriteMem32(0x001e6ab4,0x46800020)
eeObj.WriteMem32(0x001e6ab8,0x3c014500)
eeObj.WriteMem32(0x001e6abc,0x44811000)
eeObj.WriteMem32(0x001e6ac0,0x3c0142ab) --both fov
eeObj.WriteMem32(0x001e6ac4,0x44810800)
eeObj.WriteMem32(0x001e6ac8,0x44862000)
eeObj.WriteMem32(0x001e6acc,0x46802120)
eeObj.WriteMem32(0x001e6ad0,0x461618c2)
eeObj.WriteMem32(0x001e6ad4,0x3c014300)
eeObj.WriteMem32(0x001e6ad8,0x44813000)
eeObj.WriteMem32(0x001e6adc,0x46160002)
eeObj.WriteMem32(0x001e6ae0,0xe60102e0)
eeObj.WriteMem32(0x001e6ae4,0x44852800)
eeObj.WriteMem32(0x001e6ae8,0x46802960)
eeObj.WriteMem32(0x001e6aec,0x3c01bf00)
eeObj.WriteMem32(0x001e6af0,0x44813800)
eeObj.WriteMem32(0x001e6af4,0x460310c1)
eeObj.WriteMem32(0x001e6af8,0xae050328)
eeObj.WriteMem32(0x001e6afc,0x46001081)
eeObj.WriteMem32(0x001e6b00,0xae06032c)
eeObj.WriteMem32(0x001e6b04,0xc6010330)
eeObj.WriteMem32(0x001e6b08,0x46800860)
eeObj.WriteMem32(0x001e6b0c,0x8e05034c)
eeObj.WriteMem32(0x001e6b10,0xc6000334)
eeObj.WriteMem32(0x001e6b14,0x46800020)
eeObj.WriteMem32(0x001e6b18,0x3c013c8e)
eeObj.WriteMem32(0x001e6b1c,0x3421fa36)
eeObj.WriteMem32(0x001e6b20,0x4481b800)
eeObj.WriteMem32(0x001e6b24,0x460518c0)
eeObj.WriteMem32(0x001e6b28,0x46041080)
eeObj.WriteMem32(0x001e6b2c,0x46000b06)
eeObj.WriteMem32(0x001e6b30,0x46160902)
eeObj.WriteMem32(0x001e6b34,0x46000346)
eeObj.WriteMem32(0x001e6b38,0x46160142)
eeObj.WriteMem32(0x001e6b3c,0x46013183)
eeObj.WriteMem32(0x001e6b40,0x46070842)
eeObj.WriteMem32(0x001e6b44,0x46070002)
eeObj.WriteMem32(0x001e6b48,0x460418c0)
eeObj.WriteMem32(0x001e6b4c,0x46051080)
eeObj.WriteMem32(0x001e6b50,0xe60102f0)
eeObj.WriteMem32(0x001e6b54,0xe60002f4)
eeObj.WriteMem32(0x001e6b58,0x46011901)
eeObj.WriteMem32(0x001e6b5c,0xe6030310)
eeObj.WriteMem32(0x001e6b60,0x46001141)
eeObj.WriteMem32(0x001e6b64,0xe6020314)
eeObj.WriteMem32(0x001e6b68,0x460118c0)
eeObj.WriteMem32(0x001e6b6c,0xe6060308)
eeObj.WriteMem32(0x001e6b70,0x46001080)
eeObj.WriteMem32(0x001e6b74,0xe604031c)
eeObj.WriteMem32(0x001e6b78,0xe6050324)
eeObj.WriteMem32(0x001e6b7c,0xe6030318)
eeObj.WriteMem32(0x001e6b80,0xe6020320)
eeObj.WriteMem32(0x001e6b84,0x8ca20000)
eeObj.WriteMem32(0x001e6b88,0x84440068)
eeObj.WriteMem32(0x001e6b8c,0x8c43006c)
eeObj.WriteMem32(0x001e6b90,0x0060f809)
eeObj.WriteMem32(0x001e6b94,0x00a42021)
eeObj.WriteMem32(0x001e6b98,0xc60202e0)
eeObj.WriteMem32(0x001e6b9c,0xc601030c)
eeObj.WriteMem32(0x001e6ba0,0x46001002)
eeObj.WriteMem32(0x001e6ba4,0x8e030350)
eeObj.WriteMem32(0x001e6ba8,0x46000847)
eeObj.WriteMem32(0x001e6bac,0x3c013f40) -- vert fov
eeObj.WriteMem32(0x001e6bb0,0x4481a000)
eeObj.WriteMem32(0x001e6bb4,0x46140002)
eeObj.WriteMem32(0x001e6bb8,0x00000000)
eeObj.WriteMem32(0x001e6bbc,0x00000000)

--Font fix
eeObj.WriteMem32(0x001f90e8,0x3c013f40) --3c013f80

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)