--gametitle= Devil May Cry (PAL-M5) [SLES-50358] CRC= [7D8F539A]
--emu kof98

apiRequest(0.1)

local emuObj = getEmuObject()
local eeObj  = getEEObject()
local gsObj  = getGsObject()

emuObj.SetGsTitleFix( "ignoreSubBuffCov", "reserved", {  } )

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

local code_check1 = 0x00000000
local code_check2 = 0x00000000
local code_check3 = 0x00000000
local code_check4 = 0x00000000

local widescreen = function()

--60hz Gameplay
code_check1 = eeObj.ReadMem32(0x00740698) --Gameplay

if (code_check1 == 0x00000001) then

   code_check2 = eeObj.ReadMem32(0x007411B0) --FMV
   code_check3 = eeObj.ReadMem8(0x00740664)  --Cutscenes 1
   code_check4 = eeObj.ReadMem8(0x00740668)  --Cutscenes 2

   if (code_check2 == 0x01E00000) then

      emuObj.PadSetLightBar(0, 255, 0, 0) --RED

      if (code_check3 ~= 0x00 and code_check4 ~= 0x00) then

          emuObj.PadSetLightBar(0, 0, 255, 0) --GREEN

          emuObj.ForceRefreshRate(50)

      elseif (code_check3 == 0x00 and code_check4 == 0x00) then

          emuObj.PadSetLightBar(0, 0, 255, 255) --CIAN

          emuObj.ForceRefreshRate(60)

          eeObj.WriteMem32(0x00202260,0x34050002) --34050002
          eeObj.WriteMem32(0x00202264,0x24030002) --24030002
          eeObj.WriteMem32(0x00202268,0x0000000C)
          eeObj.WriteMem32(0x0020226C,0x03E00008)

      end

   end

end

code_check1 = eeObj.ReadMem32(0x00740698)
code_check2 = eeObj.ReadMem32(0x007411B0)

if (code_check1 == 0x00000000) or (code_check2== 0x01C25770) then
   emuObj.ForceRefreshRate(50)
end

local code_disable2x2 = eeObj.ReadMem16(0x00753872) --R1+LEFT
local code_enable2x2  = eeObj.ReadMem16(0x00753872) --R1+RIGHT

if (code_disable2x2 == 0x0880) then --R1+LEFT
   gsObj.SetUprenderMode(0) -- 0=none <> 1=2x2
   gsObj.SetUpscaleMode(0)
end

if (code_enable2x2 == 0x0820) then --R1+RIGHT
   gsObj.SetUprenderMode(1) -- 0=none <> 1=2x2
   gsObj.SetUpscaleMode(0)
end

--16x9
eeObj.WriteMem32(0x0010338c,0x3c013f40)
eeObj.WriteMem32(0x00103390,0x44810000)
eeObj.WriteMem32(0x00103398,0x4600c602)

-- No Body Shadow of the Character on the Ground
--eeObj.WriteMem32(0x001da1b4,0x64030000)

-- Disable Blur Effect
eeObj.WriteMem32(0x0015b968,0x0000102D)
eeObj.WriteMem32(0x0015b96c,0x64020040)

-- Disable Distortion Effect
eeObj.WriteMem32(0x00137084,0x3C030000)
eeObj.WriteMem32(0x00137088,0x34630000)

-- No black Borders
eeObj.WriteMem32(0x0015b1f0,0x64030000)

--Disable cinematic black bars (02000000)
eeObj.WriteMem32(0x00742433,0x82)
eeObj.WriteMem32(0x00742433,0x02)


local code_hidehud1 = eeObj.ReadMem16(0x00753872) --L3
local code_showhud1 = eeObj.ReadMem16(0x00753872) --R3

if (code_hidehud1 == 0x0002) then --L3
   eeObj.WriteMem8(0x00740771,0x00)
   eeObj.WriteMem8(0x007407A9,0x00)
end

if (code_showhud1 == 0x0004) then --R3
   eeObj.WriteMem8(0x00740771,0xFF)
   eeObj.WriteMem8(0x007407A9,0xFF)
end

-- Disable World Renderer
eeObj.WriteMem32(0x0016c9a0,0x0000282d)
eeObj.WriteMem32(0x0016c9a4,0x340500ff)
eeObj.WriteMem32(0x0016c9a8,0x44850800)
eeObj.WriteMem32(0x0016c9ac,0x468008a0)
eeObj.WriteMem32(0x0016c9b0,0xe422b3dc)
eeObj.WriteMem32(0x0016c9cc,0x0000282d)
eeObj.WriteMem32(0x0016c9d0,0x34050000)
eeObj.WriteMem32(0x0016c9d4,0x44850800)
eeObj.WriteMem32(0x0016c9d8,0x468008a0)
eeObj.WriteMem32(0x0016c9dc,0xe422b3ec)

--Controller buttons to JAPAN /HD ports Layout
eeObj.WriteMem32(0x2010C184,0x0803F414)
eeObj.WriteMem32(0x200FD050,0x00C0C821)
eeObj.WriteMem32(0x200FD054,0x08043063)
eeObj.WriteMem32(0x200FD058,0x24030070)
eeObj.WriteMem32(0x2010C1F4,0x0803F417)
eeObj.WriteMem32(0x200FD05C,0x87240002)
eeObj.WriteMem32(0x200FD060,0x30858FFF)
eeObj.WriteMem32(0x200FD064,0x9326000C)
eeObj.WriteMem32(0x200FD068,0x9327000E)
eeObj.WriteMem32(0x200FD06C,0x9328000D)
eeObj.WriteMem32(0x200FD070,0x30811000)
eeObj.WriteMem32(0x200FD074,0x34A32000)
eeObj.WriteMem32(0x200FD078,0x0061280B)
eeObj.WriteMem32(0x200FD07C,0xA326000D)
eeObj.WriteMem32(0x200FD080,0x30814000)
eeObj.WriteMem32(0x200FD084,0x34A31000)
eeObj.WriteMem32(0x200FD088,0x0061280B)
eeObj.WriteMem32(0x200FD08C,0xA327000C)
eeObj.WriteMem32(0x200FD090,0x30812000)
eeObj.WriteMem32(0x200FD094,0x34A34000)
eeObj.WriteMem32(0x200FD098,0x0061280B)
eeObj.WriteMem32(0x200FD09C,0xA328000E)
eeObj.WriteMem32(0x200FD0A0,0x03E00008)
eeObj.WriteMem32(0x200FD0A4,0xA7250002)

-- Disable Light Enhancement through the Cathedral Windows
eeObj.WriteMem32(0x0024d01c,0x46000830)
eeObj.WriteMem32(0x0024d024,0x4500003C)

-- Disable whitish foggy Light Bubbles nearby of Light Sources
eeObj.WriteMem32(0x0018315c,0x34020000)

--Unlock all Game Modes
eeObj.WriteMem32(0x20742204,0xFFFFFFFF)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(widescreen)