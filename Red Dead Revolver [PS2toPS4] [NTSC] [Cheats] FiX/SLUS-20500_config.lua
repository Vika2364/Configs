-- Red Dead Revolver NTSC
-- emu used=red dead

local gpr = require("ee-gpr-alias")

apiRequest(0.1)

local eeObj = getEEObject()
local emuObj = getEmuObject()

emuObj.SetDisplayAspectWide()

local patcher = function()

--Blur/Post Processing removal
eeObj.WriteMem32(0x004c4b78,0x03e00008)
eeObj.WriteMem32(0x004c4b7c,0x00000000)

--Open Characters in Multi-Missions by codejunkies
eeObj.WriteMem32(0x2013F2CC,0x24020001)

--Open Multi-Missions by Codejunkies
eeObj.WriteMem32(0x20131E5C,0x24020001)

--Unlock Journal/Multiplayer by Codejunkies
eeObj.WriteMem32(0x201003F4,0x24020001)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(patcher)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", {texMode=1} )

emuObj.SetGsTitleFix( "forceSimpleFetch",  "reserved", {psm=0} )
emuObj.SetGsTitleFix( "fetchFromCurrBuff", "reserved", {psm=0} )