-- Burnout 2 Point of Impact (U)
-- Jak v2 or rogue v1

apiRequest(0.1)    -- request version 0.1 API. Calling apiRequest() is mandatory.

-- SLUS_204.97 - Fix white parts
-- Major thanks to Maori-Jigglypuff for reversing that

eeInsnReplace(0x2485A8, 0xC6800D18, 0x3C014316)
eeInsnReplace(0x2485BC, 0xE4400000, 0xAC410000)
eeInsnReplace(0x2625F4, 0xC7809780, 0x3C014316)
eeInsnReplace(0x262608, 0xE4400000, 0xAC410000)
eeInsnReplace(0x2564A8, 0x8F829764, 0x24020000)
