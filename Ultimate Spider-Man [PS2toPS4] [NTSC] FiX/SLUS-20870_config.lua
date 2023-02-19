--emu used=red faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--FMV freeze fix(PS4)
eeObj.WriteMem32(0x0057dc7c,0x0) -- 0x5440fffa >> bnel v0, zero, $0057dc68
--causes crash
--eeObj.WriteMem32(0x0057dc7c,0x5000fffa) -- 0x5440fffa >> bnel v0, zero, $0057dc68
--60fps
--eeObj.WriteMem32(0x20311F18,0x00000000)
--eeObj.WriteMem32(0x2069FE20,0x00000001)
--X-Fov
--7400033c 3c10e14b
eeObj.WriteMem32(0x0058b210,0x08030000)
--Widescreen hack 16:9
eeObj.WriteMem32(0x000c0000,0x3c030074) 
eeObj.WriteMem32(0x000c0004,0x3c013faa)
eeObj.WriteMem32(0x000c0008,0x3421aaab)
eeObj.WriteMem32(0x000c000c,0x4481f000)
eeObj.WriteMem32(0x000c0010,0x461e18c2)
eeObj.WriteMem32(0x000c0014,0x08162c85)

end

emuObj.AddVsyncHook(patcher)