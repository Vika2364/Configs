-- Star Wars Starfighter (NTSC)
-- ported to PS4 Lua
-- emu used=Star Wars Jedi Starfighter v1

apiRequest(0.1)

local emuObj        = getEmuObject()
local eeObj         = getEEObject()
local iopObj       = getIOPObject()


local WS = function()

eeObj.WriteMem32(0x003f4ef8,0x24020001)  -- skip video

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)