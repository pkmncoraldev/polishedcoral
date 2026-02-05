DaybreakGrotto3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 8 ; warp events
	warp_event 13,  5, DAYBREAK_GROTTO_1, 3
	warp_event 13,  3, DAYBREAK_GROTTO_3, 3
	warp_event -1, -1, DAYBREAK_GROTTO_3, 2
	warp_event 13, 17, SUNSET_CAPE, 3
	warp_event  3,  4, DAYBREAK_GROTTO_3, 6
	warp_event  5, 37, DAYBREAK_GROTTO_3, 5
	warp_event  5,  1, CONNECTING_CAVERN, 1
	warp_event  3, 29, SUNSET_LIGHTHOUSE_BASEMENT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3, 35, SPRITE_PONYTAIL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DaybreakGrotto3NPC, -1

	
DaybreakGrotto3NPC:
	checkevent EVENT_TM70
	iftrue .haveflash
	checkevent EVENT_SNARKY_GIRL_2
	iftrue .snarky
	setevent EVENT_SNARKY_GIRL_1
.haveflash
	jumptextfaceplayer DaybreakGrotto3NPCText1
.snarky
	jumptextfaceplayer DaybreakGrotto3NPCText2

DaybreakGrotto3NPCText1:
	text "This deep cavern"
	line "leads down to"
	cont "SOUTH ONWA."
	
	para "Golly, <WAIT_S>it sure is"
	line "dark, though."
	
	para "You need a #MON"
	line "to light the way."
	done
	
DaybreakGrotto3NPCText2:
	text "See?"
	
	para "I told you it"
	line "was too dark!"
	
	para "Did you just not"
	line "believe me or"
	cont "something?"
	
	para "Honestly!"
	done