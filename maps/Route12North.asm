Route12North_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route12NorthCallback

	db 1 ; warp events
	warp_event  7, 15, ROUTE_12_TENT, 1

	db 15 ; coord events
	xy_trigger 0, 17,  7, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 18,  8, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 19,  7, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 18,  6, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 19,  8, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 19,  6, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 17,  8, 0, Route12NorthLight, 0, 0
	xy_trigger 0, 17,  6, 0, Route12NorthLight, 0, 0
	xy_trigger 1, 16,  7, 0, Route12NorthDark, 0, 0
	xy_trigger 1, 18,  9, 0, Route12NorthDark, 0, 0
	xy_trigger 1, 16,  6, 0, Route12NorthDark, 0, 0
	xy_trigger 1, 17,  5, 0, Route12NorthDark, 0, 0
	xy_trigger 1, 17,  9, 0, Route12NorthDark, 0, 0
	xy_trigger 1, 16,  8, 0, Route12NorthDark, 0, 0
	xy_trigger 1, 19,  9, 0, Route12NorthDark, 0, 0

	db 0 ; bg events

	db 3 ; object events
	object_event  0, 0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route12NorthCampfire, EVENT_HIDE_OW_OBJECTS_BROWN
	object_event  0, 0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route12NorthCampfire, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event  0, 0, SPRITE_MISC_OVERHEAD, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	const_def 1 ; object constants
	const ROUTE_12_NORTH_FIRE_BROWN
	const ROUTE_12_NORTH_FIRE_TEAL
	const ROUTE_12_NORTH_FIREBOTTOM
	
Route12NorthCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 3, .brown
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	jump .cont
.brown
	setevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
.cont
	checktime 1<<NITE
	iftrue .changecampfire
	checktime 1<<DUSK
	iffalse .end
.changecampfire
	moveperson ROUTE_12_NORTH_FIRE_BROWN, 7, 18
	moveperson ROUTE_12_NORTH_FIRE_TEAL, 7, 18
	moveperson ROUTE_12_NORTH_FIREBOTTOM, 7, 18
	changeblock $6, $10, $4e
	changeblock $8, $10, $4f
	changeblock $6, $12, $52
	changeblock $8, $12, $53
.end
	return
	
Route12NorthCampfire:
	end
	
Route12NorthLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
Route12NorthDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	end