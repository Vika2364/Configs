-- Mat Hoffman's Pro BMX
-- ported to PS4 lua
-- emu used=syphonfilter v2
local patcher = function()
--Widescreen (Vert-)
R3K_WriteMem16(0x80028130,0x1333)
end
EM_AddVsyncHook(patcher)
