-- Max Payne (SLES50325)
apiRequest(0.1)	-- request version 0.1 API. Calling apiRequest() is mandatory.


local emuObj = getEmuObject()
local eeObj  = getEEObject()


local WS = function()

-- Gameplay 16:9
-- ELF file is called "MAIN_P.RUN" 
eeObj.WriteMem32(0x0050e3b0,0x3c013f40) --00000000 (Increases hor. axis)
eeObj.WriteMem32(0x0050e3b8,0x4481f000) --00000000
eeObj.WriteMem32(0x0050e3bc,0x0c04821c) --00000000
eeObj.WriteMem32(0x0050e3c0,0x00000000) --0c04821c
eeObj.WriteMem32(0x0050e3c4,0x461e0003) --00000000
eeObj.WriteMem32(0x0050e3d4,0x461e0082) --c68201f8

end

emuObj.AddVsyncHook(WS)
