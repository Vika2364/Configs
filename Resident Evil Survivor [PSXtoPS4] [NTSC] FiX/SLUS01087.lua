-- Resident Evil Survivor
-- ported to PS4 lua
-- emu used=syphonfilter v2
local patcher = function()
--Widescreen
R3K_WriteMem16(0x80065B90,0x0C00)
end
EM_AddVsyncHook(patcher)
