-- Dantes Inferno

apiRequest(1.0)  -- request version 1.0 API. Calling apiRequest() is mandatory.

local emuObj  = getEmuObject() -- emulator
local axObj  = getAXObject() -- allegrex

local patcher = function()

--30 FPS
local code_check1 = axObj.ReadMem16(0x001C239C)

local code_check2 = axObj.ReadMem16(0x103E4B40)

if code_check1 == 0x0064 and  code_check2 == 0x001E then


axObj.WriteMem32(0x203E4B40,0x0000001E)
axObj.WriteMem32(0x20022EE4,0x3D088889) --1/30 = 0.03333

end

end

emuObj.AddVsyncHook(patcher)