-- VeronicaX
apiRequest(0.1)	-- request version 0.1 API. Calling apiRequest() is mandatory.


local emuObj = getEmuObject()
local eeObj  = getEEObject()

-- Bug# 9976	
emuObj.SetGsTitleFix( "clipScissors", "reserved", {alpha = 0 , frameW = 4 , psm = 0} )


local WS = function()


-- Infinite Item Usage
eeObj.WriteMem32(0x2028AD68,0x00000000)
eeObj.WriteMem32(0x2028AD7C,0x00000000)

-- Press L2+D-Up For Item Box Anywhere
local code_check3 = eeObj.ReadMem16(0x01E0DBC2)
if code_check3 == 0xFEEF then -- L2+D-Up
eeObj.WriteMem32(0x00433166,0x00000004)
end

-- Press L2+D-Down For Open Save Menu Anywhere
local code_check3 = eeObj.ReadMem16(0x01E0DBC2)
if code_check3 == 0xFEBF then -- L2+D-Down
eeObj.WriteMem32(0x00433166,0x00000020)
end

-- Unlock All Extras
eeObj.WriteMem32(0x00433104,0x0000FFFF)

-- First Person View (Off) [L1+Square]
local code_check4 = eeObj.ReadMem16(0x01E0DBC2)
if code_check4 == 0x7BFF then -- L1+Square
eeObj.WriteMem32(0x0043315C,0x00000002)
end

-- First Person View (On) [L2+Square]
local code_check5 = eeObj.ReadMem16(0x01E0DBC2)
if code_check5 == 0x7EFF then -- L2+Square
eeObj.WriteMem32(0x0043315C,0x000000C2)
end

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(WS)
