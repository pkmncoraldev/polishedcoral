Route10East_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route10EastTrigger0
	scene_script Route10EastTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route10EastCallback

	db 2 ; warp events
	warp_event 11, 21, ROUTE_10_TENT, 1
	warp_event 14,  7, ICE_CAVE_B1F, 3

	db 20 ; coord events
	xy_trigger 0, 23, 11, 0, Route10EastLight, 0, 0
	xy_trigger 0, 24, 12, 0, Route10EastLight, 0, 0
	xy_trigger 0, 25, 11, 0, Route10EastLight, 0, 0
	xy_trigger 0, 24, 10, 0, Route10EastLight, 0, 0
	xy_trigger 0, 25, 12, 0, Route10EastLight, 0, 0
	xy_trigger 0, 25, 10, 0, Route10EastLight, 0, 0
	xy_trigger 0, 23, 12, 0, Route10EastLight, 0, 0
	xy_trigger 0, 23, 10, 0, Route10EastLight, 0, 0
	xy_trigger 1, 25,  9, 0, Route10EastDark, 0, 0
	xy_trigger 1, 22, 11, 0, Route10EastDark, 0, 0
	xy_trigger 1, 26, 10, 0, Route10EastDark, 0, 0
	xy_trigger 1, 24, 13, 0, Route10EastDark, 0, 0
	xy_trigger 1, 22, 10, 0, Route10EastDark, 0, 0
	xy_trigger 1, 26, 11, 0, Route10EastDark, 0, 0
	xy_trigger 1, 23,  9, 0, Route10EastDark, 0, 0
	xy_trigger 1, 24,  9, 0, Route10EastDark, 0, 0
	xy_trigger 1, 23, 13, 0, Route10EastDark, 0, 0
	xy_trigger 1, 22, 12, 0, Route10EastDark, 0, 0
	xy_trigger 1, 26, 12, 0, Route10EastDark, 0, 0
	xy_trigger 1, 25, 13, 0, Route10EastDark, 0, 0

	db 2 ; bg events
	signpost 20,  9, SIGNPOST_READ, Route10EastWood
	signpost 21,  9, SIGNPOST_READ, Route10EastWood

	db 3 ; object events
	object_event 11, 24, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route10EastCampfire, EVENT_HIDE_OW_OBJECTS_BROWN
	object_event 11, 24, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route10EastCampfire, EVENT_HIDE_OW_OBJECTS_TEAL
	tmhmball_event 20, 20, TM_HAIL, EVENT_ROUTE_10_EAST_POKE_BALL_HAIL

	
Route10EastTrigger0:
	checkevent EVENT_SNOWSTORM_HAPPENING
	iffalse .end
	callasm Route10SfxAsm
.end
	end
	
Route10EastTrigger1:
	checkevent EVENT_SNOWSTORM_HAPPENING
	iffalse .end
	callasm Route10SfxAsm
.end
	end
	
Route10EastCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 3, .brown
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
.brown
	setevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
	
Route10EastWood:
	jumptext Route10EastWoodText
	
Route10EastWoodText:
	text "A pile of neatly"
	line "stacked firewood."
	done
	
Route10EastCampfire:
	jumptext Route10EastCampfireText
	
Route10EastCampfireText:
	text "A fire is blazing!"
	done

Route10EastLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
Route10EastDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	end
