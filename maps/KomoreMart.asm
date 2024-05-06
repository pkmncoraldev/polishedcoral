KomoreMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, KOMORE_VILLAGE, 7
	warp_event  2,  7, KOMORE_VILLAGE, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_KOMORE
	person_event SPRITE_GENTLEMAN,  6, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KomoreMartNPC1, -1
	person_event SPRITE_SUPER_NERD,  2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KomoreMartNPC2, -1
	
KomoreMartNPC1:
	jumptextfaceplayer KomoreMartNPC1Text
	
KomoreMartNPC1Text:
	text "It is so beautiful"
	line "out when the sun"
	cont "is about to set."
	
	para "The orange sky and"
	line "the orange leaves…"
	done
	
KomoreMartNPC2:
	jumptextfaceplayer KomoreMartNPC2Text
	
KomoreMartNPC2Text:
	text "Some people think"
	line "it's cheating to"
	cont "use items like"
	cont "X ATTACK or SPEED."
	
	para "They're just mad"
	line "that I always win!"
	done
