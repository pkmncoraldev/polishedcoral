Route2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 28, 33, DAYBREAK_GROTTO_1, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost 40, 20, SIGNPOST_READ, Route2Sign

	db 7 ; object events
	person_event SPRITE_YOUNGSTER, 23, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute2_1, -1
	person_event SPRITE_LASS, 18, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 5, TrainerRoute2_2, -1
	person_event SPRITE_YOUNGSTER, 12, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute2_3, -1
	person_event SPRITE_HIKER, 28, 26, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route2NPC1, -1
	itemball_event  23, 36, POTION, 1, EVENT_ROUTE_2_POKE_BALL
	fruittree_event  4,  7, FRUITTREE_ROUTE_2, CHERI_BERRY
	person_event SPRITE_BALL_CUT_FRUIT, 52, 17, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route2PokeballDummy, EVENT_DAYBREAK_RARE_CANDY

	const_def 1 ; object constants
	const ROUTE2_NPC1
	const ROUTE2_NPC2
	const ROUTE2_NPC3
	const ROUTE2_NPC4
	const ROUTE2_BALL1
	const ROUTE2_BALL2
	const ROUTE2_BALL3
	
TrainerRoute2_1:
	generictrainer YOUNGSTER, JOEY, EVENT_BEAT_ROUTE_2_TRAINER_1, .SeenText, .BeatenText

	text "If you want to"
	line "avoid battle,"
	
	para "you should stay"
	line "out of other"
	cont "TRAINER'S view."
	done

.SeenText:
	text "We locked eyes!"
	
	para "That means we have"
	line "to battle!"
	done

.BeatenText:
	text "I should have"
	line "looked away."
	done

TrainerRoute2_2:
	generictrainer LASS, LIBBY, EVENT_BEAT_ROUTE_2_TRAINER_2, .SeenText, .BeatenText

	text "I guess I need to"
	line "train my little"
	cont "#MON some more."
	done

.SeenText:
	text "You look easy."
	
	para "I'll take you"
	line "down with my"
	cont "precious #MON!"
	done

.BeatenText:
	text "How could my"
	line "#MON lose?"
	done

TrainerRoute2_3:
	generictrainer YOUNGSTER, BILLY, EVENT_BEAT_ROUTE_2_TRAINER_3, .SeenText, .BeatenText

	text "We're going to"
	line "battle non-stop."
	
	para "Someday we'll be"
	line "the strongest"
	cont "team around!"
	done

.SeenText:
	text "I just got my"
	line "#MON!"
	
	para "I wanna try it"
	line "in battle!"
	done

.BeatenText:
	text "Woo!"
	
	para "That was awesome!"
	done

Route2NPC1:
	jumptextfaceplayer	Route2NPC1Text

;Route2PokeBall2:
;	disappear ROUTE2_BALL2
;	opentext
;	verbosegiveitem HM_FLY
;	closetext
;	setevent EVENT_ROUTE_2_POKE_BALL2
;	setflag ENGINE_GOT_FLY
;	end
	
Route2Sign:
	jumptext Route2SignText
	
Route2PokeballDummy:
	end
	
Route2NPC1Text:
	text "I've heard that"
	line "there is a cave"
	cont "around here where"
	cont "you can see some"
	cont "rare #MON!"
	
	para "I can't find it,"
	line "though."
	done
	
Route2SignText:
	text "ROUTE 2"
	
	para "NORTH:"
	line "GLINT CITY"
	
	para "SOUTH:"
	line "DAYBREAK VILLAGE"
	done