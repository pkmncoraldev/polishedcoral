Route14_15Underwater_MapScriptHeader:
	db 3 ; scene scripts
	scene_script Route14_15UnderwaterTrigger0
	scene_script Route14_15UnderwaterTrigger1
	scene_script Route14_15UnderwaterTrigger2

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

	db 32 ; coord events
	coord_event 23, 21, 1, Route14_15UnderwaterEasterEggOn
	coord_event 23, 20, 1, Route14_15UnderwaterEasterEggOn
	coord_event 23, 19, 1, Route14_15UnderwaterEasterEggOn
	coord_event 24, 19, 1, Route14_15UnderwaterEasterEggOn
	coord_event 25, 19, 1, Route14_15UnderwaterEasterEggOn
	coord_event 26, 19, 1, Route14_15UnderwaterEasterEggOn
	coord_event 26, 20, 1, Route14_15UnderwaterEasterEggOn
	coord_event 26, 21, 1, Route14_15UnderwaterEasterEggOn
	coord_event 24, 21, 1, Route14_15UnderwaterEasterEggOn
	coord_event 25, 21, 1, Route14_15UnderwaterEasterEggOn
	coord_event 21, 21, 2, Route14_15UnderwaterEasterEggOff
	coord_event 21, 20, 2, Route14_15UnderwaterEasterEggOff
	coord_event 21, 19, 2, Route14_15UnderwaterEasterEggOff
	coord_event 21, 18, 2, Route14_15UnderwaterEasterEggOff
	coord_event 22, 17, 2, Route14_15UnderwaterEasterEggOff
	coord_event 23, 17, 2, Route14_15UnderwaterEasterEggOff
	coord_event 24, 17, 2, Route14_15UnderwaterEasterEggOff
	coord_event 25, 17, 2, Route14_15UnderwaterEasterEggOff
	coord_event 26, 17, 2, Route14_15UnderwaterEasterEggOff
	coord_event 27, 17, 2, Route14_15UnderwaterEasterEggOff
	coord_event 28, 18, 2, Route14_15UnderwaterEasterEggOff
	coord_event 28, 19, 2, Route14_15UnderwaterEasterEggOff
	coord_event 28, 20, 2, Route14_15UnderwaterEasterEggOff
	coord_event 28, 21, 2, Route14_15UnderwaterEasterEggOff
	coord_event 27, 23, 2, Route14_15UnderwaterEasterEggOff
	coord_event 26, 23, 2, Route14_15UnderwaterEasterEggOff
	coord_event 23, 23, 2, Route14_15UnderwaterEasterEggOff
	coord_event 24, 23, 2, Route14_15UnderwaterEasterEggOff
	coord_event 25, 23, 2, Route14_15UnderwaterEasterEggOff
	coord_event 22, 23, 2, Route14_15UnderwaterEasterEggOff
	coord_event 28, 22, 2, Route14_15UnderwaterEasterEggOff
	coord_event 21, 22, 2, Route14_15UnderwaterEasterEggOff

	db 3 ; bg events
	signpost 29, 21, SIGNPOST_ITEM + BIG_PEARL, EVENT_ROUTE_14_15_UNDERWATER_HIDDEN_ITEM_1
	signpost 11, 13, SIGNPOST_ITEM + PEARL, EVENT_ROUTE_14_15_UNDERWATER_HIDDEN_ITEM_2
	signpost 25, 38, SIGNPOST_ITEM + PEARL, EVENT_ROUTE_14_15_UNDERWATER_HIDDEN_ITEM_3

	db 7 ; object events
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	itemball_event 28, 28, BIG_PEARL, 1, EVENT_ROUTE_14_15_UNDERWATER_POKEBALL_1
	itemball_event 23, 11, PEARL, 1, EVENT_ROUTE_14_15_UNDERWATER_POKEBALL_2
	itemball_event  6,  4, CORAL_SHARD, 1, EVENT_ROUTE_14_15_UNDERWATER_POKEBALL_3
	itemball_event 67, 11, CORAL_SHARD, 1, EVENT_ROUTE_14_15_UNDERWATER_POKEBALL_4
	itemball_event 20, 29, PEARL, 1, EVENT_ROUTE_14_15_UNDERWATER_POKEBALL_5
	
	const_def 1 ; object constants
	const ROUTE14_15_UNDERWATER_BUBBLE1
	const ROUTE14_15_UNDERWATER_BUBBLE2


Route14_15UnderwaterTrigger0:
	end
	
Route14_15UnderwaterTrigger1:
	end
	
Route14_15UnderwaterTrigger2:
	end

Route14_15UnderwaterCallback:
	callasm UnderwaterSetUpBubbles
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	disappear ROUTE14_15_UNDERWATER_BUBBLE1
	disappear ROUTE14_15_UNDERWATER_BUBBLE2
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE1
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE2
	disappear ROUTE14_15_UNDERWATER_BUBBLE1
	appear ROUTE14_15_UNDERWATER_BUBBLE2
	jump .cont
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	disappear ROUTE14_15_UNDERWATER_BUBBLE1
	disappear ROUTE14_15_UNDERWATER_BUBBLE2
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE1
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE2
	appear ROUTE14_15_UNDERWATER_BUBBLE1
	disappear ROUTE14_15_UNDERWATER_BUBBLE2
.cont
	callasm CheckUnderwaterEasterEggAsm
	if_equal 1, .easter_egg
	dotrigger $0
	return
.easter_egg
	dotrigger $1
	return
	
CheckUnderwaterEasterEggAsm:
	call Random
	cp 1 percent
	jr c, .easter_egg
	xor a
	ld [wScriptVar], a
	ret
.easter_egg
	ld a, 1
	ld [wScriptVar], a
	ret
	
	
Route14_15UnderwaterEasterEggOn:
	setevent EVENT_ROUTE_14_15_UNDERWATER_EASTER_EGG
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $2
	end
	
Route14_15UnderwaterEasterEggOff:
	clearevent EVENT_ROUTE_14_15_UNDERWATER_EASTER_EGG
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	end
	
UnderwaterSetUpBubbles:
	ld a, 5
	ld [wRanchRaceSeconds], a
	xor a
	ld [wRanchRaceFrames], a
	ret