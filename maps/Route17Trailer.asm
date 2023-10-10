Route17Trailer_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  3, ROUTE_17_NORTH, 1
	warp_event  3,  3, ROUTE_17_NORTH, 1
	

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route17NorthNPC1, -1

	const_def 1 ; object constants
	const ROUTE_17_TRAILER_NPC