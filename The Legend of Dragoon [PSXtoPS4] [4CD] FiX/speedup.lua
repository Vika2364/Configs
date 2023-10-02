-- Lua 5.3
-- Title:   Legend Of Dragoon (SIEA)
-- Author:  Ernesto Corvi

-- Changelog:

function SpeedupPatch()
	-- Modchip detection routine has a 6 second delay using a vsync counter (0x1C64EC) sitting in a tight loop
	-- Skip the delay entirely
	R3K_SetGpr(gpr.v0, 0x0f)
	print("Skipping wait")
end

local titleId = string.upper(EM_GetLegacyTitleId())

if (titleId:find("^SCUS")) then
	R3K_AddHook(0x801BFD8C, 0x3C01801C, SpeedupPatch)

elseif (titleId:find("^SCPS")) then
	R3K_AddHook(0x801BF808, 0x3C01801C, SpeedupPatch)

elseif (titleId:find("^SLPS")) then
	; -- Nothing

else
	print("Unhandled image: ", titleId)

end
