-- Sled Storm
-- ported to PS4 lua
-- emu used=Oddworld Abe's Oddysee
local patcher = function()
--Widescreen
R3K_WriteMem16(0x800E0128,0x1333)
end
EM_AddVsyncHook(patcher)
