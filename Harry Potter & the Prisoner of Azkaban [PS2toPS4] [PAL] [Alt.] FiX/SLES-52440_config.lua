--Harry Potter and the Prisoner of Azkaban (PAL) (SLES-52440)
--emu used=art of fighting anthology

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--Widescreen hack by Devina and Arapapa
local pad_bits  = emuObj.GetPad()
local L1  = pad_bits &  0x0400
local L3  = pad_bits &  0x0002
local R1  = pad_bits &  0x0800
local R3  = pad_bits &  0x0004
if (L3 ~= 0 and R3 ~= 0) then --Widescreen Engaged
--X-Fov
--00000000 00000000 43ad1a46
--403f013c 00f08144 43ad1a46
eeObj.WriteMem32(0x00147af8, 0x3c013f40)
eeObj.WriteMem32(0x00147afc, 0x4481f000)
--00000000 03a51946      
--03a51946 02a51e46      
eeObj.WriteMem32(0x00147b10, 0x4619a503)
eeObj.WriteMem32(0x00147b14, 0x461ea502)
--Render fix #1
--803f013c 00608144 aa3f013c
eeObj.WriteMem32(0x001223f0, 0x3c013f40)
end

--Turning Right Analog Stick Left or Right Reverse remapping
eeObj.WriteMem32(0x003ff954,0x0803f414)
eeObj.WriteMem32(0x000fd050,0x00c0c821)
eeObj.WriteMem32(0x000fd054,0x080ffe57)
eeObj.WriteMem32(0x000fd058,0x24030070)
eeObj.WriteMem32(0x003ffaac,0x0803f417)
eeObj.WriteMem32(0x000fd05c,0x93210004)
eeObj.WriteMem32(0x000fd060,0x382400ff)
eeObj.WriteMem32(0x000fd064,0x03e00008)
eeObj.WriteMem32(0x000fd068,0xa3240004)

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