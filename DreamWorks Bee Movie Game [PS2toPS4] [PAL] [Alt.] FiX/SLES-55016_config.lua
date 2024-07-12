-- Bee Movie Game (E)(SLES-55016)
-- Widescreen Hack by Arapapa
-- emu used=msa

apiRequest(0.1)

local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()


gsObj.SetL2HMode(true) 

--emuObj.ForceRefreshRate(30)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)


local FFC = function()
	eeObj.FastForwardClock()
end

local ADVC = function()
	eeObj.AdvanceClock(7000)
end

local VU1 = function()
	eeObj.Vu1MpgCycles(3400)
end

local VIF1 = function()
	eeObj.SchedulerDelayEvent("vif1.dma", 0)
end

local GIF = function()
	eeObj.SchedulerDelayEvent("gif.dma", 1)
end



local WS = function()
eeObj.WriteMem32(0x001864b0,0x3c023f1a) --3c023f00

--Y-Fov
--03081546 9400a0e7
eeObj.WriteMem32(0x0018652c,0x0808bad8)

eeObj.WriteMem32(0x0022eb60,0x46150803)
eeObj.WriteMem32(0x0022eb64,0x3c013faa)
eeObj.WriteMem32(0x0022eb68,0x3421aaab)
eeObj.WriteMem32(0x0022eb6c,0x4481f000)
eeObj.WriteMem32(0x0022eb70,0x461e0002)
eeObj.WriteMem32(0x0022eb74,0x0806194c)

emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)
