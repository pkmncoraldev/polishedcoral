Route3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  7, 20, 1, STARGLOW_CAVERN_1F
	warp_def  7, 46, 1, STARGLOW_CAVERN_3F
	warp_def 15, 39, 1, ROUTE_3_FRIENDSHIP_HOUSE

	db 6 ; coord events
	coord_event 40, 16, 0, Route3MakeSilverBrown
	coord_event 40, 17, 0, Route3MakeSilverBrown
	coord_event 38, 17, 1, Route3MakeSilverGreen
	coord_event 38, 16, 1, Route3MakeSilverGreen
	coord_event 47, 30, 0, Route3MakeSilverBrown
	coord_event 47, 31, 0, Route3MakeSilverBrown

	db 3 ; bg events
	signpost  7, 17, SIGNPOST_READ, Route3_sign
	signpost 9, 0, SIGNPOST_READ, Route3_sign2
	signpost 18, 34, SIGNPOST_READ, Route3_sign3

	db 11 ; object events
	person_event SPRITE_YOUNGSTER, 8, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute3West_1, -1
	person_event SPRITE_COOLTRAINER_M, 16, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute3West_2, -1
	itemball_event 46, 30, RARE_CANDY, 1, EVENT_ROUTE_3_RARE_CANDY
	cuttree_event 24, 11, EVENT_ROUTE_3_CUT_TREE_1
	cuttree_event 23, 26, EVENT_ROUTE_3_CUT_TREE_2
	cuttree_event 18, 31, EVENT_ROUTE_3_CUT_TREE_3
	smashrock_event 46, 14
	smashrock_event 47, 15
	smashrock_event 44, 10
	smashrock_event 47, 11
	fruittree_event 22, 10, FRUITTREE_ROUTE_3_1, CHERI_BERRY

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
	
	
Route3MakeSilverBrown:
	setevent EVENT_ROUTE_3_ROCKS_BROWN
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
Route3MakeSilverGreen:
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	special Special_UpdatePalsInstant
	dotrigger $0
	end
	
TrainerRoute3West_1:
	generictrainer YOUNGSTER, CHRIS, EVENT_BEAT_ROUTE_3_TRAINER_1, .SeenText, .BeatenText

	text "Someday I'm gonna"
	line "beat STANLEY and"
	cont "get my own badge."
	done

.SeenText:
	text "Have you been to"
	line "the GYM?"
	
	para "The leader is real"
	line "tough!"	
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
	
Route3_sign3:
	jumptext Route3_sign3text
	
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
	
Route3_sign3text:
	text "ROUTE 3"
	
	para "EAST:"
	line "STARGLOW CAVERN"
	cont "(ALT ENTRANCE)"
	
	para "WEST:"
	line "GLINT CITY"
	done