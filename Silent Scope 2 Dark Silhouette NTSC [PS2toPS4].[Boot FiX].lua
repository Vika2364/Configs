apiRequest(1.0)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
eeObj.WriteMem32(0x001195f0,0x00000000)
end

emuObj.AddVsyncHook(patcher)