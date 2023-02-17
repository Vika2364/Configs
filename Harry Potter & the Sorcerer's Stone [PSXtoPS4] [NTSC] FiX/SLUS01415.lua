-- Harry Potter and The Sorcerer's Stone
-- Widescreen
-- emu used=syphonfilter v2

local patcher = function()
--16:9
R3K_WriteMem32(0x800710F2,0x2000)

end

EM_AddVsyncHook(patcher)



