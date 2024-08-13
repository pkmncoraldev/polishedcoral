CoralReef_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 4 ; warp events
	warp_event  6, 32, ROUTE_15, 44
	warp_event  7, 32, ROUTE_15, 45
	warp_event  6, 33, ROUTE_15, 46
	warp_event  7, 33, ROUTE_15, 47

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
