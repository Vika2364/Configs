require "disc-selection"

local pal_disc_map = { 
	it = { "Aladdin_SCES03006_SCEE_IT.bin" },
	es = { "Aladdin_SCES03008_SCEE_ES.bin" },
	fr = { "Aladdin_SCES03004_SCEE_FR.bin" },
}

local ntsc_disc_map = {
	en = { "Aladdin_SCUS94569_SCEA_EN.bin" }
}

RegisterDiscs(pal_disc_map, ntsc_disc_map)
