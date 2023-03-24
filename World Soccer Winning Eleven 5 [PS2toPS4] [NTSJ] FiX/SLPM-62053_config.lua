-- World Soccer Winning Eleven 5
-- emu used=fatal fury battle archives vol2

apiRequest(0.1)

local gpr       = require("ee-gpr-alias")

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

-- Widescreen
eeObj.WriteMem32(0x00144688,0x083eb44c)
eeObj.WriteMem32(0x0014468c,0x00000000) 
eeObj.WriteMem32(0x00fad130,0x3c013f40) 
eeObj.WriteMem32(0x00fad134,0x4481f000) 
eeObj.WriteMem32(0x00fad138,0xc6010068) 
eeObj.WriteMem32(0x00fad13c,0xc602006c) 
eeObj.WriteMem32(0x00fad140,0x461e0843) 
eeObj.WriteMem32(0x00fad144,0xe6010068) 
eeObj.WriteMem32(0x00fad148,0x080511a6) 

end

emuObj.AddVsyncHook(patcher)