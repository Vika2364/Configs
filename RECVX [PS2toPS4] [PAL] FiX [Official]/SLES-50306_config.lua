-- VeronicaX
apiRequest(0.1)	-- request version 0.1 API. Calling apiRequest() is mandatory.

-- Bug# 9976
local emuObj = getEmuObject()	
emuObj.SetGsTitleFix( "clipScissors", "reserved", {alpha = 0 , frameW = 4 , psm = 0} )


