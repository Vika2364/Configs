require "disc-selection"

local ntsc_disc_map = {
	ru = {
		"LegendofDragoon_SCUS94491_SCEA_RU_DISC1.bin",
		"LegendofDragoon_SCUS94584_SCEA_RU_DISC2.bin",
		"LegendofDragoon_SCUS94585_SCEA_RU_DISC3.bin",
		"LegendofDragoon_SCUS94586_SCEA_RU_DISC4.bin",
	}
}

RegisterDiscs(pal_disc_map, ntsc_disc_map)
