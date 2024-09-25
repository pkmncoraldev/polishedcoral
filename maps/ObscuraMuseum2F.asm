ObscuraMuseum2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  4,  5, 5, OBSCURA_MUSEUM_1F

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_RAINBOW_SILVER_WING,  9, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FRainbowWing, -1
	person_event SPRITE_RAINBOW_SILVER_WING,  9, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FSilverWing, -1
	person_event SPRITE_ARTIFACTS,  5, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPot, EVENT_MUSEUM_NO_CLAY_POT
	person_event SPRITE_ARTIFACTS,  5, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPearl,  EVENT_MUSEUM_NO_BLACK_PEARL
	
	
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
	