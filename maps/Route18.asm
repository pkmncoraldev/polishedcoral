Route18_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 41, 42, ROUTE_18_DUSK_GATE, 1
	warp_event 41, 43, ROUTE_18_DUSK_GATE, 2
	warp_event 22,  9, SEASIDE_CAVE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SKATER, 24, 18, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
