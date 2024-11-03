--Drakengard (NTSC) SLUS_207.32
--emu used=eternal ring v2

apiRequest(1.5)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local CheckInputs = function()

local pad_bits = emuObj.GetPad()

local UP    = pad_bits &  0x0010
local DOWN    = pad_bits &  0x0040
local LEFT    = pad_bits &  0x0080
local RIGHT    = pad_bits &  0x0020
local Triangle  = pad_bits &  0x1000
local Cross    = pad_bits &  0x4000
local Square    = pad_bits &  0x8000
local Circle  = pad_bits &  0x2000
local L1    = pad_bits &  0x0400
local L2    = pad_bits &  0x0100
local L3    = pad_bits &  0x0002
local R1    = pad_bits &  0x0800
local R2    = pad_bits &  0x0200
local R3    = pad_bits &  0x0004
local Select  = pad_bits &  0x0001
local Start    = pad_bits &  0x0008

if (LEFT ~= 0 and Select ~= 0) then
-- Infinite & Max Special
eeObj.WriteMem32(0x203ACD10,0x00000028)
eeObj.WriteMem32(0x203ACD14,0x00000028)
end
if (RIGHT ~= 0 and Select ~= 0) then
-- Infinite & Max HP 
eeObj.WriteMem32(0x203AC860,0x00000190)
eeObj.WriteMem32(0x203AC864,0x00000190)
end

end

emuObj.AddVsyncHook(CheckInputs)

local patcher = function()

--16:9
eeObj.WriteMem32(0x202FD034,0x3C013F40) -- 00000000 hor fov
eeObj.WriteMem32(0x202FD040,0x4481F000) -- 00000000
eeObj.WriteMem32(0x202FD044,0x461EC602) -- 00000000
eeObj.WriteMem32(0x202640A4,0x3C0143D6) -- 3c0143a0 renderfix1
eeObj.WriteMem32(0x20129FC0,0x3C014456) -- 3c014420 renderfix2

eeObj.Vu1MpgCycles(500)
emuObj.ThrottleMax()

end
emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )