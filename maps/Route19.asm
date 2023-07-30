Route19_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route19Trigger0
	scene_script Route19Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, Route19Callback

	db 0 ; warp events

	db 12 ; coord events
	coord_event  6, 18, 1, Route19MakeGrassGreen
	coord_event  7, 18, 1, Route19MakeGrassGreen
	coord_event  6, 19, 0, Route19MakeGrassYellow
	coord_event  7, 19, 0, Route19MakeGrassYellow
	coord_event 10, 26, 1, Route19MakeGrassGreen
	coord_event 11, 26, 1, Route19MakeGrassGreen
	coord_event 10, 28, 0, Route19MakeGrassYellow
	coord_event 10, 29, 0, Route19MakeGrassYellow
	coord_event  9,  6, 1, Route19MakeGrassGreen
	coord_event  9,  7, 1, Route19MakeGrassGreen
	coord_event  8,  6, 0, Route19MakeGrassYellow
	coord_event  8,  7, 0, Route19MakeGrassYellow

	db 2 ; bg events
	signpost 29,  2, SIGNPOST_READ, Route19Sunflower
	signpost 29,  3, SIGNPOST_READ, Route19Sunflower

	db 4 ; object events
	person_event SPRITE_CASINO, 28,  2, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 28,  3, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	itemball_event  2,  6, POTION, 1, EVENT_ROUTE_19_POKE_BALL_1
	tmhmball_event  2, 28, TM_DAZZLINGLEAM, EVENT_ROUTE_19_POKE_BALL_2

Route19Sunflower:
	jumptext Route19SunflowerText

Route19Trigger0:
	end
	
Route19Trigger1:
	end

Route19Callback:
	clearevent EVENT_ROUTE_19_GRASS_YELLOW
	dotrigger $0
	return
	
Route19MakeGrassGreen:
	clearevent EVENT_ROUTE_19_GRASS_YELLOW
	special Special_UpdatePalsInstant
	dotrigger $0
	end
	
Route19MakeGrassYellow:
	setevent EVENT_ROUTE_19_GRASS_YELLOW
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
Route19SunflowerText:
	text "A huge sunflower!"
	done