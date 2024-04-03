Route6Underwater_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 80 ; warp events
	warp_event 36,  2, ROUTE_6, 3
	warp_event 37,  2, ROUTE_6, 4
	warp_event 36,  3, ROUTE_6, 5
	warp_event 37,  3, ROUTE_6, 6
	warp_event 38,  5, ROUTE_6, 7
	warp_event 39,  5, ROUTE_6, 8
	warp_event 37,  6, ROUTE_6, 9
	warp_event 38,  6, ROUTE_6, 10
	warp_event 39,  6, ROUTE_6, 11
	warp_event 40,  6, ROUTE_6, 12
	warp_event 41,  6, ROUTE_6, 13
	warp_event 42,  6, ROUTE_6, 14
	warp_event 37,  7, ROUTE_6, 15
	warp_event 38,  7, ROUTE_6, 16
	warp_event 39,  7, ROUTE_6, 17
	warp_event 40,  7, ROUTE_6, 18
	warp_event 41,  7, ROUTE_6, 19
	warp_event 42,  7, ROUTE_6, 20
	warp_event 35,  8, ROUTE_6_SOUTH, 1
	warp_event 36,  8, ROUTE_6_SOUTH, 2
	warp_event 37,  8, ROUTE_6_SOUTH, 3
	warp_event 38,  8, ROUTE_6_SOUTH, 4
	warp_event 39,  8, ROUTE_6_SOUTH, 5
	warp_event 40,  8, ROUTE_6_SOUTH, 6
	warp_event 41,  8, ROUTE_6_SOUTH, 7
	warp_event 42,  8, ROUTE_6_SOUTH, 8
	warp_event 35,  9, ROUTE_6_SOUTH, 9
	warp_event 36,  9, ROUTE_6_SOUTH, 10
	warp_event 37,  9, ROUTE_6_SOUTH, 11
	warp_event 38,  9, ROUTE_6_SOUTH, 12
	warp_event 39,  9, ROUTE_6_SOUTH, 13
	warp_event 40,  9, ROUTE_6_SOUTH, 14
	warp_event 41,  9, ROUTE_6_SOUTH, 15
	warp_event 42,  9, ROUTE_6_SOUTH, 16
	warp_event 35, 10, ROUTE_6_SOUTH, 17
	warp_event 36, 10, ROUTE_6_SOUTH, 18
	warp_event 37, 10, ROUTE_6_SOUTH, 19
	warp_event 38, 10, ROUTE_6_SOUTH, 20
	warp_event 39, 10, ROUTE_6_SOUTH, 21
	warp_event 40, 10, ROUTE_6_SOUTH, 22
	warp_event 35, 11, ROUTE_6_SOUTH, 23
	warp_event 36, 11, ROUTE_6_SOUTH, 24
	warp_event 37, 11, ROUTE_6_SOUTH, 25
	warp_event 38, 11, ROUTE_6_SOUTH, 26
	warp_event 39, 11, ROUTE_6_SOUTH, 27
	warp_event 40, 11, ROUTE_6_SOUTH, 28
	warp_event 36, 12, ROUTE_6_SOUTH, 29
	warp_event 37, 12, ROUTE_6_SOUTH, 30
	warp_event 38, 12, ROUTE_6_SOUTH, 31
	warp_event 39, 12, ROUTE_6_SOUTH, 32
	warp_event 38, 13, ROUTE_6_SOUTH, 33
	warp_event 39, 13, ROUTE_6_SOUTH, 34
	warp_event 38, 14, ROUTE_6_SOUTH, 35
	warp_event 39, 14, ROUTE_6_SOUTH, 36
	warp_event 44, 12, ROUTE_6_SOUTH, 37
	warp_event 45, 12, ROUTE_6_SOUTH, 38
	warp_event 44, 13, ROUTE_6_SOUTH, 39
	warp_event 45, 13, ROUTE_6_SOUTH, 40
	warp_event 34, 16, ROUTE_6_SOUTH, 41
	warp_event 35, 16, ROUTE_6_SOUTH, 42
	warp_event 34, 17, ROUTE_6_SOUTH, 43
	warp_event 35, 17, ROUTE_6_SOUTH, 44
	warp_event 80, 23, ROUTE_6_SOUTH, 45
	warp_event 81, 23, ROUTE_6_SOUTH, 46
	warp_event 79, 24, ROUTE_6_SOUTH, 47
	warp_event 80, 24, ROUTE_6_SOUTH, 48
	warp_event 81, 24, ROUTE_6_SOUTH, 49
	warp_event 82, 24, ROUTE_6_SOUTH, 50
	warp_event 79, 25, ROUTE_6_SOUTH, 51
	warp_event 80, 25, ROUTE_6_SOUTH, 52
	warp_event 81, 25, ROUTE_6_SOUTH, 53
	warp_event 82, 25, ROUTE_6_SOUTH, 54
	warp_event 80, 26, ROUTE_6_SOUTH, 55
	warp_event 81, 26, ROUTE_6_SOUTH, 56
	warp_event 47, 26, ROUTE_6_UNDERWATER_CAVE, 1
	warp_event 48, 26, ROUTE_6_UNDERWATER_CAVE, 2
	warp_event 47, 27, ROUTE_6_UNDERWATER_CAVE, 3
	warp_event 48, 27, ROUTE_6_UNDERWATER_CAVE, 4
	warp_event 69, 29, ROUTE_6_UNDERWATER, 80
	warp_event 47, 31, ROUTE_6_UNDERWATER, 79

	db 0 ; coord events

	db 3 ; bg events
	bg_event 56, 27, SIGNPOST_ITEM + BIG_PEARL, EVENT_ROUTE_6_UNDERWATER_HIDDEN_BIG_PEARL_1
	bg_event 43,  4, SIGNPOST_ITEM + BIG_PEARL, EVENT_ROUTE_6_UNDERWATER_HIDDEN_BIG_PEARL_2
	bg_event 24, 29, SIGNPOST_ITEM + REVIVE, EVENT_ROUTE_6_UNDERWATER_HIDDEN_REVIVE

	db 7 ; object events
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	itemball_event 75, 30, PEARL, 1, EVENT_ROUTE_6_UNDERWATER_PEARL_1
	itemball_event 72, 32, NEVERMELTICE, 1, EVENT_ROUTE_6_UNDERWATER_NEVERMELTICE
	itemball_event 28, 33, PEARL, 1, EVENT_ROUTE_6_UNDERWATER_PEARL_2
	itemball_event 30, 19, ZINC, 1, EVENT_ROUTE_6_UNDERWATER_ZINC
	itemball_event 66, 17, IRON, 1, EVENT_ROUTE_6_UNDERWATER_IRON
