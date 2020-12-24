Skatepark_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 37,  0, 1, ROUTE_8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_VALVE_2, 42,  9, SPRITEMOVEDATA_HALFPIPE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_VALVE_2, 42, 15, SPRITEMOVEDATA_HALFPIPE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
