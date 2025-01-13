--title=Devil May Cry Trial Edition (SLPM-65023)
--emu kof98

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- No black Borders
eeObj.WriteMem32(0x001655c8,0x64030000)

-- Disable World Renderer
eeObj.WriteMem32(0x001752fc,0x3c02437f)
eeObj.WriteMem32(0x00175308,0x00000000)
eeObj.WriteMem32(0x0017535c,0xac20bd4c)

-- No Body Shadow of the Character on the Ground
--eeObj.WriteMem32(0x001e4cfc,0x64030000)

-- Disable Blur Effect
eeObj.WriteMem32(0x00165a78,0x0000102D)
eeObj.WriteMem32(0x00165a7c,0x64020040)

-- Disable Light Enhancement through the Cathedral Windows
eeObj.WriteMem32(0x002528a4,0x46000830)
eeObj.WriteMem32(0x002528ac,0x4500000a)

end

emuObj.AddVsyncHook(patcher)