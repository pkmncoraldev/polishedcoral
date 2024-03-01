BrightburgGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 4, 0, 6, BRIGHTBURG
	warp_def 5, 0, 7, BRIGHTBURG
	warp_def 4, 9, 1, ROUTE_1
	warp_def 5, 9, 2, ROUTE_1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_OFFICER, 4, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_OFFICER, 5, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	