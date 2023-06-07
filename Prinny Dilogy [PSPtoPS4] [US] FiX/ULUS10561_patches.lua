-- Prinny 2 Dawn of Operation Panties, Dood!

apiRequest(2.0)   -- request version 1.0 API. Calling apiRequest() is mandatory.

local emuObj   = getEmuObject() -- emulator
local axObj     = getAXObject() -- allegrex

--emuObj.SetTextureHashMode("patchworkheroes") -- drawbounds,drawboundsloco,patchworkheroes,locoroco2,rondo
--emuObj.SetFDExtraDelay("0")
--emuObj.MeshSmooth("0")
--emuObj.VideoScale("0")
--emuObj.NeoMode(true)

local patcher = function()


end

emuObj.AddVsyncHook(patcher)



--[[
=========================================================================================================
LUA

apiRequest
getAXObject
getEmuObject
getTrophyObject
InsnOverlay
axInsnReplace
axFuncReplace
AX_GetPC
AX_SetPC
AX_GetHi
AX_SetHi
AX_GetLo
AX_SetLo
AX_GetReg
AX_SetReg
AX_GetFpr
AX_SetFpr
AX_ReadMem8
AX_ReadMem16
AX_ReadMem32
AX_ReadMemFloat
AX_ReadMemString
AX_ReadMemString16
AX_WriteMem8
AX_WriteMem16
AX_WriteMem32
AX_WriteMemFloat
AX_WriteMemString
AX_WriteMemString16
AX_WriteMemStringZ
AX_WriteMemString16Z
AX_AddHook
AX_RemoveHook
AX_Overlay
AX_InsnReplace
AX_FuncReplace
AX_BurnCycles
AX_AddAOTBlock
EM_SetTextureHashMode
EM_SetTextureScaleOffset
EM_SetTextureSaveSubdir
EM_SetSampleTitle
EM_ToggleTextures
EM_PadRead
EM_PadReadPitch
EM_PadReadRoll
EM_PadReadLeftStick
EM_PadReadRightStick
EM_PadVibrate
EM_PadVibrateStacked
EM_PadMultiVibrate
EM_PadRegisterSamples
EM_PadRegisterFX
EM_PadPlayFX
EM_PadPlayVoice
EM_PadSetButtonsMode
EM_AddVsyncHook
EM_RemoveVsyncHook
EM_AddBootHook
EM_RemoveBootHook
EM_ThrottleMax
EM_ThrottleNormal
EM_Log
EM_GetLanguage
EM_GetNativeLanguage
EM_DisplayManual
EM_DisplayProduct
EM_LoadConfig
EM_SaveConfig
EM_LoadMIDI
EM_GetMIDINotesAtTick
EM_LoadState
EM_SaveState
EM_SetFDExtraDelay
EM_MeshSmooth
EM_SetHue
EM_SetSaturation
EM_SetBrightness
EM_SetContrast
EM_VideoScale
EM_NeoMode
EM_SetOverlay
EM_DisplayUIOverlay
EM_CRC32
EM_SASGetCRC
EM_SASGetSampleRate
EM_GetAppName
EM_ReadFile
EM_RemapFB
EM_InvalFB
EM_PlayVideo
EM_RemapSavedata
EM_AddGPUHook
EM_RescaleUForUpscale
EM_RescaleVForUpscale
EM_ShrinkUVRect
EM_ScalePosition
EM_AdjustUVJitter
EM_OverrideFBSize
EM_CopyFB
TR_Unlock
Unhandled LUA function %s
E:\Em\PeoplesPackageParty\masticore\PSPHD\src\LuaBackCompat\FormerLuaScript.cpp(444): 
(Lua) ERROR: 
API version %.1f requested is newer than current API version (%1.f)
=========================================================================================================
AXObj Class

GetPC
SetPC
GetHi
SetHi
GetLo
SetLo
GetGpr
SetGpr
GetFpr
SetFpr
ReadMem8
ReadMem16
ReadMem32
ReadMemFloat
ReadMemStr
ReadMemStr16
WriteMem8
WriteMem16
WriteMem32
WriteMemFloat
WriteMemStr
WriteMemStr16
WriteMemStrZ
WriteMemStr16Z
AddHook
RemoveHook
Overlay
InsnReplace
FuncReplace
BurnCycles
AddAOTBlock
Invalid ReadMem8 address %08x
Invalid ReadMem16 address %08x
Invalid ReadMem32 address %08x
Invalid ReadMemFloat address %08x
Invalid ReadMemString address %08x
Invalid ReadMemString16 address %08x
Invalid WriteMem8 address %08x
Invalid WriteMem16 address %08x
Invalid WriteMem32 address %08x
Invalid WriteMemFloat address %08x
Invalid WriteMemString address %08x
Invalid WriteMemString16 address %08x
Invalid WriteMemStringZ address %08x
Invalid WriteMemString16Z address %08x
Invalid parameter passed to AddHook (parameter 3 is not a function)
Overlays can only be installed at script load time
Overlays require a table as a parameter
Overlays require an array of 32-bit integers as a parameter
Instruction Replacements can only be installed at script load time
InsnReplace: Opcode at PC %08x already replaced!
Function Replacements can only be installed at script load time
Invalid function replacement name %s
FuncReplace: Function at PC %08x already replaced!
AOT blocks can only be installed at script load time
Invalid AOT block name %s
=========================================================================================================
EmuObj Class

SetTextureHashMode
SetTextureScaleOffset
SetTextureSaveSubdir
SetSampleTitle
ToggleTextures
PadRead
PadReadPitch
PadReadRoll
PadReadLeftStick
PadReadRightStick
PadVibrate
PadVibrateStacked
PadMultiVibrate
PadRegisterSamples
PadRegisterFX
PadPlayFX
PadPlayVoice
PadSetButtonsMode
AddVsyncHook
RemoveVsyncHook
AddBootHook
RemoveBootHook
ThrottleMax
ThrottleNormal
Log
GetLanguage
GetNativeLanguage
DisplayManual
DisplayProduct
LoadConfig
SaveConfig
LoadMIDI
GetMIDINotesAtTick
LoadState
SaveState
SetFDExtraDelay
MeshSmooth
SetHue
SetSaturation
SetBrightness
SetContrast
VideoScale
NeoMode
SetOverlay
DisplayUIOverlay
CRC32
SASGetCRC
SASGetSampleRate
GetAppName
ReadFile
RemapFB
InvalFB
PlayVideo
RemapSavedata
AddGPUHook
RescaleUForUpscale
RescaleVForUpscale
ShrinkUVRect
ScalePosition
AdjustUVJitter
OverrideFBSize
CopyFB
Invalid option %s for SetTextureHashMode()
Invalid voice %d
EM_PadSetButtonsMode is deprecated
(TextureCache) ERROR: 
Failed to open MIDI file '%s'
(LuaScript) ERROR: 
No MIDI track #%d (range: [0-%d])
=========================================================================================================
jp
fr
es
de
it
nl
pt
ru
ko
cht
chs
fi
se
dk
no
pl
ptb
gb
tr
esl
ar
frc

--]]