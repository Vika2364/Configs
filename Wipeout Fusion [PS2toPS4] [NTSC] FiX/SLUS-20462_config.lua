-- Wipeout Fusion
-- kof98um

local gpr = require("ee-gpr-alias")

require("utils")

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

emuObj.PadSetLightBar(0, 145, 255, 10)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

local FFC = function()
   eeObj.FastForwardClock()
end

local ADVC = function()
   eeObj.AdvanceClock(3300)
end

local VU1 = function()
   eeObj.Vu1MpgCycles(190)
end

local VIF1 = function()
   eeObj.SchedulerDelayEvent("vif1.dma", 0xff00)
end

--WIP track stutter fix
eeObj.AddHook(0x00236780, 0x28c21000, VU1)

local WS = function()
--built-in ws switches
eeObj.WriteMem32(0x2028E990,0x00000001) --shows ws "on" under options
eeObj.WriteMem32(0x203965CC,0x00000001) --actual switch for internal ws mode
--vert Fov
eeObj.WriteMem32(0x2024DA74,0x3FE38E38)--menu & singleplayer
eeObj.WriteMem32(0x2024DAF4,0x3FE38E38)--splitscreen left/top
eeObj.WriteMem32(0x2024DB14,0x3FE38E38)--splitscreen right
--both FOV - ingame
eeObj.WriteMem32(0x20282E80,0x43340000)
--both FOV & position - menu 3d elements
--ships & player heads
eeObj.WriteMem32(0x20282A9C,0x41DBBBBC) --ship
eeObj.WriteMem32(0x20AAAA7C,0x43055555) --faster driver (single player)
eeObj.WriteMem32(0x20AAAADC,0x43055555) --slower driver (single player)
eeObj.WriteMem32(0x20AACF3C,0x43055555) --faster driver (multi player)
eeObj.WriteMem32(0x20AACF9C,0x43055555) --slower driver (multi player)
--challenge menu, page 1 (six symbols)
eeObj.WriteMem32(0x2024705C,0xC1900000) --y-position
eeObj.WriteMem32(0x20247060,0x43700000) --FOV
eeObj.WriteMem32(0x2024706C,0xC1900000)
eeObj.WriteMem32(0x20247070,0x43700000)
eeObj.WriteMem32(0x2024707C,0xC1900000)
eeObj.WriteMem32(0x20247080,0x43700000)
eeObj.WriteMem32(0x2024708C,0xC1900000)
eeObj.WriteMem32(0x20247090,0x43700000)
eeObj.WriteMem32(0x2024709C,0xC1900000)
eeObj.WriteMem32(0x202470A0,0x43700000)
eeObj.WriteMem32(0x202470AC,0xC1900000)
eeObj.WriteMem32(0x202470B0,0x43700000)
--challenge menu, page 2 (symbol at the top & three medals)
eeObj.WriteMem32(0x202470DC,0xC2700000) --y-position
eeObj.WriteMem32(0x202470E0,0x42F00000) --FOV
eeObj.WriteMem32(0x202470F4,0x42960000)
eeObj.WriteMem32(0x202470F8,0x42F00000)
eeObj.WriteMem32(0x2024710C,0x42960000)
eeObj.WriteMem32(0x20247110,0x42F00000)
eeObj.WriteMem32(0x20247124,0x42960000)
eeObj.WriteMem32(0x20247128,0x42F00000)
--improved chase-cam (camera shows whole ship & camera angle like in the other WipeOut games)
--camera settings for all 8 vehicles (each with 2 drivers)
--6 lines for each vehicle: camera height, distance and angle for the faster driver, followed by camera height, distance and angle for the normal driver
--ship 1 & zone ship
eeObj.WriteMem32(0x2034C33C,0x400CCCCD) --faster driver
eeObj.WriteMem32(0x2034C340,0xC1500000)
eeObj.WriteMem32(0x2034C34C,0x40A00000)
eeObj.WriteMem32(0x2034CA0C,0x400CCCCD) --normal driver
eeObj.WriteMem32(0x2034CA10,0xC1500000)
eeObj.WriteMem32(0x2034CA1C,0x40A00000)
--ship 2
eeObj.WriteMem32(0x2034D0DC,0x400CCCCD)
eeObj.WriteMem32(0x2034D0E0,0xC1500000)
eeObj.WriteMem32(0x2034D0EC,0x40A00000)
eeObj.WriteMem32(0x2034D7AC,0x400CCCCD)
eeObj.WriteMem32(0x2034D7B0,0xC1500000)
eeObj.WriteMem32(0x2034D7BC,0x40A00000)
--ship 3
eeObj.WriteMem32(0x2034DE7C,0x400CCCCD)
eeObj.WriteMem32(0x2034DE80,0xC1500000)
eeObj.WriteMem32(0x2034DE8C,0x40A00000)
eeObj.WriteMem32(0x2034E54C,0x400CCCCD)
eeObj.WriteMem32(0x2034E550,0xC1500000)
eeObj.WriteMem32(0x2034E55C,0x40A00000)
--ship 4
eeObj.WriteMem32(0x2034EC1C,0x400CCCCD)
eeObj.WriteMem32(0x2034EC20,0xC1500000)
eeObj.WriteMem32(0x2034EC2C,0x40A00000)
eeObj.WriteMem32(0x2034F2EC,0x400CCCCD)
eeObj.WriteMem32(0x2034F2F0,0xC1500000)
eeObj.WriteMem32(0x2034F2FC,0x40A00000)
--ship 5
eeObj.WriteMem32(0x2034F9BC,0x400CCCCD)
eeObj.WriteMem32(0x2034F9C0,0xC1500000)
eeObj.WriteMem32(0x2034F9CC,0x40A00000)
eeObj.WriteMem32(0x2035008C,0x400CCCCD)
eeObj.WriteMem32(0x20350090,0xC1500000)
eeObj.WriteMem32(0x2035009C,0x40A00000)
--ship 6
eeObj.WriteMem32(0x2035075C,0x400CCCCD)
eeObj.WriteMem32(0x20350760,0xC1500000)
eeObj.WriteMem32(0x2035076C,0x40A00000)
eeObj.WriteMem32(0x20350E2C,0x400CCCCD)
eeObj.WriteMem32(0x20350E30,0xC1500000)
eeObj.WriteMem32(0x20350E3C,0x40A00000)
--ship 7
eeObj.WriteMem32(0x203514FC,0x400CCCCD)
eeObj.WriteMem32(0x20351500,0xC1500000)
eeObj.WriteMem32(0x2035150C,0x40A00000)
eeObj.WriteMem32(0x20351BCC,0x400CCCCD)
eeObj.WriteMem32(0x20351BD0,0xC1500000)
eeObj.WriteMem32(0x20351BDC,0x40A00000)
--ship 8
eeObj.WriteMem32(0x2035229C,0x400CCCCD)
eeObj.WriteMem32(0x203522A0,0xC1500000)
eeObj.WriteMem32(0x203522AC,0x40A00000)
eeObj.WriteMem32(0x2035296C,0x400CCCCD)
eeObj.WriteMem32(0x20352970,0xC1500000)
eeObj.WriteMem32(0x2035297C,0x40A00000)
--Unlock All Leagues by InterAct
eeObj.WriteMem32(0x203A497C,0x000007FF)
--Unlock All Weapons by InterAct
eeObj.WriteMem32(0x203A4978,0x07EFFFFF)
--Unlock All Teams & Vehicles by InterAct
eeObj.WriteMem32(0x203A58C0,0x0000FFFF)
--Unlock All Zone & TimeTrial by InterAct
eeObj.WriteMem32(0x203A58D0,0x00000003)
--Unlock All Challenges by InterAct
eeObj.WriteMem32(0x203A58C8,0xFFFFFFFF)
eeObj.WriteMem32(0x003A58CC,0xFFFFFFFF)
--Features Unlocked by Code Master
eeObj.WriteMem32(0x20248B04,0x00000001)
-- no interlace
local interlace = eeObj.ReadMem16(0x216a64)
if interlace == 0x0008 then
eeObj.WriteMem32(0x20216A64,0x00000000) -- 0x64420008 >> daddiu v0, v0, $0008
end

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)