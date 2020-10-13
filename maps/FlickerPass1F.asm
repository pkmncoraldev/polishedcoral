FlickerPass1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 41, 19, 7, FLICKER_STATION
	warp_def  3, 17, 1, FLICKER_PASS_2F
	warp_def 19, 39, 2, FLICKER_PASS_2F

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 34, SIGNPOST_ITEM + POTION, EVENT_FLICKER_PASS_1F_HIDDEN_ITEM_1
	bg_event 33, 23, SIGNPOST_ITEM + POTION, EVENT_FLICKER_PASS_1F_HIDDEN_ITEM_2

	db 8 ; object events
	itemball_event 25, 30, POTION, 1, EVENT_FLICKER_PASS_1F_POKEBALL_1
	itemball_event 19, 22, POTION, 1, EVENT_FLICKER_PASS_1F_POKEBALL_2
	person_event SPRITE_POKEMANIAC, 27, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass1F_1, -1
	person_event SPRITE_HIKER, 22, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerFlickerPass1F_2, -1
	person_event SPRITE_POKEMANIAC, 15, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass1F_3, -1
	person_event SPRITE_FIREBREATHER, 28,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerFlickerPass1F_4, -1
	person_event SPRITE_FIREBREATHER,  5, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerFlickerPass1F_5, -1
	smashrock_event 28, 28
	
TrainerFlickerPass1F_1:
	generictrainer POKEMANIAC, CARLOS, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass1F_2:
	generictrainer HIKER, HENRY, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done

TrainerFlickerPass1F_3:
	generictrainer POKEMANIAC, TRISTEN, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_3, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass1F_4:
	generictrainer FIREBREATHER, JOB, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_4, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass1F_5:
	generictrainer FIREBREATHER, WIZ, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_5, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done