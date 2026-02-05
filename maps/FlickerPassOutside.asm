FlickerPassOutside_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  1, 11, 5, FLICKER_PASS_2F

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_COOLTRAINER_F,  7,  8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerPassOutsideNPC, -1
	strengthboulder_event 13, 11, -1
	tmhmball_event 15, 10, TM_FIRE_BLAST, EVENT_TM38
	
	
FlickerPassOutsideNPC:
	jumptextfaceplayer FlickerPassOutsideNPCText
	
FlickerPassOutsideNPCText:
	text "I used to have a"
	line "TM that could"
	cont "light up the dark."
	
	para "That is until some"
	line "jerk on ROUTE 3"
	cont "stole it from me!"
	
	para "Watch out if you're"
	line "on the GLINT CITY"
	cont "side of ROUTE 3."
	
	para "And if you ever"
	line "find that guy,"
	cont "give him a good"
	cont "shove from me!"
	done

