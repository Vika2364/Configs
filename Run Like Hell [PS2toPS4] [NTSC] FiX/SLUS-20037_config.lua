-- Run Like Hell - Hunt or Be Hunted
-- Widescreen hack by ElHecht
-- Graphical issue fix by ?? (found in PCSX2 Game DataBase)
-- ported to PS4 Lua
-- emu used=kof98um


apiRequest(0.1)

local emuObj        = getEmuObject()
local eeObj         = getEEObject()
local iopObj       = getIOPObject()

local cop2_fix = function()
--swapping a COP2 op into place to make the flags work without delays
eeObj.WriteMem32(0x001D249C,0x4A0002FF)
eeObj.WriteMem32(0x001D24AC,0x4B07FA0B)
eeObj.WriteMem32(0x001D268C,0x4A0002FF)
eeObj.WriteMem32(0x001D269C,0x4B07FA0B)

end

emuObj.AddEntryPointHook(cop2_fix)


local WS = function()
-- 16:9
eeObj.WriteMem32(0x00110838,0x3c013f40) -- 00000000 hor fov
eeObj.WriteMem32(0x00110840,0x4481f000) -- 00000000
eeObj.WriteMem32(0x0019fe60,0x461e0583) -- 46000586

-- HUD-Fix
eeObj.WriteMem32(0x0016f328,0x3c1b3f80) -- 3c010041
eeObj.WriteMem32(0x0016f330,0x449bf000) -- 3c010041

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

local remap1 = function()
--swap L2/R2 with right stick(L/R)
eeObj.WriteMem32(0x00280a14,0x0803f414)
eeObj.WriteMem32(0x000fd050,0x00c0c821)
eeObj.WriteMem32(0x000fd054,0x080a0287)
eeObj.WriteMem32(0x000fd058,0x24030070)
eeObj.WriteMem32(0x00280a84,0x0803f417)
eeObj.WriteMem32(0x000fd05c,0x87240002)
eeObj.WriteMem32(0x000fd060,0x3085fcff)
eeObj.WriteMem32(0x000fd064,0x93260012)
eeObj.WriteMem32(0x000fd068,0x93270013)
eeObj.WriteMem32(0x000fd06c,0x93280004)
eeObj.WriteMem32(0x000fd070,0x34a30200)
eeObj.WriteMem32(0x000fd074,0x2d010041)
eeObj.WriteMem32(0x000fd078,0x0061280a)
eeObj.WriteMem32(0x000fd07c,0x3903007f)
eeObj.WriteMem32(0x000fd080,0x00031840)
eeObj.WriteMem32(0x000fd084,0x2d01007f)
eeObj.WriteMem32(0x000fd088,0x0001180a)
eeObj.WriteMem32(0x000fd08c,0xa3230013)
eeObj.WriteMem32(0x000fd090,0x34a30100)
eeObj.WriteMem32(0x000fd094,0x2d0100bf)
eeObj.WriteMem32(0x000fd098,0x0061280b)
eeObj.WriteMem32(0x000fd09c,0x2503ff80)
eeObj.WriteMem32(0x000fd0a0,0x00031840)
eeObj.WriteMem32(0x000fd0a4,0x2d010081)
eeObj.WriteMem32(0x000fd0a8,0x0001180b)
eeObj.WriteMem32(0x000fd0ac,0xa3230012)
eeObj.WriteMem32(0x000fd0b0,0x34080080)
eeObj.WriteMem32(0x000fd0b4,0x00060842)
eeObj.WriteMem32(0x000fd0b8,0x24230080)
eeObj.WriteMem32(0x000fd0bc,0x0066400b)
eeObj.WriteMem32(0x000fd0c0,0x00070842)
eeObj.WriteMem32(0x000fd0c4,0x3821007f)
eeObj.WriteMem32(0x000fd0c8,0x0027400b)
eeObj.WriteMem32(0x000fd0cc,0xa7250002)
eeObj.WriteMem32(0x000fd0d0,0x03e00008)
eeObj.WriteMem32(0x000fd0d4,0xa3280004)

end

emuObj.AddVsyncHook(remap1)

local codes = function()
--codes enable/disable
local pad_bits = emuObj.GetPad()

local UP     = pad_bits &  0x0010
local DOWN     = pad_bits &  0x0040
local LEFT     = pad_bits &  0x0080
local RIGHT     = pad_bits &  0x0020
local Triangle  = pad_bits &  0x1000
local Cross     = pad_bits &  0x4000
local Square  = pad_bits &  0x8000
local Circle    = pad_bits &  0x2000
local L1     = pad_bits &  0x0400
local L2     = pad_bits &  0x0100
local L3     = pad_bits &  0x0002
local R1     = pad_bits &  0x0800
local R2     = pad_bits &  0x0200
local R3     = pad_bits &  0x0004
local Select    = pad_bits &  0x0001
local Start     = pad_bits &  0x0008

if (R3 ~= 0 and R2 ~= 0) then
--Infinite Armor by Code Master on
eeObj.WriteMem32(0x20173B54,0x2402000A)
eeObj.WriteMem32(0x20173B5C,0xAC620224)
 
end

if (R3 ~= 0 and L2 ~= 0) then
--Infinite Armor by Code Master off
eeObj.WriteMem32(0x00173B54,0x8c620224)
eeObj.WriteMem32(0x00173B5C,0x00173b5c)
end

--View Weapon In Inventory For Max Damage by Code Master
eeObj.WriteMem32(0x20178A14,0x24820020)
eeObj.WriteMem32(0x20178A18,0xAEA2002C)

end

emuObj.AddVsyncHook(codes)