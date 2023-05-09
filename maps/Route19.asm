Route19_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  8, 26, ROUTE_17, 1
	warp_event  8, 27, ROUTE_17, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_PLANK_BRIDGE,  5, 20, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_GENERICTRAINER, 4, -1, -1
