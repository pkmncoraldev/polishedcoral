FlickerPass2F_MapScriptHeader:
	db 2 ; scene scripts
	scene_script FlickerPass2FTrigger0
	scene_script FlickerPass2FTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, FlickerPass2FStopSnowstorm

	db 5 ; warp events
	warp_def 33, 15, 2, FLICKER_PASS_1F
	warp_def 49, 37, 3, FLICKER_PASS_1F
	warp_def  1, 19, 1, ROUTE_10
	warp_def  9,  9, 2, ROUTE_10
	warp_def 17,  3, 1, FLICKER_PASS_OUTSIDE

	db 0 ; coord events

	db 3 ; bg events
	bg_event 47, 13, SIGNPOST_ITEM + POTION, EVENT_FLICKER_PASS_2F_HIDDEN_ITEM_1
	bg_event 24, 35, SIGNPOST_ITEM + POTION, EVENT_FLICKER_PASS_2F_HIDDEN_ITEM_2
	bg_event 18, 18, SIGNPOST_ITEM + POTION, EVENT_FLICKER_PASS_2F_HIDDEN_ITEM_3

	db 11 ; object events
	itemball_event  9, 30, POTION, 1, EVENT_FLICKER_PASS_2F_POKEBALL_1
	itemball_event  27, 36, POTION, 1, EVENT_FLICKER_PASS_2F_POKEBALL_2
	person_event SPRITE_POKEMANIAC, 10, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_1, -1
	person_event SPRITE_POKEMANIAC, 39, 38, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_2, -1
	person_event SPRITE_BOARDER, 11, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_3, -1
	person_event SPRITE_SKIER, 23, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_4, -1
	person_event SPRITE_FIREBREATHER, 22, 43, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_5, -1
	person_event SPRITE_SKIER, 3, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_6, -1
	person_event SPRITE_FIREBREATHER, 22, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_7, -1
	smashrock_event 37, 28
	smashrock_event 42, 19

	
FlickerPass2FStopSnowstorm:
	clearevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger ROUTE_10, $0
	return
	
FlickerPass2FTrigger0:
	end

FlickerPass2FTrigger1:
	end
	
TrainerFlickerPass2F_1:
	generictrainer POKEMANIAC, SIMION, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done

TrainerFlickerPass2F_2:
	generictrainer POKEMANIAC, THOMAS, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass2F_3:
	generictrainer BOARDER, TOBY, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_3, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass2F_4:
	generictrainer SKIER, DEBBIE, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_4, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass2F_5:
	generictrainer FIREBREATHER, SIMION, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_5, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass2F_6:
	generictrainer SKIER, RHONDA, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_6, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerPass2F_7:
	generictrainer FIREBREATHER, ART, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_7, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done