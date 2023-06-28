--gametitle=Grand Theft Auto Liberty City Stories (SLUS-21423)
--JakX v2

apiRequest(1.0)

local eeObj  = getEEObject()
local emuObj = getEmuObject()

local patcher = function()

-- Widescreen fix by nemesis2000 (pnach by nemesis2000)
eeObj.WriteMem32(0x202918D0,0x468010A0)
eeObj.WriteMem32(0x202918D4,0xC6650030)
eeObj.WriteMem32(0x202918D8,0x44830800)
eeObj.WriteMem32(0x202918DC,0x46800860)
eeObj.WriteMem32(0x202918E0,0xC6640034)
eeObj.WriteMem32(0x202918E4,0x44840000)
eeObj.WriteMem32(0x202918E8,0x46800020)
eeObj.WriteMem32(0x202918EC,0xC6630038)
eeObj.WriteMem32(0x202918F0,0x46151082)
eeObj.WriteMem32(0x202918F4,0x46150842)
eeObj.WriteMem32(0x202918F8,0x46150002)
eeObj.WriteMem32(0x202918FC,0x46022940)
eeObj.WriteMem32(0x20291900,0x46012100)
eeObj.WriteMem32(0x20291904,0x460018C0)
eeObj.WriteMem32(0x20291908,0x4615A034)
eeObj.WriteMem32(0x2029190C,0xE6650030)
eeObj.WriteMem32(0x20291910,0xE6640034)
eeObj.WriteMem32(0x20291914,0x45000012)
eeObj.WriteMem32(0x20291918,0xE6630038)
eeObj.WriteMem32(0x2029191C,0x27C2BBF0)
eeObj.WriteMem32(0x20291920,0x24040001)
eeObj.WriteMem32(0x20291924,0x8C431D04)
eeObj.WriteMem32(0x20291928,0x1064000D)
eeObj.WriteMem32(0x2029192C,0x24070096)
eeObj.WriteMem32(0x20291930,0x3C01437F)
eeObj.WriteMem32(0x20291934,0x44810000)
eeObj.WriteMem32(0x20291938,0x2405000B)
eeObj.WriteMem32(0x2029193C,0x4600B002)
eeObj.WriteMem32(0x20291940,0xAE05002C)
eeObj.WriteMem32(0x20291944,0x46000064)
eeObj.WriteMem32(0x20291948,0x44020800)
eeObj.WriteMem32(0x2029194C,0x24420019)
eeObj.WriteMem32(0x20291950,0x28430097)
eeObj.WriteMem32(0x20291954,0x00E3100A)
eeObj.WriteMem32(0x20291958,0x10000007)
eeObj.WriteMem32(0x2029195C,0xAE020028)
eeObj.WriteMem32(0x20291960,0x8E03002C)
eeObj.WriteMem32(0x20291964,0x2402000B)
eeObj.WriteMem32(0x20291968,0x14620003)
eeObj.WriteMem32(0x2029196C,0x2405FFFF)
eeObj.WriteMem32(0x20291970,0xAE00002C)
eeObj.WriteMem32(0x20291974,0xAE050028)
eeObj.WriteMem32(0x20291978,0x0C0A47A2)
eeObj.WriteMem32(0x2029197C,0x0260202D)
eeObj.WriteMem32(0x20291980,0x0C0A47A4)
eeObj.WriteMem32(0x20291984,0x0260202D)
eeObj.WriteMem32(0x20291988,0xC7AC0124)
eeObj.WriteMem32(0x2029198C,0x3C013F9D)
eeObj.WriteMem32(0x20291990,0x44810000)
eeObj.WriteMem32(0x20291994,0x0C0820E8)
eeObj.WriteMem32(0x20291998,0x46006302)

-- Press L1+Up 60fps Enable

if eeObj.ReadMem16(0x0060B942) == 0xFBEF then -- L1+Up
eeObj.WriteMem32(0x202D92C4,0x00000000) --14820017
end

-- Press L1+Down 60fps Disable

if eeObj.ReadMem16(0x0060B942) == 0xFBBF then -- L1+Down
eeObj.WriteMem32(0x202D92C4,0x14820017) --14820017
end

-- no interlace
eeObj.WriteMem32(0x2035F1B4,0x00000000)

emuObj.ThrottleMax()

end

emuObj.AddVsyncHook(patcher)