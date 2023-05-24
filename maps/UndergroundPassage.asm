UndergroundPassage_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4; warp events
	warp_event 31,  2, DAYBREAK_GROTTO_3, 7
	warp_event 25,  3, UNDERGROUND_PASSAGE, 3
	warp_event  9,  7, UNDERGROUND_PASSAGE, 2
	warp_event 29, 43, SEASIDE_CAVE_B1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
