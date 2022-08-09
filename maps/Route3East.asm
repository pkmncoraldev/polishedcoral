Route3East_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  7,  4, 2, STARGLOW_CAVERN_1F

	db 0 ; coord events

	db 1 ; bg events
	signpost  8,  7, SIGNPOST_READ, Route3East_sign

	db 9 ; object events
	person_event SPRITE_FISHER, 23, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRouteEast3_1, -1
	person_event SPRITE_CAMPER, 17, 27, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRouteEast3_2, -1
	person_event SPRITE_PICNICKER,  8, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRouteEast3_3, -1
	person_event SPRITE_LASS, 21, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRouteEast3_4, -1
	person_event SPRITE_FISHER, 11, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route3Rodman, -1
	itemball_event 28,  8, GREAT_BALL, 1, EVENT_ROUTE_3_GREAT_BALL
	itemball_event  4, 14, SUPER_POTION, 1, EVENT_ROUTE_3_SUPER_POTION
	itemball_event 18, 17, PARALYZEHEAL, 1, EVENT_ROUTE_3_PARALYZEHEAL
	fruittree_event 35,  8, FRUITTREE_ROUTE_3_2, LEPPA_BERRY
	
	const_def 1 ; object constants
	const ROUTE3EAST_TRAINER1
	const ROUTE3EAST_TRAINER2
	const ROUTE3EAST_TRAINER3
	const ROUTE3EAST_TRAINER4
	const ROUTE3EAST_RODMAN
	const ROUTE3EAST_POKEBALL
	const ROUTE3EAST_POKEBALL2
	const ROUTE3EAST_FRUITTREE
	
	
TrainerRouteEast3_1:
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
	
TrainerRouteEast3_2:
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

TrainerRouteEast3_3:
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
	
TrainerRouteEast3_4:
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

Route3Rodman:
	checkevent EVENT_GOT_OLD_ROD
	iffalse .donthaverod
	faceplayer
	opentext
	writetext Route3RodmanText3
	waitbutton
	spriteface ROUTE3EAST_RODMAN, DOWN
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
	spriteface ROUTE3EAST_RODMAN, DOWN
	setevent EVENT_GOT_OLD_ROD
	closetext
	end
.norod
	writetext Route3RodmanText4
	waitbutton
	spriteface ROUTE3EAST_RODMAN, DOWN
	closetext
	end
	
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
	
Route3East_sign:
	jumptext Route3East_signtext
	
Route3East_signtext:
	text "ROUTE 3"
	
	para "STARGLOW VALLEY"
	line "ahead."
	done
	