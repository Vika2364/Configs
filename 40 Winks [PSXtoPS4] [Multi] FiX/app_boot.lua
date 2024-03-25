require "disc-selection"

local pal_disc_map = { 
	it = { "Wink_SLES01940_SCEE_IT.bin" },
	es = { "Wink_SLES01941_SCEE_ES.bin" },
	fr = { "Wink_SLES01938_SCEE_FR.bin" },
	de = { "Wink_SLES01939_SCEE_DE.bin" },
	nl = { "Wink_SLES02384_SCEE_NL.bin" },
	ru = { "Wink_SLES01937_SCEE_RU.bin" },
}

local ntsc_disc_map = {
	en = { "Wink_SLUS00874_SCEA_EN.bin" }
}

RegisterDiscs(pal_disc_map, ntsc_disc_map)