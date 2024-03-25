-- Lua 5.3
-- Title:   Legend of Dragoon
-- Author:  Phil Bennett

-- Changelog:


local function ChangeDisc()
	local curDisc = EM_GetDiscId()
	local newDisc = R3K_ReadMem32(discNumAddr)

	if newDisc >= 1 and newDisc <= 4 and curDisc ~= newDisc then
		print(string.format("Switching to disc %d", newDisc))
		EM_DiscSwap(newDisc)
	end
end

-- Hack to prevent the data streaming system from running into the
-- weeds if extra DRDY interrupts occur before a pause command can
-- execute.
local function DSSyncHack()
	R3K_WriteMem32(DSSyncCBPtr, 0)
end

local titleId = EM_GetLegacyTitleId()

if (titleId:find("^SCUS")) then -- US
	R3K_AddHook(0x800d9744, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004ddc0
	R3K_AddHook(0x80015014, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c1bb4
elseif (titleId:find("^SCPS")) then -- JP
	R3K_AddHook(0x800d8464, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004d5a0
	R3K_AddHook(0x80014c58, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c08d4
elseif (titleId:find("^SCES%d3043")) then -- EN
	R3K_AddHook(0x800d997c, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004dfe4
	R3K_AddHook(0x80015240, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c1dec
elseif (titleId:find("^SCES%d3044")) then -- FR
	R3K_AddHook(0x800d9a3c, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004e12c
	R3K_AddHook(0x80015324, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c1eac
elseif (titleId:find("^SCES%d3045")) then -- DE
	R3K_AddHook(0x800d9a2c, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004e0c8
	R3K_AddHook(0x800152c0, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c1e9c
elseif (titleId:find("^SCES%d3046")) then -- IT
	R3K_AddHook(0x800d9a64, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004e0e4
	R3K_AddHook(0x800152dc, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c1ed4
elseif (titleId:find("^SCES%d3047")) then -- ES
	R3K_AddHook(0x800d9a6c, 0x27bdffe8, ChangeDisc)
	discNumAddr = 0x8004e128
	R3K_AddHook(0x80015320, 0x2402ffff, DSSyncHack)
	DSSyncCBPtr = 0x800c1edc
else
	print("Unhandled titleId: ", titleId)
end