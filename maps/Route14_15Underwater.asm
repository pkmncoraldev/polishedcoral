Route14_15Underwater_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 58 ; warp events
	warp_event 12,  5, ROUTE_14, 1
	warp_event 13,  5, ROUTE_14, 2
	warp_event  9,  6, ROUTE_14, 3
	warp_event 10,  6, ROUTE_14, 4
	warp_event 11,  6, ROUTE_14, 5
	warp_event 12,  6, ROUTE_14, 6
	warp_event 13,  6, ROUTE_14, 7
	warp_event 14,  6, ROUTE_14, 8
	warp_event  9,  7, ROUTE_14, 9
	warp_event 10,  7, ROUTE_14, 10
	warp_event 11,  7, ROUTE_14, 11
	warp_event 12,  7, ROUTE_14, 12
	warp_event 13,  7, ROUTE_14, 13
	warp_event 14,  7, ROUTE_14, 14
	warp_event 10,  8, ROUTE_14, 15
	warp_event 11,  8, ROUTE_14, 16
	warp_event 26, 30, ROUTE_15, 2
	warp_event 27, 30, ROUTE_15, 3
	warp_event 26, 31, ROUTE_15, 4
	warp_event 27, 31, ROUTE_15, 5
	warp_event 42, 25, ROUTE_15, 6
	warp_event 43, 25, ROUTE_15, 7
	warp_event 41, 26, ROUTE_15, 8
	warp_event 42, 26, ROUTE_15, 9
	warp_event 43, 26, ROUTE_15, 10
	warp_event 44, 26, ROUTE_15, 11
	warp_event 41, 27, ROUTE_15, 12
	warp_event 42, 27, ROUTE_15, 13
	warp_event 43, 27, ROUTE_15, 14
	warp_event 44, 27, ROUTE_15, 15
	warp_event 42, 28, ROUTE_15, 16
	warp_event 43, 28, ROUTE_15, 17
	warp_event 64,  4, ROUTE_15, 18
	warp_event 65,  4, ROUTE_15, 19
	warp_event 64,  5, ROUTE_15, 20
	warp_event 65,  5, ROUTE_15, 21
	warp_event 57, 10, ROUTE_15, 22
	warp_event 58, 10, ROUTE_15, 23
	warp_event 59, 10, ROUTE_15, 24
	warp_event 57, 11, ROUTE_15, 25
	warp_event 58, 11, ROUTE_15, 26
	warp_event 59, 11, ROUTE_15, 27
	warp_event 62,  7, ROUTE_15, 28
	warp_event 63,  7, ROUTE_15, 29
	warp_event 60,  8, ROUTE_15, 30
	warp_event 61,  8, ROUTE_15, 31
	warp_event 62,  8, ROUTE_15, 32
	warp_event 63,  8, ROUTE_15, 33
	warp_event 60,  9, ROUTE_15, 34
	warp_event 61,  9, ROUTE_15, 35
	warp_event 62,  9, ROUTE_15, 36
	warp_event 63,  9, ROUTE_15, 37
	warp_event 62, 10, ROUTE_15, 38
	warp_event 63, 10, ROUTE_15, 39
	warp_event 64, 10, ROUTE_15, 40
	warp_event 62, 11, ROUTE_15, 41
	warp_event 63, 11, ROUTE_15, 42
	warp_event 64, 11, ROUTE_15, 43

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 13,  6, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event 13,  6, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	itemball_event 28, 28, BIG_PEARL, 1, ROUTE14_15_UNDERWATER_POKEBALL
	
	const_def 1 ; object constants
	const ROUTE14_15_UNDERWATER_BUBBLE1
	const ROUTE14_15_UNDERWATER_BUBBLE2


Route14_15UnderwaterCallback:
	callasm UnderwaterSetUpBubbles
	readvar VAR_PLAYER_COLOR
	if_equal 5, .teal
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	moveperson FLICKER_STATION_SNARE, $12, $23
	jump .cont
.teal
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
.cont
	return
	
UnderwaterSetUpBubbles:
	ld a, 1
	ld b, a
	ld a, [wXCoord]
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farcall CopyDECoordsToMapObject
	
	ld a, 2
	ld b, a
	ld a, [wXCoord]
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farcall CopyDECoordsToMapObject
	
	ld a, 5
	ld [wRanchRaceSeconds], a
	xor a
	ld [wRanchRaceFrames], a
	ret