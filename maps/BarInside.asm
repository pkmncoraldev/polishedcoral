BarInside_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  7, DUSK_TURNPIKE, 18
	warp_event  6,  7, DUSK_TURNPIKE, 19

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_JUKEBOX,  1,  9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BarBackAlleyFelicia, -1
