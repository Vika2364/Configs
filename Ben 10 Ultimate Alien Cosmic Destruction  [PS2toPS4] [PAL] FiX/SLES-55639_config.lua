-- Ben 10 Ultimate Alien: Cosmic Destruction (PAL)
-- emu used=aofa

apiRequest(2.0)

local emuObj = getEmuObject()

--Enable native NTSC60hz mode
--Enable native widescreen video mode 16:9
--Less blur screen for scaling 2x
--ps4 fix for screen test

emuMediaPatch(0x165392, 12 + 0x5D4, { 0x24040001 }, { 0x0000202D })
emuMediaPatch(0x165392, 12 + 0x4D4, { 0x00000000 }, { 0x3C1B43E0 })
emuMediaPatch(0x165392, 12 + 0x4EC, { 0x4600A306 }, { 0x449B6000 })
emuMediaPatch(0x165392, 12 + 0x530, { 0xACC093B8 }, { 0xACC293B8 })
emuMediaPatch(0x1656E2, 12 + 0x2C4, { 0x34078000 }, { 0x0000382D })
emuMediaPatch(0x1656E2, 12 + 0x2FC, { 0x01485025 }, { 0x01405025 })
emuMediaPatch(0x1656E2, 12 + 0x388, { 0xA2040051 }, { 0xA2000051 })
emuMediaPatch(0x1656E2, 12 + 0x5D8, { 0x3404FF80 }, { 0x3404DF80 })