-- Red Dead Revolver PAL
-- emu used=red dead

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

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

if (L3 ~= 0) then
--jack
eeObj.WriteMem32(0x2074043C,0x6B636A6D)
end
if (L3 ~= 0 and UP ~= 0) then
--cristina
eeObj.WriteMem32(0x2074043C,0x6E74636D)
end
if (L3 ~= 0 and DOWN ~= 0) then
--red color 2
eeObj.WriteMem32(0x2074043C,0x6472736D)
eeObj.WriteMem32(0x20740488,0x00000002)
end
if (L3 ~= 0 and LEFT ~= 0) then
--annie stoakes
eeObj.WriteMem32(0x2074043C,0x696E616D)
end
if (L3 ~= 0 and RIGHT ~= 0) then
--wisckey treadwell
eeObj.WriteMem32(0x2074043C,0x6B73776D)
end
if (L3 ~= 0 and Square ~= 0) then
--red jr
eeObj.WriteMem32(0x2074043C,0x0064726D)
end
if (L3 ~= 0 and R1 ~= 0) then
--manequin
eeObj.WriteMem32(0x2074043C,0x6B6F6D6D)
end
if (L3 ~= 0 and L2 ~= 0) then
--nate harlow
eeObj.WriteMem32(0x2074043C,0x6461646D)
end
if (L3 ~= 0 and R3 ~= 0) then
--pig josh
eeObj.WriteMem32(0x2074043C,0x6A67706D)
end
if (L3 ~= 0 and R2 ~= 0) then
--holstein hall
eeObj.WriteMem32(0x2074043C,0x6263746D)
end
if (L3 ~= 0 and Select ~= 0) then
--professor perry
eeObj.WriteMem32(0x2074043C,0x7972706D)
end
if (L3 ~= 0 and Start ~= 0) then
--the blade slade
eeObj.WriteMem32(0x2074043C,0x6977626D)
end
if (L1 ~= 0 and UP ~= 0) then
--hedgehog thornton
eeObj.WriteMem32(0x2074043C,0x6864686D)
end
if (L1 ~= 0 and DOWN ~= 0) then
--sissy fess
eeObj.WriteMem32(0x2074043C,0x6F74736D)
end
if (L1 ~= 0 and RIGHT ~= 0) then
--smiley fawler
eeObj.WriteMem32(0x2074043C,0x616B616D)
end
if (L1 ~= 0 and LEFT ~= 0) then
--ugly chris
eeObj.WriteMem32(0x2074043C,0x6C67756D)
end
if (L1 ~= 0 and L2 ~= 0) then
--gigolo hancock
eeObj.WriteMem32(0x2074043C,0x6C67676D)
end
if (L1 ~= 0 and L3 ~= 0) then
--gabriel navarro
eeObj.WriteMem32(0x2074043C,0x747A7A6D)
end
if (L1 ~= 0 and R3 ~= 0) then
--mathias lampry
eeObj.WriteMem32(0x2074043C,0x0032706E)
end
if (L1 ~= 0 and Start ~= 0) then
--lilly belle parsons
eeObj.WriteMem32(0x2074043C,0x0062706E)
end
if (L2 ~= 0 and UP ~= 0) then
--willy wilson
eeObj.WriteMem32(0x2074043C,0x00646F6E)
end
if (L2 ~= 0 and DOWN ~= 0) then
--atlas jones
eeObj.WriteMem32(0x2074043C,0x006B6F72)
end
if (L2 ~= 0 and RIGHT ~= 0) then
--hank pullman
eeObj.WriteMem32(0x2074043C,0x00766474)
end
if (L2 ~= 0 and LEFT ~= 0) then
--npc
eeObj.WriteMem32(0x2074043C,0x00627262)
end
if (L2 ~= 0 and Triangle ~= 0) then
--npc 2
eeObj.WriteMem32(0x2074043C,0x00646872)
end
if (L2 ~= 0 and Cross ~= 0) then
--sam boss
eeObj.WriteMem32(0x2074043C,0x006B6374)
end
if (L2 ~= 0 and Square ~= 0) then
--rat chavez
eeObj.WriteMem32(0x2074043C,0x00686473)
end
if (L2 ~= 0 and Circle ~= 0) then
--cheryl-lynn
eeObj.WriteMem32(0x2074043C,0x00616D62)
end
if (L2 ~= 0 and R2 ~= 0) then
--jesse lynch
eeObj.WriteMem32(0x2074043C,0x0073656A)
end
if (Select ~= 0) then
--general diego
eeObj.WriteMem32(0x2074043C,0x6F67646D)
end
if (Select ~= 0 and R1 ~= 0) then
--bad bessie
eeObj.WriteMem32(0x2074043C,0x7974626D)
end
if (Select ~= 0 and R2 ~= 0) then
--abigail peppercorn
eeObj.WriteMem32(0x2074043C,0x0061706E)
end
if (Select ~= 0 and UP ~= 0) then
--verne wiggins
eeObj.WriteMem32(0x2074043C,0x0034706E)
end

end

emuObj.AddVsyncHook(CheckInputs)

emuObj.SetDisplayAspectWide()

local patcher = function()

--Blur/Post Processing removal
eeObj.WriteMem32(0x004C71F8,0x03e00008) -- 27BDFFF0
eeObj.WriteMem32(0x004C71FC,0x00000000) -- FFBF0000

--Open Characters in Multi-Missions by codejunkies
eeObj.WriteMem32(0x2013FC3C,0x24020001)

--Open Multi-Missions by Codejunkies
eeObj.WriteMem32(0x20132794,0x24020001)

--Open Journal by Codejunkies
eeObj.WriteMem32(0x2011CCF8,0x24020001)

--Unlock Journal/Multiplayer by Codejunkies
eeObj.WriteMem32(0x201003F4,0x24020001)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )