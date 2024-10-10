ObscuraMuseum2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraMuseum2FCallback

	db 4 ; warp events
	warp_def  4,  7, 5, OBSCURA_MUSEUM_1F
	warp_def  6,  2, 1, OBSCURA_GYM
	warp_def  6,  3, 2, OBSCURA_GYM
	warp_def 10, 19, 1, OBSCURA_MUSEUM_3F

	db 0 ; coord events

	db 26 ; bg events
	signpost  5, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12,  6, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12,  7, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 13, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  5, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilFactText
	signpost  9, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodFactText
	signpost  4,  6, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost 10, 18, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost  7,  4, SIGNPOST_JUMPTEXT, ObscuraMuseumGymSign
	signpost  6,  2, SIGNPOST_IFSET, ObscuraMuseumGymDoor
	signpost  6,  3, SIGNPOST_IFSET, ObscuraMuseumGymDoor

	db 2 ; object events
	person_event SPRITE_SNARE,  8,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, ObscuraMuseum2FSnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  7, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, ObscuraMuseum2FSnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	
	
	const_def 1 ; object constants
	const OBSCURA_MUSEUM_2F_SNARE_1
	const OBSCURA_MUSEUM_2F_SNARE_2
	
ObscuraMuseum2FCallback:
	checkevent EVENT_SNARE_AT_MUSEUM
	iffalse .end
	changeblock $2, $6, $80
.end
	return
	
ObscuraMuseum2FSnare1:
	generictrainer GRUNTM, MUSEUM_GRUNTM_4, EVENT_BEAT_MUSEUM_GRUNT_6, .SeenText, .BeatenText

	text "TEXT 1"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
ObscuraMuseum2FSnare2:
	generictrainer GRUNTM, MUSEUM_GRUNTM_5, EVENT_BEAT_MUSEUM_GRUNT_7, .SeenText, .BeatenText

	text "TEXT 1"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
ObscuraMuseumGymDoor:
	dw EVENT_SNARE_AT_MUSEUM
	jumptext ObscuraMuseumGymDoorText
	
ObscuraMuseumGymDoorText:
	text "It's locked."
	done
