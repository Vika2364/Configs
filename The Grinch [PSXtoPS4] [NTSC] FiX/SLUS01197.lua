-- The Grinch (NTSC)
-- ported to PS4 lua
-- emu used=syphonfilter 3
local patcher = function()
--Widescreen
R3K_WriteMem16(0x8009A704,0x0C00)
end
EM_AddVsyncHook(patcher)
