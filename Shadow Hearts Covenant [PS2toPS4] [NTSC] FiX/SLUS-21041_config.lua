-- Shadow Hearts: Covenant (NTSC-U) (SLUS-21041) (SLUS-21044)
-- ported to PS4 Lua
-- emu used=KOF98(patched)

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()
local gsObj       = getGsObject()

local WS = function()
-- Black border fix Selector
--black borders fix (optional)
--(c843033c 803f023c to c843033c 0000023c)
--eeObj.WriteMem32(0x00402f24,0x3c020000) --3c023f80

local pad_bits  = emuObj.GetPad()

local L1  = pad_bits &  0x0400
local L3  = pad_bits &  0x0002
local R1  = pad_bits &  0x0800
local R3  = pad_bits &  0x0004
local Select  = pad_bits &  0x0001
local Start  = pad_bits &  0x0008

if (R3 ~= 0 and L3 ~= 0) then
--ON black borders fix
eeObj.WriteMem32(0x00402f24,0x3c020000) --3c023f80
end

if (L1 ~= 0 and R1 ~= 0) then
--OFF black borders fix
eeObj.WriteMem32(0x00402f24,0x3c023f80)
end

-- 16:9
eeObj.WriteMem32(0x00202c94,0x3c013f40)
eeObj.WriteMem32(0x00202c98,0x44810000)
eeObj.WriteMem32(0x00202ca0,0x4600c602)
-- Render Fix
eeObj.WriteMem32(0x0022531c,0x3c033f60)
--Flare effects fix by Arapapa
--700080c4 00000246 700080e4
eeObj.WriteMem32(0x002b4690,0x08105bd4)
eeObj.WriteMem32(0x00416f50,0xc4800070)
eeObj.WriteMem32(0x00416f54,0x3c013f40)
eeObj.WriteMem32(0x00416f58,0x4481f000)
eeObj.WriteMem32(0x00416f5c,0x461e0002)
eeObj.WriteMem32(0x00416f60,0x080ad1a5)

end
emuObj.AddVsyncHook(WS)