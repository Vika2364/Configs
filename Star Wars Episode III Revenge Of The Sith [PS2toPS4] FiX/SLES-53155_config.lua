-- Star Wars Episode III: Revenge Of The Sith (SLES_531.55)
-- emu used=starwars RR

apiRequest(0.4)

local gpr       = require("ee-gpr-alias")
local emuObj      = getEmuObject()
local eeObj       = getEEObject()


local WS = function()

--Gameplay 16:9
eeObj.WriteMem32(0x004dbd44,0x3c023f40) --3c023f80 
eeObj.WriteMem32(0x0051bca0,0x3c013f40) --00000000 
eeObj.WriteMem32(0x0051bcac,0x4481f000) --00000000 
eeObj.WriteMem32(0x0051bcf0,0x461e4a42) --00000000 

--Unlock All Missions
eeObj.WriteMem32(0x202B79B4,0x24020014) 
eeObj.WriteMem32(0x202B79BC,0xAE620020) 

--Free Camera (Press R1+R2 To Activate; L1+L2 To Stop)

local code_check1 = eeObj.ReadMem16(0x009B5582)
local code_check2 = eeObj.ReadMem16(0x009B5582)
local code_check3 = eeObj.ReadMem16(0x009B5582)

if code_check1 == 0xF5FF then --Press R1+R2 To Activate
eeObj.WriteMem8(0x01FDEEC3,0x00000001)
end

if code_check2 == 0xFAFF then --L1+L2 To Stop
eeObj.WriteMem8(0x01FDEEC3,0x00000000)
end

if code_check3 == 0xFF7B then --R3+LEFT Pinky
eeObj.WriteMem32(0x209948A0,0x3F800000)
eeObj.WriteMem32(0x209948A4,0x3F09999A)
eeObj.WriteMem32(0x209948A8,0x3F100000)
end

if code_check3 == 0xFFEB then --R3+UP Yellow
eeObj.WriteMem32(0x209948A0,0x3F800000)
eeObj.WriteMem32(0x209948A4,0x3F800000)
eeObj.WriteMem32(0x209948A8,0x3D000000)
end

if code_check3 == 0xFFDB then --R3+RIGHT Red
eeObj.WriteMem32(0x209948A0,0x00000000)
eeObj.WriteMem32(0x209948A4,0x3F70F0F1) --Green
eeObj.WriteMem32(0x209948A8,0x00000000)
end

if code_check3 == 0xFFBB then --R3+DOWN Purple
eeObj.WriteMem32(0x209948A0,0x3EB4B4B5)
eeObj.WriteMem32(0x209948A4,0x00000000)
eeObj.WriteMem32(0x209948A8,0x3F7AFAFB)
end

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(WS)