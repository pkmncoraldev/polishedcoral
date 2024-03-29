Route13Underwater_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 16 ; warp events
	warp_event  8,  9, ROUTE_13, 1
	warp_event  9,  9, ROUTE_13, 2
	warp_event  7, 10, ROUTE_13, 3
	warp_event  8, 10, ROUTE_13, 4
	warp_event  9, 10, ROUTE_13, 5
	warp_event 10, 10, ROUTE_13, 6
	warp_event  7, 11, ROUTE_13, 7
	warp_event  8, 11, ROUTE_13, 8
	warp_event  9, 11, ROUTE_13, 9
	warp_event 10, 11, ROUTE_13, 10
	warp_event  8, 12, ROUTE_13, 11
	warp_event  9, 12, ROUTE_13, 12
	warp_event 16,  6, ROUTE_13, 13
	warp_event 17,  6, ROUTE_13, 14
	warp_event 16,  7, ROUTE_13, 15
	warp_event 17,  7, ROUTE_13, 16

	db 0 ; coord events

	db 1 ; bg events
	signpost 17, 14, SIGNPOST_ITEM + BIG_PEARL, EVENT_ROUTE_13_UNDERWATER_HIDDEN_ITEM

	db 3 ; object events
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	tmhmball_event 19, 12, TM_SCALD, EVENT_ROUTE_13_UNDERWATER_TM
