-- Shadow Man - 2econd Coming (E)(SLES-50446)
-- ISO patch fixes bug in SOUNDREL.IRX module with texture loading on Boneyard-Ireland levels by Raziel I.C.H.I. Znot
-- Widescreen hack by Arapapa
-- emu used=Jak v2

local gpr = require("ee-gpr-alias")
apiRequest(0.1)
local eeObj = getEEObject()
local emuObj = getEmuObject()
local iopObj = getIOPObject()

local patcher = function()
--Widescreen hack 16:9 from the start
eeObj.WriteMem32(0x002b955c,0x3FE38E08) --3faaaaab
eeObj.WriteMem32(0x002b9534,0x3FE38E08) --3faaaaab

-- Game loading fix by Scalerize
--Nop the teq to avoid crash.
eeObj.WriteMem32(0x00231028, 0x10000003)
--IOP patch to avoid black screen loop.
iopObj.WriteMem32(0x00008498, 0x0)

local pad_bits  = emuObj.GetPad()
local L1  = pad_bits &  0x0400
local L3  = pad_bits &  0x0002
local R1  = pad_bits &  0x0800
local R3  = pad_bits &  0x0004
local Select  = pad_bits &  0x0001
local Start  = pad_bits &  0x0008

if (R3 ~= 0 and L3 ~= 0) then
--50 fps
eeObj.WriteMem32(0x002BBD70,0x00000000) --00000001
end
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)