-- Metal Gear Solid (NTSC) (v1.1)
-- ported to PS4 lua
-- emu used=syphonfilter 3
if true then
end
local patcher = function()
--Disable dithering
local no_dither = R3K_ReadMem16(0x017C24)
if no_dither == 0x0000 then
R3K_WriteMem16(0x80017C24,0x41E8)
end
local no_dither = R3K_ReadMem16(0x017C26)
if no_dither == 0x0000 then
R3K_WriteMem16(0x80017C26,0xA420)
end
local no_dither = R3K_ReadMem16(0x017C3C)
if no_dither == 0x0000 then
R3K_WriteMem16(0x80017C3C,0x4228)
end
local no_dither = R3K_ReadMem16(0x017C3E)
if no_dither == 0x0000 then
R3K_WriteMem16(0x80017C3E,0xA420)
end
--Have SOCOM Pistol
R3K_WriteMem16(0x800B753A,0x03E7)
R3K_WriteMem16(0x800B754E,0x03E7)
--Widescreen
R3K_WriteMem16(0x8001F6E0,0x4415)
R3K_WriteMem16(0x8001F6E2,0x0800)
R3K_WriteMem16(0x80011054,0x0000)
R3K_WriteMem16(0x80011056,0x84A2)
R3K_WriteMem16(0x80011058,0x0000)
R3K_WriteMem16(0x8001105A,0x0000)
R3K_WriteMem16(0x8001105C,0xD883)
R3K_WriteMem16(0x8001105E,0x0002)
R3K_WriteMem16(0x80011060,0x1043)
R3K_WriteMem16(0x80011062,0x0002)
R3K_WriteMem16(0x80011064,0x1021)
R3K_WriteMem16(0x80011066,0x005B)
R3K_WriteMem16(0x80011068,0x0000)
R3K_WriteMem16(0x8001106A,0xA4A2)
R3K_WriteMem16(0x8001106C,0x0004)
R3K_WriteMem16(0x8001106E,0x84A2)
R3K_WriteMem16(0x80011070,0x0000)
R3K_WriteMem16(0x80011072,0x0000)
R3K_WriteMem16(0x80011074,0xD883)
R3K_WriteMem16(0x80011076,0x0002)
R3K_WriteMem16(0x80011078,0x1043)
R3K_WriteMem16(0x8001107A,0x0002)
R3K_WriteMem16(0x8001107C,0x1021)
R3K_WriteMem16(0x8001107E,0x005B)
R3K_WriteMem16(0x80011080,0x0008)
R3K_WriteMem16(0x80011082,0x03E0)
R3K_WriteMem16(0x80011084,0x0004)
R3K_WriteMem16(0x80011086,0xA4A2)
end
EM_AddVsyncHook(patcher)
