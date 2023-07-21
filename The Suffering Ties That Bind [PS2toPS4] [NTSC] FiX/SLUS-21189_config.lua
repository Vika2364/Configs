-- The Suffering Ties That Bind NTSC
-- Widescreen by El_Patas
-- emu used=psycho v1

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local iopObj  = getIOPObject()

emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

local patcher = function()
--Gameplay 16:9
eeObj.WriteMem32(0x00206784,0xe7b40010)
eeObj.WriteMem32(0x00206788,0x8e020348)
eeObj.WriteMem32(0x0020678c,0xae020340)
eeObj.WriteMem32(0x00206790,0x8e02034c)
eeObj.WriteMem32(0x00206794,0xae020344)
eeObj.WriteMem32(0x00206798,0xc6010344)
eeObj.WriteMem32(0x0020679c,0x46800860)
eeObj.WriteMem32(0x002067a0,0x3c01bf00)
eeObj.WriteMem32(0x002067a4,0x44810000)
eeObj.WriteMem32(0x002067a8,0xc60c0340)
eeObj.WriteMem32(0x002067ac,0x46806320)
eeObj.WriteMem32(0x002067b0,0x3c013f20)
eeObj.WriteMem32(0x002067b4,0x44811800)
eeObj.WriteMem32(0x002067b8,0x3c014500)
eeObj.WriteMem32(0x002067bc,0x44811000)
eeObj.WriteMem32(0x002067c0,0x46000b46)
eeObj.WriteMem32(0x002067c4,0x3c013ed5) --both
eeObj.WriteMem32(0x002067c8,0x44812000)
eeObj.WriteMem32(0x002067cc,0x46000842)
eeObj.WriteMem32(0x002067d0,0xae050338)
eeObj.WriteMem32(0x002067d4,0x46006002)
eeObj.WriteMem32(0x002067d8,0xe60402f0)
eeObj.WriteMem32(0x002067dc,0x460c18c3)
eeObj.WriteMem32(0x002067e0,0xae06033c)
eeObj.WriteMem32(0x002067e4,0x46011181)
eeObj.WriteMem32(0x002067e8,0x8e05035c)
eeObj.WriteMem32(0x002067ec,0x46001141)
eeObj.WriteMem32(0x002067f0,0xe6000300)
eeObj.WriteMem32(0x002067f4,0x46020900)
eeObj.WriteMem32(0x002067f8,0xe6010304)
eeObj.WriteMem32(0x002067fc,0x46020000)
eeObj.WriteMem32(0x00206800,0xe6060334)
eeObj.WriteMem32(0x00206804,0xe605032c)
eeObj.WriteMem32(0x00206808,0xe6030318)
eeObj.WriteMem32(0x0020680c,0xe6040330)
eeObj.WriteMem32(0x00206810,0xe6020320)
eeObj.WriteMem32(0x00206814,0xe6020324)
eeObj.WriteMem32(0x00206818,0xe6000328)
eeObj.WriteMem32(0x0020681c,0xe6000328)
eeObj.WriteMem32(0x00206820,0x3421fa36)
eeObj.WriteMem32(0x00206824,0x4481b000)
eeObj.WriteMem32(0x00206828,0x8ca20000)
eeObj.WriteMem32(0x0020682c,0x3c013f00)
eeObj.WriteMem32(0x00206830,0x4481b800)
eeObj.WriteMem32(0x00206834,0x84440070)
eeObj.WriteMem32(0x00206838,0x8c430074)
eeObj.WriteMem32(0x0020683c,0x0060f809)
eeObj.WriteMem32(0x00206840,0x00a42021)
eeObj.WriteMem32(0x00206844,0xc60202f0)
eeObj.WriteMem32(0x00206848,0xc601031c)
eeObj.WriteMem32(0x0020684c,0x3c013f40) --vert
eeObj.WriteMem32(0x00206850,0x4481a000)
eeObj.WriteMem32(0x00206854,0x46140002)
eeObj.WriteMem32(0x00206858,0x00000000)
eeObj.WriteMem32(0x0020685c,0x00000000)

--Font fix
--803f013c 00008144 0800e003 00000000 (2nd)
eeObj.WriteMem32(0x00220a50,0x3c013f40) --3c013f80

--graphics fix
eeObj.WriteMem32(0x00124684,0x10000074) -- 0x0x10000074 >> beq a1, zero, $00124858

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)