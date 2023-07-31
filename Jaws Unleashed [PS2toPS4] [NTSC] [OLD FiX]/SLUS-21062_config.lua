apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()
local patcher = function()
eeObj.WriteMem32(0x006758a8,0x03e42000)
eeObj.WriteMem32(0x006758b8,0x800026fc)
end
emuObj.AddVsyncHook(patcher)