-- Genji - Dawn of the Samurai (SCUS_97471)
-- emu used=Default PS2 Emu

apiRequest(0.1)
local iopObj = getIOPObject()
local emuObj = getEmuObject()
local patcher = function()
--Fix the IOP loop causing a random freeze.
iopObj.WriteMem32(0x0006DCCC, 0x0)
end
emuObj.AddVsyncHook(patcher)