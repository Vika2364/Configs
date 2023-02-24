-- Urban Reign NTSC (SLUS-21209)

apiRequest(2.3)

local gpr    		= require("ee-gpr-alias")
local emuObj 		= getEmuObject()
local eeObj			= getEEObject()
local gsObj			= getGsObject()
local eeOverlay 	= eeObj.getOverlayObject()

local widescreen = function()
emuObj.PadSetLightBar(0,210,151,62)
emuObj.ThrottleNorm()
emuObj.ForceRefreshRate(60)
emuObj.SetDisplayAspectWide()
emuObj.EnableImposeMenu(true)
gsObj.SetDeinterlaceShift(0) 
--emuObj.SetFormattedCard("custom_formatted.card") 

end

emuObj.AddVsyncHook(widescreen)

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

--  Performance  fix ( bug# 9474 )
if 0 then   -- emuObj.IsNeoMode() then  -- neo mode check disabled, due to bug #10442
    emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 125000} )
else
    emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 100000} )
end
