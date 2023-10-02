require "disc-selection"

local ntsc_disc_map = {
	en = {
		"LegendofDragoon_SCUS94491_SCEA_EN_DISC1.bin",
		"LegendofDragoon_SCUS94584_SCEA_EN_DISC2.bin",
		"LegendofDragoon_SCUS94585_SCEA_EN_DISC3.bin",
		"LegendofDragoon_SCUS94586_SCEA_EN_DISC4.bin",
	}
}

RegisterDiscs(pal_disc_map, ntsc_disc_map)
