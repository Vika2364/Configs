-- Gun NTSC (SLUS-21139)
-- emu used=Red Faction

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

--koza's vu rounding
eeObj.WriteMem32(0x004738c0,0xd3400000)

--freeze skip
eeObj.WriteMem32(0x001a0f08,0x100000a6) -- 0x120000a6

-- speed Selector
local pad_bits    = emuObj.GetPad()

local L1  = pad_bits &  0x0400
local L3  = pad_bits &  0x0002
local R1  = pad_bits &  0x0800
local R3  = pad_bits &  0x0004

if (L1 ~= 0 and R3 ~= 0) then --60fps

--60 fps
eeObj.WriteMem32(0x2028ED08,0x1000000B)
end

if (L3 ~= 0 and R1 ~= 0) then --normal mode

eeObj.WriteMem32(0x2028ED08,0x1040000b) -- beq v0, zero, $0028ed38
end

end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )