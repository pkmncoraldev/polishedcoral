Route3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 9, 50, 1, STARGLOW_CAVERN_1F

	db 0 ; coord events

	db 2 ; bg events
	signpost 10, 51, SIGNPOST_READ, Route3_sign
	signpost 9, 0, SIGNPOST_READ, Route3_sign2

	db 14 ; object events
	person_event SPRITE_YOUNGSTER, 8, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute3_1, -1
	person_event SPRITE_FISHER, 16, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute3_2, -1
	person_event SPRITE_CAMPER, 15, 33, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3_3, -1
	person_event SPRITE_PICNICKER, 6, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute3_4, -1
	person_event SPRITE_LASS, 16, 45, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3_5, -1
	person_event SPRITE_FISHER, 9, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route3Rodman, -1
	person_event SPRITE_YOUNGSTER, 30, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3_6, -1
	person_event SPRITE_LASS, 24, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3_7, -1
	itemball_event  34, 6, GREAT_BALL, 1, EVENT_ROUTE_3_GREAT_BALL
	itemball_event  43, 23, RARE_CANDY, 1, EVENT_ROUTE_3_RARE_CANDY
	fruittree_event 41,  7, FRUITTREE_ROUTE_3, LEPPA_BERRY
	cuttree_event 52, 13, EVENT_ROUTE_3_CUT_TREE_1
	cuttree_event 16, 25, EVENT_ROUTE_3_CUT_TREE_2
	cuttree_event 18, 31, EVENT_ROUTE_3_CUT_TREE_3

	const_def 1 ; object constants
	const ROUTE3_TRAINER1
	const ROUTE3_TRAINER2
	const ROUTE3_TRAINER3
	const ROUTE3_TRAINER4
	const ROUTE3_TRAINER5
	const ROUTE3_RODMAN
	const ROUTE3_TRAINER6
	const ROUTE3_TRAINER7
	
TrainerRoute3_1:
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
	
TrainerRoute3_2:
	generictrainer FISHER, DAVE, EVENT_BEAT_ROUTE_3_TRAINER_2, .SeenText, .BeatenText

	text "I caught my WOOPER"
	line "right in this very"
	cont "river."
	done

.SeenText:
	text "Freshwater or"
	line "saltwater fishing?"
	
	para "Which do you"
	line "prefer?"
	done

.BeatenText:
	text "Personally, I pre-"
	line "fer freshwater."
	done
	
TrainerRoute3_3:
	generictrainer CAMPER, DENNY, EVENT_BEAT_ROUTE_3_TRAINER_3, .SeenText, .BeatenText

	text "I don't have many"
	line "friends,"
	
	para "so I hang out here"
	line "with the trees."
	done

.SeenText:
	text "I love this spot."

	para "I feel at one with"
	line "nature when I"
	cont "stand among the"
	cont "trees."
	done

.BeatenText:
	text "You didn't have"
	line "to cut me down."
	done

TrainerRoute3_4:
	generictrainer PICNICKER, ERIN, EVENT_BEAT_ROUTE_3_TRAINER_4, .SeenText, .BeatenText

	text "I didn't want it"
	line "that much anyway…"
	done

.SeenText:
	text "Do you want this"
	line "item?"
	
	para "You're gonna have"
	line "to battle me for"
	cont "it!"
	done

.BeatenText:
	text "Fine."
	
	para "If you want it so"
	line "bad, you can have"
	cont "it."
	done
	
TrainerRoute3_5:
	generictrainer LASS, CHARLOTTE, EVENT_BEAT_ROUTE_3_TRAINER_5, .SeenText, .BeatenText

	text "I gotta get home"
	line "and change."
	done	

.SeenText:
	text "I shouldn't have"
	line "worn a skirt out"
	cont "here in the grass."
	
	para "I keep getting bug"
	line "bites on my legs."
	done

.BeatenText:
	text "Itchy…"
	done
	
TrainerRoute3_6:
	generictrainer COOLTRAINERM, SAMMY, EVENT_BEAT_ROUTE_3_TRAINER_6, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done	

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerRoute3_7:
	generictrainer COOLTRAINERF, HAILEY, EVENT_BEAT_ROUTE_3_TRAINER_7, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done	

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "BEATEN TEXT"
	done
	
Route3Rodman:
	checkevent EVENT_GOT_OLD_ROD
	iffalse .donthaverod
	faceplayer
	opentext
	writetext Route3RodmanText3
	waitbutton
	spriteface ROUTE3_RODMAN, DOWN
	closetext
	end
.donthaverod
	faceplayer
	opentext
	writetext Route3RodmanText1
	yesorno
	iffalse .norod
	writetext Route3RodmanText5
	waitbutton
	verbosegiveitem OLD_ROD
	writetext Route3RodmanText2
	waitbutton
	spriteface ROUTE3_RODMAN, DOWN
	setevent EVENT_GOT_OLD_ROD
	closetext
	end
.norod
	writetext Route3RodmanText4
	waitbutton
	spriteface ROUTE3_RODMAN, DOWN
	closetext
	end

Route3_sign:
	jumptext Route3_signtext
	
Route3_sign2:
	jumptext Route3_sign2text
	
Route3RodmanText1:
	text "Hmm?"
	
	para "Could you please"
	line "keep moving?"
	
	para "Your footsteps are"
	line "scaring the WATER"
	cont "#MON away."
	
	para "..."
	
	para "Look."
	
	para "If I give you"
	line "something will you"
	cont "leave?"
	done
	
Route3RodmanText2:
	text "With that OLD ROD"
	line "you can fish up"
	cont "WATER #MON."
	
	para "You won't find"
	line "much with that"
	cont "piece of junk,"
	cont "though."
	done
	
Route3RodmanText3:
	text "I gave you my"
	line "OLD ROD,"
	
	para "now will you"
	line "please leave me"
	cont "alone?"
	
	para "Kids these days."
	done
	
Route3RodmanText4:
	text "Well then,"
	
	para "I guess we're at"
	line "an impasse."
	done

Route3RodmanText5:
	text "Fine. Here."
	done
	
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
