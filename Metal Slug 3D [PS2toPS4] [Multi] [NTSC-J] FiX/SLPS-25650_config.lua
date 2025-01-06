-- Metal Slug (Japan)
-- Widescreen hack by nemesis2000
-- emu used=jakx v2


apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--16:9
eeObj.WriteMem32(0x00496bf4,0x46000003)
eeObj.WriteMem32(0x00496bf8,0x7fb00010)
eeObj.WriteMem32(0x00496bfc,0xffbf0000)
eeObj.WriteMem32(0x00496c00,0x0080802d)
eeObj.WriteMem32(0x00496c04,0xc4a10004)
eeObj.WriteMem32(0x00496c08,0xc4a30000)
eeObj.WriteMem32(0x00496c0c,0x00000000)
eeObj.WriteMem32(0x00496c10,0x44811000)
eeObj.WriteMem32(0x00496c14,0x460218c3)
eeObj.WriteMem32(0x00496c18,0xe601006c)
eeObj.WriteMem32(0x00496c1c,0xe6030068)
eeObj.WriteMem32(0x00496c20,0xc6010068)
eeObj.WriteMem32(0x00496c24,0xc602006c)
eeObj.WriteMem32(0x00496c28,0x46010043)
eeObj.WriteMem32(0x00496c2c,0x8e040004)
eeObj.WriteMem32(0x00496c30,0x46020003)
eeObj.WriteMem32(0x00496c34,0x10800002)
eeObj.WriteMem32(0x00496c38,0xe6010070)
eeObj.WriteMem32(0x00496c3c,0x0c1262a2)
eeObj.WriteMem32(0x00496c40,0xe6000074)
eeObj.WriteMem32(0x00496c44,0x0200102d)
eeObj.WriteMem32(0x00496c48,0xdfbf0000)
eeObj.WriteMem32(0x00496c4c,0x7bb00010)
eeObj.WriteMem32(0x00496c50,0x03e00008)
eeObj.WriteMem32(0x00496c54,0x27bd0020)

eeObj.WriteMem32(0x0017a0d4,0x3c013f80) --

eeObj.WriteMem32(0x002e21d4,0x0c0b8a8b)

eeObj.WriteMem32(0x002e2a2c,0x27bdffd0)
eeObj.WriteMem32(0x002e2a30,0x3c0743c8)
eeObj.WriteMem32(0x002e2a34,0xffbf0010)
eeObj.WriteMem32(0x002e2a38,0x3c064396)
eeObj.WriteMem32(0x002e2a3c,0x7fb00000)
eeObj.WriteMem32(0x002e2a40,0x3c03430e)
eeObj.WriteMem32(0x002e2a44,0x8c820038)
eeObj.WriteMem32(0x002e2a48,0x0080802d)
eeObj.WriteMem32(0x002e2a4c,0xac47002c)
eeObj.WriteMem32(0x002e2a50,0x8c820038)
eeObj.WriteMem32(0x002e2a54,0xac460030)
eeObj.WriteMem32(0x002e2a58,0x8c820038)
eeObj.WriteMem32(0x002e2a5c,0xac43015c)
eeObj.WriteMem32(0x002e2a60,0x8c840038)
eeObj.WriteMem32(0x002e2a64,0x0c0b5918)
eeObj.WriteMem32(0x002e2a68,0x0000282d)
eeObj.WriteMem32(0x002e2a6c,0x8e040038)
eeObj.WriteMem32(0x002e2a70,0x0c0b59ac)
eeObj.WriteMem32(0x002e2a74,0x240500ff)
eeObj.WriteMem32(0x002e2a78,0x8e060034)
eeObj.WriteMem32(0x002e2a7c,0x24030118)
eeObj.WriteMem32(0x002e2a80,0x24040096)
eeObj.WriteMem32(0x002e2a84,0x27a2002c)
eeObj.WriteMem32(0x002e2a88,0x27a50028)
eeObj.WriteMem32(0x002e2a8c,0x8cc60060)
eeObj.WriteMem32(0x002e2a90,0xae060084)
eeObj.WriteMem32(0x002e2a94,0xa4c3001c)
eeObj.WriteMem32(0x002e2a98,0x8e030084)
eeObj.WriteMem32(0x002e2a9c,0xa464001e)
eeObj.WriteMem32(0x002e2aa0,0x8e040034)
eeObj.WriteMem32(0x002e2aa4,0xc4800068)
eeObj.WriteMem32(0x002e2aa8,0xe4400000)
eeObj.WriteMem32(0x002e2aac,0x3c013f80) --

eeObj.WriteMem32(0x002e37e4,0x3c013f80) --
eeObj.WriteMem32(0x002f8050,0x3c013f80) --


eeObj.WriteMem32(0x0030b194,0x0c0c2ac7)

eeObj.WriteMem32(0x0030ab1c,0x27bdff90)
eeObj.WriteMem32(0x0030ab20,0x3c024000)
eeObj.WriteMem32(0x0030ab24,0xffbf0040)
eeObj.WriteMem32(0x0030ab28,0x44820000)
eeObj.WriteMem32(0x0030ab2c,0x7fb20030)
eeObj.WriteMem32(0x0030ab30,0x7fb10020)
eeObj.WriteMem32(0x0030ab34,0x0080902d)
eeObj.WriteMem32(0x0030ab38,0x7fb00010)
eeObj.WriteMem32(0x0030ab3c,0x00a0882d)
eeObj.WriteMem32(0x0030ab40,0xe7b40000)
eeObj.WriteMem32(0x0030ab44,0xc4c2000c)
eeObj.WriteMem32(0x0030ab48,0x8c900000)
eeObj.WriteMem32(0x0030ab4c,0xc4810028)
eeObj.WriteMem32(0x0030ab50,0xc4c50000)
eeObj.WriteMem32(0x0030ab54,0xc4c40004)
eeObj.WriteMem32(0x0030ab58,0xc4c30008)
eeObj.WriteMem32(0x0030ab5c,0xe4820014)
eeObj.WriteMem32(0x0030ab60,0x46011502)
eeObj.WriteMem32(0x0030ab64,0x46140302)
eeObj.WriteMem32(0x0030ab68,0xe4850008)
eeObj.WriteMem32(0x0030ab6c,0xe4850018)
eeObj.WriteMem32(0x0030ab70,0xe484000c)
eeObj.WriteMem32(0x0030ab74,0xe484001c)
eeObj.WriteMem32(0x0030ab78,0xe4830010)
eeObj.WriteMem32(0x0030ab7c,0xe4830020)
eeObj.WriteMem32(0x0030ab80,0xe4820024)
eeObj.WriteMem32(0x0030ab84,0x0c125b8e)
eeObj.WriteMem32(0x0030ab88,0x0200202d)
eeObj.WriteMem32(0x0030ab8c,0x3c023a83)
eeObj.WriteMem32(0x0030ab90,0x0200202d)
eeObj.WriteMem32(0x0030ab94,0x3442126f)
eeObj.WriteMem32(0x0030ab98,0x44820000)
eeObj.WriteMem32(0x0030ab9c,0x0c125b5a)
eeObj.WriteMem32(0x0030aba0,0x46140302)
eeObj.WriteMem32(0x0030aba4,0x0200202d)
eeObj.WriteMem32(0x0030aba8,0x27a50068)
eeObj.WriteMem32(0x0030abac,0xe7b40068)
eeObj.WriteMem32(0x0030abb0,0x3c013f80) --

eeObj.WriteMem32(0x0037b26c,0x3c013f40) -- gameplay
eeObj.WriteMem32(0x0037b490,0x3c013f80) --

eeObj.WriteMem32(0x00465b08,0x0c124f6f)

eeObj.WriteMem32(0x00493dbc,0x27bdff90)
eeObj.WriteMem32(0x00493dc0,0x24050001)
eeObj.WriteMem32(0x00493dc4,0x7fb10050)
eeObj.WriteMem32(0x00493dc8,0x27a60030)
eeObj.WriteMem32(0x00493dcc,0x0080882d)
eeObj.WriteMem32(0x00493dd0,0x7fb00060)
eeObj.WriteMem32(0x00493dd4,0xffbf0040)
eeObj.WriteMem32(0x00493dd8,0x0c123094)
eeObj.WriteMem32(0x00493ddc,0x27a70034)
eeObj.WriteMem32(0x00493de0,0x10400036)
eeObj.WriteMem32(0x00493de4,0x8fa30034)
eeObj.WriteMem32(0x00493de8,0x3c02fffc)
eeObj.WriteMem32(0x00493dec,0x3442b000)
eeObj.WriteMem32(0x00493df0,0x00621821)
eeObj.WriteMem32(0x00493df4,0x2c632003)
eeObj.WriteMem32(0x00493df8,0x10600028)
eeObj.WriteMem32(0x00493dfc,0x0000282d)
eeObj.WriteMem32(0x00493e00,0x03a0202d)
eeObj.WriteMem32(0x00493e04,0x0c04b080)
eeObj.WriteMem32(0x00493e08,0x24060020)
eeObj.WriteMem32(0x00493e0c,0x8fa60030)
eeObj.WriteMem32(0x00493e10,0x0220202d)
eeObj.WriteMem32(0x00493e14,0x0c124318)
eeObj.WriteMem32(0x00493e18,0x03a0282d)
eeObj.WriteMem32(0x00493e1c,0x8fa30030)
eeObj.WriteMem32(0x00493e20,0x14430027)
eeObj.WriteMem32(0x00493e24,0x0000102d)
eeObj.WriteMem32(0x00493e28,0x0c1259f8)
eeObj.WriteMem32(0x00493e2c,0x00000000)
eeObj.WriteMem32(0x00493e30,0x0040802d)
eeObj.WriteMem32(0x00493e34,0x12000021)
eeObj.WriteMem32(0x00493e38,0x0220282d)
eeObj.WriteMem32(0x00493e3c,0x3c040062)
eeObj.WriteMem32(0x00493e40,0x2484b8d0)
eeObj.WriteMem32(0x00493e44,0x0c1244f0)
eeObj.WriteMem32(0x00493e48,0x0200302d)
eeObj.WriteMem32(0x00493e4c,0x1040001b)
eeObj.WriteMem32(0x00493e50,0x03a0282d)
eeObj.WriteMem32(0x00493e54,0x3c013f40) --cutscenes

-- tlb1
eeObj.WriteMem32(0x002d71bc,0x3c1900b4)
eeObj.WriteMem32(0x002d71c0,0xa3204607)
eeObj.WriteMem32(0x002d71c4,0x03e00008)
eeObj.WriteMem32(0x002d71c8,0xac830008)

-- tlb2
eeObj.WriteMem32(0x002d717c,0x54400005)
eeObj.WriteMem32(0x002d7180,0x8c430000)
eeObj.WriteMem32(0x002d7194,0x1000fffb)
eeObj.WriteMem32(0x002d7198,0xae030044)

-- english
--eeObj.WriteMem32(0x00657C1C,0x1)

-- lang selector hack
eeObj.WriteMem32(0x002c4330,0x27bd0040)
eeObj.WriteMem32(0x002c4334,0x080e1fd0)
eeObj.WriteMem32(0x002c4338,0x8f8499dc)
eeObj.WriteMem32(0x002f9d28,0x0c0b1090)
eeObj.WriteMem32(0x002fa10c,0x1000ffe6)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

--480p
eeInsnReplace(0x0010023c,0x00052c00,0x3c050000) -- sll a1, a1, 16
eeInsnReplace(0x00100244,0x00063400,0x3c060050) -- sll a2, a2, 16
eeInsnReplace(0x0010024c,0x00073c00,0x3c070001) -- sll a3, a3, 16
eeInsnReplace(0x0010050c,0x00094c00,0x3c090010) -- sll t1, t1, 16

