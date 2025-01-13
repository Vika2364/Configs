--gametitle=Devil May Cry (USA) SLUS_202.16;1) Game CRC = 0x79B8A95F
--emu kof98

apiRequest(0.1)

local emuObj = getEmuObject()
local eeObj  = getEEObject()
local gsObj  = getGsObject()

emuObj.SetGsTitleFix( "ignoreSubBuffCov", "reserved", {  } )

--emuObj.SetGsTitleFix( "globalSet",  "reserved", { workLoadThreshold = 125000} )

emuObj.SetGsTitleFix( "forceSimpleFetch", "reserved", { texMode=1 } )

local widescreen = function()

--16x9
eeObj.WriteMem32(0x2010338C,0x3C013F40)
eeObj.WriteMem32(0x20103390,0x44810000)
eeObj.WriteMem32(0x20103398,0x4600C602)

local code_disable2x2 = eeObj.ReadMem16(0x00765572) --R1+LEFT
local code_enable2x2  = eeObj.ReadMem16(0x00765572) --R1+RIGHT

if (code_disable2x2 == 0x0880) then --R1+LEFT
   gsObj.SetUprenderMode(0) -- 0=none <> 1=2x2
   gsObj.SetUpscaleMode(0)
end

if (code_enable2x2 == 0x0820) then --R1+RIGHT
   gsObj.SetUprenderMode(1) -- 0=none <> 1=2x2
   gsObj.SetUpscaleMode(0)
end

--Deinterlacing hack by asasega
--eeObj.WriteMem32(0x201018c4,0x00000000)
--eeObj.WriteMem32(0x20101b2c,0x00000000)
--eeObj.WriteMem32(0x20149490,0x03e00008)
--eeObj.WriteMem32(0x20149494,0x00000000)

--patch=1,EE,D0765572,extended,01
--patch=1,EE,2015B504,extended,30420001
--patch=1,EE,D0765572,extended,00
--patch=1,EE,2015B504,extended,30420000

-- Disable Blur Effect
eeObj.WriteMem32(0x0015b82c,0x0000102D)
eeObj.WriteMem32(0x0015b830,0x64020040)

--patch=1,EE,0015b82c,word,0000102D
--patch=1,EE,0015b830,word,64020040

-- Disable Distortion Effect
eeObj.WriteMem32(0x00136fa4,0x3C030000)
eeObj.WriteMem32(0x00136fa8,0x34630000)

--patch=1,EE,00136fa4,word,3C030000
--patch=1,EE,00136fa8,word,34630000

-- No black Borders
eeObj.WriteMem32(0x0015b110,0x64030000)

--Disable cinematic black bars (02000000)
eeObj.WriteMem32(0x00754133,0x82)
eeObj.WriteMem32(0x00754133,0x02)

local code_hidehud1 = eeObj.ReadMem16(0x00765572) --L3
local code_showhud1 = eeObj.ReadMem16(0x00765572) --R3

if (code_hidehud1 == 0x0002) then --L3
   eeObj.WriteMem8(0x00752471,0x00)
   eeObj.WriteMem8(0x007524A9,0x00)
end

if (code_showhud1 == 0x0004) then --R3
   eeObj.WriteMem8(0x00752471,0xFF)
   eeObj.WriteMem8(0x007524A9,0xFF)
end

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
eeObj.WriteMem32(0x0024ba0c,0x46000830)
eeObj.WriteMem32(0x0024ba14,0x4500003C)

-- Disable whitish foggy Light Bubbles nearby of Light Sources
eeObj.WriteMem32(0x00182bbc,0x34020000)

-- Unlock All Characters
eeObj.WriteMem32(0x20753F06,0x0000FFFF)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(widescreen)