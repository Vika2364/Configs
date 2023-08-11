--title=Burnout 3 (PAL-M4) (SLES-52584)
--emu rogue v1

apiRequest(0.1)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- 16:9 widescreen
eeObj.WriteMem32(0x20666544,0x3FE34000) -- 3FAAAAAB
eeObj.WriteMem32(0x20666540,0x3FAAAAAB) -- 3F800000 Camera zoom

--speedhack
eeObj.WriteMem32(0x206664A8,0x01000000) --01010101 Disabled Bloom, Fog and Motion blur
eeObj.WriteMem32(0x206664A0,0x01010100) --01010101 Fix Strip of colors

--emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)