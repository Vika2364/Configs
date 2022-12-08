apiRequest(1.0)
local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
eeObj.WriteMem32(0x009313e0,0xC37f0000)
eeObj.WriteMem32(0x00931428,0xC37f0000)
end
emuObj.AddVsyncHook(patcher)