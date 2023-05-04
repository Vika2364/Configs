--Gadget Racers (U)(SLUS-20225)
--Widescreen hack by Arapapa
--Avoid stack corruption, fix TLB misses (pcsx2 config)
--kof98um

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

local patcher = function()

------Avoid stack corruption, fix TLB misses----
eeObj.WriteMem32(0x00174138,0x27BDFF00)
eeObj.WriteMem32(0x00174274,0x27BD0100)
--Skip Vsync on WcCard::CommandWait loop.
--Before removing this patch, check initial loading with unformatted memory card.
--eeObj.WriteMem32(0x0017CAC0,0x00000000)

---------Widescreen hack 16:9-----------------
--X-Fov
eeObj.WriteMem32(0x00192b2c,0x3c014370)
--Render fix
eeObj.WriteMem32(0x00192b70,0x3c014020)

--skip intro video (optional)
eeObj.WriteMem32(0x001b1700,0x24020001)

emuObj.ThrottleMax()
end
emuObj.AddVsyncHook(patcher)