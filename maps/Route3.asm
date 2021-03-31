Route3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7, 22, 1, STARGLOW_CAVERN_1F
	warp_def  7, 46, 1, STARGLOW_CAVERN_3F

	db 0 ; coord events

	db 2 ; bg events
	signpost  8, 23, SIGNPOST_READ, Route3_sign
	signpost 9, 0, SIGNPOST_READ, Route3_sign2

	db 10 ; object events
	person_event SPRITE_YOUNGSTER, 8, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute3West_1, -1
	person_event SPRITE_YOUNGSTER, 16, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3West_2, -1
	itemball_event 46, 30, RARE_CANDY, 1, EVENT_ROUTE_3_RARE_CANDY
	cuttree_event 24, 10, EVENT_ROUTE_3_CUT_TREE_1
	cuttree_event 23, 26, EVENT_ROUTE_3_CUT_TREE_2
	cuttree_event 18, 31, EVENT_ROUTE_3_CUT_TREE_3
	smashrock_event 46, 14
	smashrock_event 47, 15
	smashrock_event 44, 10
	smashrock_event 47, 11

	const_def 1 ; object constants
	const ROUTE3WEST_TRAINER1
	const ROUTE3WEST_TRAINER2
	const ROUTEWEST_POKEBALL
	const ROUTEWEST_CUT_TREE1
	const ROUTEWEST_CUT_TREE2
	const ROUTEWEST_CUT_TREE3
	const ROUTEWEST_ROCK_SMASH1
	const ROUTEWEST_ROCK_SMASH2
	const ROUTEWEST_ROCK_SMASH3
	const ROUTEWEST_ROCK_SMASH4
	
TrainerRoute3West_1:
	generictrainer YOUNGSTER, CHRIS, EVENT_BEAT_ROUTE_3_TRAINER_1, .SeenText, .BeatenText

	text "Someday I'm gonna"
	line "beat STANLEY and"
	cont "get my own badge."
	done

.SeenText:
	text "You beat STANLEY?"
	
	para "That's so cool!"
	
	para "Can I see your"
	line "badge?"	
	done

.BeatenText:
	text "You really ARE"
	line "strong!"
	done
	
TrainerRoute3West_2:
	generictrainer COOLTRAINERM, SAMMY, EVENT_BEAT_ROUTE_3_EAST_TRAINER, .SeenText, .BeatenText

	text "Maybe this spot"
	line "isn't so good"
	cont "after all…"
	done	

.SeenText:
	text "Hey!"
	
	para "What are you doing"
	line "at my secret"
	cont "training spot?"
	done

.BeatenText:
	text "I can't believe it!"
	done

Route3_sign:
	jumptext Route3_signtext
	
Route3_sign2:
	jumptext Route3_sign2text
	
Route3_signtext:
	text "STARGLOW CAVERN"
	done
	
Route3_sign2text:
	text "ROUTE 3"
	
	para "EAST:"
	line "STARGLOW CAVERN"
	
	para "WEST:"
	line "GLINT CITY"
	done
