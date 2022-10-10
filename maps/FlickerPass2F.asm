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
	warp_def  1,  9, 2, ROUTE_10
	warp_def  9,  3, 1, FLICKER_PASS_OUTSIDE

	db 0 ; coord events

	db 3 ; bg events
	bg_event 47, 13, SIGNPOST_ITEM + RARE_CANDY, EVENT_FLICKER_PASS_2F_HIDDEN_ITEM_1
	bg_event 24, 35, SIGNPOST_ITEM + ELIXIR, EVENT_FLICKER_PASS_2F_HIDDEN_ITEM_2
	bg_event 18, 18, SIGNPOST_ITEM + FULL_RESTORE, EVENT_FLICKER_PASS_2F_HIDDEN_ITEM_3

	db 11 ; object events
	itemball_event  9, 30, SAFE_GOGGLES, 1, EVENT_FLICKER_PASS_2F_POKEBALL_1
	itemball_event 27, 36, HYPER_POTION, 1, EVENT_FLICKER_PASS_2F_POKEBALL_2
	person_event SPRITE_POKEMANIAC, 10, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_1, -1
	person_event SPRITE_POKEMANIAC, 39, 38, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_2, -1
	person_event SPRITE_BOARDER, 10, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_3, -1
	person_event SPRITE_SKIER, 23, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_4, -1
	person_event SPRITE_FIREBREATHER, 22, 43, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_5, -1
	person_event SPRITE_SKIER, 3, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_6, -1
	person_event SPRITE_FIREBREATHER, 22, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass2F_7, -1
	smashrock_event 37, 28
	smashrock_event 42, 17

	
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

	text "YEAH, THAT'S"
	line "RIGHT!"
	
	para "I'M A MANIAC!"
	
	para "A #MANIAC!"
	
	para "AHAHAHAHAHA!"
	done

.SeenText:
	text "SOMEONE CALLED ME"
	line "A MANIAC!"
	
	para "CAN YOU BELIEVE"
	line "THAT!?"
	
	para "ME!?"
	
	para "A MANIAC!?"
	done

.BeatenText:
	text "AHAHAHAHAHA!"
	done

TrainerFlickerPass2F_2:
	generictrainer POKEMANIAC, THOMAS, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_2, .SeenText, .BeatenText

	text "I'll leave you"
	line "alone."
	
	para "Just get outta"
	line "here…"
	done

.SeenText:
	text "Hey!"
	
	para "Where you going"
	line "in such a hurry?"
	
	para "Slow down for a"
	line "sec!"
	done

.BeatenText:
	text "Message recieved."
	done
	
TrainerFlickerPass2F_3:
	generictrainer BOARDER, TOBY, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_3, .SeenText, .BeatenText

	text "What a bummer!"
	done

.SeenText:
	text "Yo!"
	
	para "You ready for"
	line "this?"
	
	para "You better strap"
	line "in!"
	done

.BeatenText:
	text "Wipeout!"
	done
	
TrainerFlickerPass2F_4:
	generictrainer SKIER, DEBBIE, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_4, .SeenText, .BeatenText

	text "Alright, fine!"
	
	para "I'll admit it!"
	
	para "I can't get my"
	line "skis off!"
	done

.SeenText:
	text "I might look"
	line "silly wearing skis"
	cont "in a cave,"
	cont "but I'll show"
	cont "you!"
	done

.BeatenText:
	text "I can barely move"
	line "in these things!"
	done
	
TrainerFlickerPass2F_5:
	generictrainer FIREBREATHER, GARTH, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_5, .SeenText, .BeatenText

	text "Your heart was"
	line "too icy cold for"
	cont "my spectacular"
	cont "#MON!"
	done

.SeenText:
	text "Hello there,"
	line "TRAINER!"
	
	para "Step right up!"
	
	para "My spectacular"
	line "#MON will melt"
	cont "your heart!"
	done

.BeatenText:
	text "I fizzled out!"
	done
	
TrainerFlickerPass2F_6:
	generictrainer SKIER, RHONDA, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_6, .SeenText, .BeatenText

	text "Oh no!"

	para "I broke a pole!"
	done

.SeenText:
	text "Hiya!"
	
	para "Check out my new"
	line "skis!"
	
	para "Pretty cool, huh?"
	done

.BeatenText:
	text "Aw man!"
	done
	
TrainerFlickerPass2F_7:
	generictrainer FIREBREATHER, ART, EVENT_BEAT_FLICKER_PASS_2F_TRAINER_7, .SeenText, .BeatenText

	text "I'm freezing my"
	line "pointy cap off"
	cont "over here!"
	done

.SeenText:
	text "Is it me, or is"
	line "it getting colder"
	cont "around here?"
	done

.BeatenText:
	text "Brrrrrr…"
	done