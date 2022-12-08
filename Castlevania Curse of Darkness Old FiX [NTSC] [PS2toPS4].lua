apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
eeObj.WriteMem32(0x0092feb0,0xC37f0000)
eeObj.WriteMem32(0x0092fef8,0xC37f0000)
end
emuObj.AddVsyncHook(patcher)