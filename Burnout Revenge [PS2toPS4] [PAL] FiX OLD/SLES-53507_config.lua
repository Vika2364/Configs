--title=Burnout Revenge (SLES-53507)
--emu rogue v1

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9 widescreen
eeObj.WriteMem32(0x003A64A8,0x24020002) -- 30420003
eeObj.WriteMem32(0x21BFEB10,0x3FAAAAAB) -- 3F800000 Camera zoom

--speedhack
eeObj.WriteMem32(0x21BFEA38,0x01000000) --01010101 Disabled Bloom, Fog and Motion blur
--eeObj.WriteMem32(0x21BFEA30,0x01010100) --01010101 Fix Strip of colors (Code is not necessary)

-- No Wrong Way Wall
eeObj.WriteMem32(0x002f0594,0x64040001)

end

emuObj.AddVsyncHook(patcher)