BrightHouse1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRIGHTBURG, 3
	warp_event  3,  7, BRIGHTBURG, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_CUTE_GIRL,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrightburgNPC2, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_COOL_DUDE,  3,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	
