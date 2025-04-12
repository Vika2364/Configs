-- Need for Speed: Hot Pursuit 2 (PAL)
-- emu used=Jak2v2

apiRequest(2.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()
--ws by nemesis2000
eeObj.WriteMem32(0x0032F6FC, 0x3F400000) 
eeObj.WriteMem32(0x0032F850, 0x3F2AAAAB) 
eeObj.WriteMem32(0x0010E840, 0x3C013F2B) 
--less blur by Felixthecat1970
eeObj.WriteMem32(0x002C7ACC, 0x00000000)
eeObj.WriteMem32(0x002C7B28, 0x00000000)
eeObj.WriteMem32(0x00108274, 0x24020060)
eeObj.WriteMem32(0x002C7AE0, 0x00000000)
eeObj.WriteMem32(0x002C7B3C, 0x00000000)
--disable distant fog by Juano V
eeObj.WriteMem32(0x00118A90, 0x1000002A)
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)