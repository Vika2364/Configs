-- Parasite Eve (NTSC)
-- ported to PS4 lua
-- emu used=syphonfilter 3
if true then
end
local patcher = function()
--No Battles
if R3K_ReadMem16(0x0009D0F0) == 0x0005 then --L1+L2 For On
R3K_WriteMem16(0x800A781A,0x8000)
end

if R3K_ReadMem16(0x0009D0F0) == 0x0006 then --L1+R2 For Off
R3K_WriteMem16(0x800A781A,0x0000)
end
end
EM_AddVsyncHook(patcher)
