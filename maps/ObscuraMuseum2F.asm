ObscuraMuseum2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  4,  7, 5, OBSCURA_MUSEUM_1F
	warp_def  6,  2, 1, OBSCURA_GYM
	warp_def  6,  3, 2, OBSCURA_GYM

	db 0 ; coord events

	db 27 ; bg events
	signpost  5, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12,  6, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12,  7, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 13, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  5, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilFactText
	signpost  9, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodFactText
	signpost  6, 18, SIGNPOST_JUMPTEXT, ObscuraMuseumClayPotSignText
	signpost  6, 23, SIGNPOST_JUMPTEXT, ObscuraMuseumBlackPearlText
	signpost 10, 18, SIGNPOST_JUMPTEXT, ObscuraMuseumRainbowWingSignText
	signpost 10, 23, SIGNPOST_JUMPTEXT, ObscuraMuseumSilverWingSignText
	signpost  2, 19, SIGNPOST_JUMPTEXT, ObscuraMuseumDragonStoneSignText
	signpost  4,  6, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost  9, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumGymSign

	db 5 ; object events
	person_event SPRITE_RAINBOW_SILVER_WING,  9, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FRainbowWing, -1
	person_event SPRITE_RAINBOW_SILVER_WING,  9, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FSilverWing, -1
	person_event SPRITE_ARTIFACTS,  5, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPot, EVENT_MUSEUM_NO_CLAY_POT
	person_event SPRITE_ARTIFACTS,  5, 22, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPearl,  EVENT_MUSEUM_NO_BLACK_PEARL
	person_event SPRITE_ARTIFACTS,  1, 21, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPearl,  EVENT_MUSEUM_NO_DRAGON_STONE
	
ObscuraMuseumGymSign:
	text "OBSCURA CITY"
	line "#MON GYM"
	cont "LEADER: ROCKFORD"

	para "Placeholder."
	done
	
ObscuraMuseumDragonStoneSignText:
	text "DRAGON STONE"
	line "PLACEHOLDER"
	done
	
ObscuraMuseumClayPotSignText:
	text "An artifact that"
	line "was recently found"
	cont "by researchers at"
	cont "the PORT SHIMMER"
	cont "RESEARCH LAB."
	
	para "Discovered in an"
	line "ancient temple"
	cont "underground near"
	cont "TWINKLE TOWN."
	done
	
ObscuraMuseumBlackPearlText:
	text "An artifact that"
	line "was recently found"
	cont "by researchers at"
	cont "the PORT SHIMMER"
	cont "RESEARCH LAB."
	
	para "Discovered in an "
	line "ancient temple in"
	cont "the desert near"
	cont "PUEBLO BRILLO."
	done
	
ObscuraMuseumRainbowWingSignText:
	text "RAINBOW WING"
	
	para "There's a legend in"
	line "the JOHTO region"
	cont "of a fire that"
	cont "burned down one of"
	cont "two sacred towers."
	
	para "3 #MON died in"
	line "the fire, but were"
	cont "revived as great"
	cont "beasts by a large"
	cont "rainbow-colored"
	cont "bird #MON."
	
	para "This feather is"
	line "said to come from"
	cont "that #MON."
	done
	
ObscuraMuseumSilverWingSignText:
	text "SILVER WING"
	
	para "There's a legend in"
	line "the JOHTO region"
	cont "of a fire that"
	cont "burned down one of"
	cont "two sacred towers."
	
	para "The silver-colored"
	line "bird #MON that"
	cont "perched on the"
	cont "burned tower fled"
	cont "to live under the"
	cont "sea."
	
	para "This feather is"
	line "said to come from"
	cont "that #MON."
	done
	
ObscuraMuseumFossilFactText:
	text "While many people"
	line "associate the word"
	cont "fossil with bones,"
	
	para "a fossil can"
	line "actually be any"
	cont "trace of ancient"
	cont "life preserved to"
	cont "the modern day."
	
	para "Bones can indeed"
	line "be fossils, but a"
	cont "fossil could also"
	cont "be hair, an object"
	cont "trapped in amber,"
	cont "or a preserved DNA"
	cont "sample."
	
	para "Even an impression"
	line "in stone with no"
	cont "biological matter"
	cont "would count as a"
	cont "fossil!"
	done
	
ObscuraMuseumWoodFactText:
	text "Petrified wood"
	line "forms when wood is"
	cont "submerged in water"
	cont "or ash for long"
	cont "periods of time."
	
	para "A lack of oxygen"
	line "causes the wood to"
	cont "decay, and over"
	cont "time, surrounding"
	cont "minerals begin to"
	cont "replace the empty"
	cont "space left behind."
	
	para "This creates a"
	line "fossil in the"
	cont "shape of the wood,"
	cont "but made entirely"
	cont "of stone."
	done
	
ObscuraMuseum2FRainbowWing:
	jumptext ObscuraMuseum2FRainbowWingText
	
ObscuraMuseum2FRainbowWingText:
	text "A mystical feather"
	line "of rainbow colors."
	done

ObscuraMuseum2FSilverWing:
	jumptext ObscuraMuseum2FSilverWingText
	
ObscuraMuseum2FSilverWingText:
	text"A strange, silver-"
	line "colored feather."
	done
	
ObscuraMuseum2FPot:
	jumptext ObscuraMuseum2FPotText
	
ObscuraMuseum2FPotText:
	text "The CLAY POT you"
	line "found in the"
	cont "ICE TEMPLE."
	done
	
ObscuraMuseum2FPearl:
	jumptext ObscuraMuseum2FPearlText
	
ObscuraMuseum2FPearlText:
	text "The BLACK PEARL"
	line "you found in the"
	cont "DESERT TEMPLE."
	done
	