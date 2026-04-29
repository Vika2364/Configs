-- Tom Clancy’s Ghost Recon Advanced Warfighter (NTSC)
-- Menu/In-game Sutter fix
-- emu used=kof98um

apiRequest(0.1)

local emuObj      = getEmuObject()
local eeObj       = getEEObject()

emuObj.PadSetLightBar(0, 245, 5, 10)
emuObj.SetDisplayAspectWide()
emuObj.SetDeinterlace(true)

--main menu/in game stutter fix
eeObj.AddHook(0x001141dc, 0x8e650008, function() -- lw a1, $0008(s3)
  eeObj.AdvanceClock(5200)
end)

local WS = function()
--


emuObj.ThrottleMax()
end

emuObj.AddVsyncHook(WS)

----------------------------------------------------------

--[[

-- Set up the button pin
button_pin = 1 -- replace with the actual pin number
gpio.mode(button_pin, gpio.INPUT)

-- Set up the button press function
function press_button()
  -- replace with the actual code to press the button
  print("Button pressed")
end

-- Set up the loop
button_state = 0
while true do
  -- Check if the button is pressed
  if gpio.read(button_pin) == 1 then
  if button_state == 0 then
  press_button()
  button_state = 1
  end
  else
  button_state = 0
  end
end

--]]