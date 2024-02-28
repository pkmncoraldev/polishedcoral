BrightHouse3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRIGHTBURG, 5
	warp_event  3,  7, BRIGHTBURG, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_FAT_GUY,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	