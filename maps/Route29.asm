Route29_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route29Callback

	db 3 ; warp events
	warp_def  7, 66, 2, GREEN_GROTTO_1F
	warp_def 11, 54, 1, GREEN_GROTTO_2F
	warp_def  3, 58, 2, GREEN_GROTTO_2F

	db 0 ; coord events

	db 1 ; bg events
	signpost 12, 68, SIGNPOST_JUMPTEXT, Route29SignText

	db 8 ; object events
	person_event SPRITE_POKEFAN_M, 13, 43, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, Route29Trainer1, -1
	person_event SPRITE_BIRD_KEEPER, 14,  9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, Route29Trainer2, -1
	person_event SPRITE_BUG_CATCHER, 12, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route29Trainer3, -1
	person_event SPRITE_COOLTRAINER_F, 15, 69, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route29Trainer4, -1
	person_event SPRITE_COOLTRAINER_M, 19, 55, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route29Trainer5, -1
	person_event SPRITE_BIRD_KEEPER, 16, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route29Trainer6, -1
	fruittree_event 39,  4, FRUITTREE_ROUTE_29, LUM_BERRY
	tmhmball_event 56,  6, TM_DRAGON_CLAW, EVENT_ROUTE_29_DRAGON_CLAW_TM
	
	
Route29Callback:
	checkevent EVENT_DONE_ROUTE_29_MINA
	iftrue .skip
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA_GROUND
	variablesprite SPRITE_DISGUISEMAN, SPRITE_VALVE_1
.skip
	return
	
Route29SignText:
	text "ROUTE 29"
	
	para "NORTHEAST:"
	line "BRIGHTBURG"
	
	para "WEST:"
	line "OBSCURA CITY"
	done
	
Route29Trainer1:
	generictrainer POKEFANM, JASON, EVENT_BEAT_ROUTE_29_TRAINER_1, .SeenText, .BeatenText

	text "What does it truly"
	line "mean to be a real"
	cont "#FAN?"
	
	para "Is it enough to"
	line "just be a fan of"
	cont "#MON?"
	done

.SeenText:
	text "I call myself a"
	line "#FAN, but what"
	cont "does that mean?"
	done

.BeatenText:
	text "Not a fan of"
	line "that…"
	done
	
Route29Trainer2:
	generictrainer BIRD_KEEPER, MITCH, EVENT_BEAT_ROUTE_29_TRAINER_2, .SeenText, .BeatenText

	text "My ESPATHRA may"
	line "be a bird, but it's"
	cont "no FLYING-type!"
	done

.SeenText:
	text "Contrary to"
	line "popular belief,"
	
	para "not all bird"
	line "#MON are"
	cont "FLYING-type!"
	done

.BeatenText:
	text "Shoot!"
	done
	
Route29Trainer3:
	generictrainer BUG_CATCHER, AJ, EVENT_BEAT_ROUTE_29_TRAINER_3, .SeenText, .BeatenText

	text "ROCKY is the GYM"
	line "LEADER of OBSCURA"
	cont "CITY."
	
	para "And I'm his number"
	line "one fan!"
	done

.SeenText:
	text "Are you on your"
	line "way to see ROCKY?"
	
	para "He's the OBSCURA"
	line "CITY GYM LEADER!"
	done

.BeatenText:
	text "ROCKY!"
	done
	
Route29Trainer4:
	generictrainer COOLTRAINERF, TAMMY, EVENT_BEAT_ROUTE_29_TRAINER_4, .SeenText, .BeatenText

	text "Alright, alright."
	line "You got me."
	
	para "I'll cut the"
	line "helpless damsal"
	cont "act."
	done

.SeenText:
	text "You must be tired."
	
	para "Hehe!<WAIT_S>"
	line "My next victim!"
	done

.BeatenText:
	text "Eeeek!<WAIT_S>"
	line "Help me!"
	done
	
Route29Trainer5:
	generictrainer COOLTRAINERM, KEN, EVENT_BEAT_ROUTE_29_TRAINER_5, .SeenText, .BeatenText

	text "Are you the type"
	line "to be bored by a"
	cont "museum,"
	
	para "or do you find"
	line "them interesting?"
	done

.SeenText:
	text "OBSCURA CITY"
	line "has quite the"
	cont "impressive museum."
	
	para "Have you been?"
	done

.BeatenText:
	text "Impressive."
	done
	
Route29Trainer6:
	generictrainer BIRD_KEEPER, KEVIN, EVENT_BEAT_ROUTE_29_TRAINER_6, .SeenText, .BeatenText

	text "A few frilly"
	line "FLITTLE flutter"
	cont "freely."
	
	para "A few frilly"
	line "FLITTLE flutter"
	cont "freely."
	
	para "A few frilly"
	line "flitter- BAH!"
	
	para "I can't do it!"
	done

.SeenText:
	text "A few frilly"
	line "FLITTLE flutter"
	cont "freely."
	
	para "Try saying that"
	line "five times fast!"
	done

.BeatenText:
	text "I'm all twisted"
	line "up!"
	done
	