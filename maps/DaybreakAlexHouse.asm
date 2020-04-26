DaybreakAlexHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 4, 7, DAYBREAK_VILLAGE, 4
	warp_event 3, 7, DAYBREAK_VILLAGE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_POKEFAN_M, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DaybreakAlexDad, -1

	const_def 1 ; object constants
	const DAYBREAK_ALEX_HOUSE_ALEX_DAD
	
DaybreakAlexDad:
	jumptextfaceplayer DaybreakAlexDadText

DaybreakAlexDadText:
	text "You're one of ALEX's"
	line "friends, right?"

	para "She's already left"
	line "for GLINT CITY to"
	cont "get her first GYM"
	cont "BADGE."
	
	para "If you see her,"
	line "tell her I said"
	cont "hi!"
	done