-- Shadow Man - 2econd Coming (U)(SLUS-20413)
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
eeObj.WriteMem32(0x002ba00c,0x3FE38E08) --3faaaaab
eeObj.WriteMem32(0x002b9fe4,0x3FE38E08) --3faaaaab

-- Game loading fix by Scalerize
--Nop the teq to avoid crash.
eeObj.WriteMem32(0x00231AE8, 0x10000003)
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
--CONFIGURATION 4 in game, L1toL2.R1toR2 remapping
eeObj.WriteMem32(0x001f6e24,0x0803f414)
eeObj.WriteMem32(0x000fd050,0x00c0c821)
eeObj.WriteMem32(0x000fd054,0x0807db8b)
eeObj.WriteMem32(0x000fd058,0x24030070)
eeObj.WriteMem32(0x001f6e94,0x0803f417)
eeObj.WriteMem32(0x000fd05c,0x87240002)
eeObj.WriteMem32(0x000fd060,0x3085f0ff)
eeObj.WriteMem32(0x000fd064,0x93260012)
eeObj.WriteMem32(0x000fd068,0x93270013)
eeObj.WriteMem32(0x000fd06c,0x93280010)
eeObj.WriteMem32(0x000fd070,0x93290011)
eeObj.WriteMem32(0x000fd074,0x30810100)
eeObj.WriteMem32(0x000fd078,0x34a30400)
eeObj.WriteMem32(0x000fd07c,0x0061280b)
eeObj.WriteMem32(0x000fd080,0xa3260010)
eeObj.WriteMem32(0x000fd084,0x30810200)
eeObj.WriteMem32(0x000fd088,0x34a30800)
eeObj.WriteMem32(0x000fd08c,0x0061280b)
eeObj.WriteMem32(0x000fd090,0xa3270011)
eeObj.WriteMem32(0x000fd094,0x30810400)
eeObj.WriteMem32(0x000fd098,0x34a30100)
eeObj.WriteMem32(0x000fd09c,0x0061280b)
eeObj.WriteMem32(0x000fd0a0,0xa3280012)
eeObj.WriteMem32(0x000fd0a4,0x30810800)
eeObj.WriteMem32(0x000fd0a8,0x34a30200)
eeObj.WriteMem32(0x000fd0ac,0x0061280b)
eeObj.WriteMem32(0x000fd0b0,0xa3290013)
eeObj.WriteMem32(0x000fd0b4,0x03e00008)
eeObj.WriteMem32(0x000fd0b8,0xa7250002)
end
emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)