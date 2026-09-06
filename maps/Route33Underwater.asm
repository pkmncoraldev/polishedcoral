Route33Underwater_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 24 ; warp events
	warp_event  8,  4, BOREAL_ISLET, 1
	warp_event  9,  4, BOREAL_ISLET, 2
	warp_event  8,  5, BOREAL_ISLET, 3
	warp_event  9,  5, BOREAL_ISLET, 4
	warp_event 56, 16, TEMPEST_ISLET, 1
	warp_event 57, 16, TEMPEST_ISLET, 2
	warp_event 56, 17, TEMPEST_ISLET, 3
	warp_event 57, 17, TEMPEST_ISLET, 4
	warp_event 18, 14, EMBER_ISLET, 1
	warp_event 19, 14, EMBER_ISLET, 2
	warp_event 18, 15, EMBER_ISLET, 3
	warp_event 19, 15, EMBER_ISLET, 4
	warp_event  4, 16, ROUTE_33, 1
	warp_event  5, 16, ROUTE_33, 2
	warp_event  4, 17, ROUTE_33, 3
	warp_event  5, 17, ROUTE_33, 4
	warp_event 36,  6, ROUTE_33, 5
	warp_event 37,  6, ROUTE_33, 6
	warp_event 36,  7, ROUTE_33, 7
	warp_event 37,  7, ROUTE_33, 8
	warp_event 44,  4, ROUTE_33, 9
	warp_event 45,  4, ROUTE_33, 10
	warp_event 44,  5, ROUTE_33, 11
	warp_event 45,  5, ROUTE_33, 12

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE

	