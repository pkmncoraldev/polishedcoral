DaybreakGrotto2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  9, 17, DAYBREAK_GROTTO_1, 2
	warp_event  9,  3, MT_ONWA_LOWER_CLIFF, 2
	warp_event  1, 1, DAYBREAK_GROTTO_3, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_FISHER, 15,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DaybreakGrotto2NPC, EVENT_DAYBREAK_GROTTO_HIKER

DaybreakGrotto2NPC:
	jumptextfaceplayer DaybreakGrotto2NPCText

DaybreakGrotto2NPCText:
	text "There's a tree"
	line "blocking the way"
	cont "up ahead."
	
	para "I could pass with"
	line "a POKEMON that can"
	cont "learn CUT."
	
	para "Oh well…"
	
	para "I guess I have to"
	line "take the long way"
	cont "around GLINT CITY."
	done
	
