NettBuilding4F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding3FCallback

	db 2 ; warp events
	warp_event 21,  0, NETT_BUILDING_3F, 2
	warp_event 17,  0, NETT_BUILDING_5F, 1

	db 4 ; coord events
	coord_event  3,  7, -1, NettBuilding4FTeleporter1
	coord_event  3, 15, -1, NettBuilding4FTeleporter2
	coord_event 11, 11, -1, NettBuilding4FTeleporter3
	coord_event 17, 11, -1, NettBuilding4FTeleporter4
	

	db 1 ; bg events
	signpost  0, 19, SIGNPOST_JUMPTEXT, NettBuilding4FSignText

	db 8 ; object events
	itemball_event 23, 13, KEY_CARD_Y, 1, EVENT_GOT_YELLOW_KEY_CARD
	person_event SPRITE_SLOWPOKETAIL,  3,  8, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 11,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  3,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 11,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SNARE_GIRL,  3,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerNettBuilding4F_1, -1
	person_event SPRITE_SNARE_GIRL,  3, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 6, TrainerNettBuilding4F_2, -1
	person_event SPRITE_SNARE_GIRL, 12, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerNettBuilding4F_3, -1

TrainerNettBuilding4F_1:
	generictrainer GRUNTF, NETT_GRUNTF_3, EVENT_BEAT_NETT_BUILDING_TRAINER_8, .SeenText, .BeatenText

	text "Just because I"
	line "work here,"
	
	para "doesn't mean I"
	line "know how things"
	cont "here work!"
	done

.SeenText:
	text "What do all these"
	line "big machines do?"
	
	para "No really.<WAIT_S>"
	line "I'm asking."
	done

.BeatenText:
	text "Darn!"
	done
	
TrainerNettBuilding4F_2:
	generictrainer GRUNTF, NETT_GRUNTF_4, EVENT_BEAT_NETT_BUILDING_TRAINER_9, .SeenText, .BeatenText

	text "Please, don't tell"
	line "my friends and"
	cont "family I'm with"
	cont "TEAM SNARE."
	
	para "I just need the"
	line "money!"
	done

.SeenText:
	text "You know our boss's"
	line "secret identity?"
	
	para "Does that mean you"
	line "my identity too!?"
	done

.BeatenText:
	text "This mask is"
	line "useless!"
	done
	
TrainerNettBuilding4F_3:
	generictrainer GRUNTF, NETT_GRUNTF_5, EVENT_BEAT_NETT_BUILDING_TRAINER_10, .SeenText, .BeatenText

	text "I was so sure I'd"
	line "be the one to stop"
	cont "you."
	done

.SeenText:
	text "Aha!"
	
	para "I've got you right"
	line "where I want you!"
	
	para "No getting away!"
	done

.BeatenText:
	text "Noo!"
	done

NettBuilding4FTeleporter1:
	teleporter NETT_BUILDING_6F, 21, 13
	end
	
NettBuilding4FTeleporter2:
	teleporter NETT_BUILDING_3F, 1, 3
	end
	
NettBuilding4FTeleporter3:
	teleporter NETT_BUILDING_5F, 3, 3
	end
	
NettBuilding4FTeleporter4:
	teleporter NETT_BUILDING_2F, 1, 15
	end
	