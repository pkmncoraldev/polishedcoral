Route25_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 1 ; warp events
	warp_event  0,  8, BRIGHTBURG, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event -6, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -6, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
