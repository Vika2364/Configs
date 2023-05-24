--Harry Potter and the Prisoner of Azkaban (PAL) (SLES-52440)
--emu used=art of fighting anthology

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--clear interrupts in handler
eeObj.WriteMem32(0x000fff00, 0x3c191000)
eeObj.WriteMem32(0x000fff04, 0x24180c00)
eeObj.WriteMem32(0x000fff08, 0x081137e0)
eeObj.WriteMem32(0x000fff0c, 0xaf380010)
eeObj.WriteMem32(0x0016fb7c, 0x0c03ffc0)

--Press L1 on the main menu screen
eeObj.WriteMem32(0x201120F8,0x24A5CCC0)

end

emuObj.AddVsyncHook(patcher)