Route6Underwater_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 80 ; warp events
	warp_event 18,  2, ROUTE_6, 3
	warp_event 19,  2, ROUTE_6, 4
	warp_event 18,  3, ROUTE_6, 5
	warp_event 19,  3, ROUTE_6, 6
	warp_event 20,  5, ROUTE_6, 7
	warp_event 21,  5, ROUTE_6, 8
	warp_event 19,  6, ROUTE_6, 9
	warp_event 20,  6, ROUTE_6, 10
	warp_event 21,  6, ROUTE_6, 11
	warp_event 22,  6, ROUTE_6, 12
	warp_event 23,  6, ROUTE_6, 13
	warp_event 24,  6, ROUTE_6, 14
	warp_event 19,  7, ROUTE_6, 15
	warp_event 20,  7, ROUTE_6, 16
	warp_event 21,  7, ROUTE_6, 17
	warp_event 22,  7, ROUTE_6, 18
	warp_event 23,  7, ROUTE_6, 19
	warp_event 24,  7, ROUTE_6, 20
	warp_event 17,  8, ROUTE_6_SOUTH, 1
	warp_event 18,  8, ROUTE_6_SOUTH, 2
	warp_event 19,  8, ROUTE_6_SOUTH, 3
	warp_event 20,  8, ROUTE_6_SOUTH, 4
	warp_event 21,  8, ROUTE_6_SOUTH, 5
	warp_event 22,  8, ROUTE_6_SOUTH, 6
	warp_event 23,  8, ROUTE_6_SOUTH, 7
	warp_event 24,  8, ROUTE_6_SOUTH, 8
	warp_event 17,  9, ROUTE_6_SOUTH, 9
	warp_event 18,  9, ROUTE_6_SOUTH, 10
	warp_event 19,  9, ROUTE_6_SOUTH, 11
	warp_event 20,  9, ROUTE_6_SOUTH, 12
	warp_event 21,  9, ROUTE_6_SOUTH, 13
	warp_event 22,  9, ROUTE_6_SOUTH, 14
	warp_event 23,  9, ROUTE_6_SOUTH, 15
	warp_event 24,  9, ROUTE_6_SOUTH, 16
	warp_event 17, 10, ROUTE_6_SOUTH, 17
	warp_event 18, 10, ROUTE_6_SOUTH, 18
	warp_event 19, 10, ROUTE_6_SOUTH, 19
	warp_event 20, 10, ROUTE_6_SOUTH, 20
	warp_event 21, 10, ROUTE_6_SOUTH, 21
	warp_event 22, 10, ROUTE_6_SOUTH, 22
	warp_event 17, 11, ROUTE_6_SOUTH, 23
	warp_event 18, 11, ROUTE_6_SOUTH, 24
	warp_event 19, 11, ROUTE_6_SOUTH, 25
	warp_event 20, 11, ROUTE_6_SOUTH, 26
	warp_event 21, 11, ROUTE_6_SOUTH, 27
	warp_event 22, 11, ROUTE_6_SOUTH, 28
	warp_event 18, 12, ROUTE_6_SOUTH, 29
	warp_event 19, 12, ROUTE_6_SOUTH, 30
	warp_event 20, 12, ROUTE_6_SOUTH, 31
	warp_event 21, 12, ROUTE_6_SOUTH, 32
	warp_event 20, 13, ROUTE_6_SOUTH, 33
	warp_event 21, 13, ROUTE_6_SOUTH, 34
	warp_event 20, 14, ROUTE_6_SOUTH, 35
	warp_event 21, 14, ROUTE_6_SOUTH, 36
	warp_event 26, 12, ROUTE_6_SOUTH, 37
	warp_event 27, 12, ROUTE_6_SOUTH, 38
	warp_event 26, 13, ROUTE_6_SOUTH, 39
	warp_event 27, 13, ROUTE_6_SOUTH, 40
	warp_event 16, 16, ROUTE_6_SOUTH, 41
	warp_event 17, 16, ROUTE_6_SOUTH, 42
	warp_event 16, 17, ROUTE_6_SOUTH, 43
	warp_event 17, 17, ROUTE_6_SOUTH, 44
	warp_event 62, 23, ROUTE_6_SOUTH, 45
	warp_event 63, 23, ROUTE_6_SOUTH, 46
	warp_event 61, 24, ROUTE_6_SOUTH, 47
	warp_event 62, 24, ROUTE_6_SOUTH, 48
	warp_event 63, 24, ROUTE_6_SOUTH, 49
	warp_event 64, 24, ROUTE_6_SOUTH, 50
	warp_event 61, 25, ROUTE_6_SOUTH, 51
	warp_event 62, 25, ROUTE_6_SOUTH, 52
	warp_event 63, 25, ROUTE_6_SOUTH, 53
	warp_event 64, 25, ROUTE_6_SOUTH, 54
	warp_event 62, 26, ROUTE_6_SOUTH, 55
	warp_event 63, 26, ROUTE_6_SOUTH, 56
	warp_event 29, 26, ROUTE_6_UNDERWATER_CAVE, 1
	warp_event 30, 26, ROUTE_6_UNDERWATER_CAVE, 2
	warp_event 29, 27, ROUTE_6_UNDERWATER_CAVE, 3
	warp_event 30, 27, ROUTE_6_UNDERWATER_CAVE, 4
	warp_event 51, 29, ROUTE_6_UNDERWATER, 80
	warp_event 29, 31, ROUTE_6_UNDERWATER, 79

	db 0 ; coord events

	db 3 ; bg events
	bg_event 38, 27, SIGNPOST_ITEM + BIG_PEARL, EVENT_ROUTE_6_UNDERWATER_HIDDEN_BIG_PEARL_1
	bg_event 25,  4, SIGNPOST_ITEM + BIG_PEARL, EVENT_ROUTE_6_UNDERWATER_HIDDEN_BIG_PEARL_2
	bg_event  6, 29, SIGNPOST_ITEM + REVIVE, EVENT_ROUTE_6_UNDERWATER_HIDDEN_REVIVE

	db 7 ; object events
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	itemball_event 57, 30, PEARL, 1, EVENT_ROUTE_6_UNDERWATER_PEARL_1
	itemball_event 54, 32, NEVERMELTICE, 1, EVENT_ROUTE_6_UNDERWATER_NEVERMELTICE
	itemball_event 10, 33, PEARL, 1, EVENT_ROUTE_6_UNDERWATER_PEARL_2
	itemball_event 12, 19, ZINC, 1, EVENT_ROUTE_6_UNDERWATER_ZINC
	itemball_event 48, 17, IRON, 1, EVENT_ROUTE_6_UNDERWATER_IRON
