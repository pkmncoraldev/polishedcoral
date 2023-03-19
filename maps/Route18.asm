Route18_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route18Trigger0
	scene_script Route18Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, Route18Callback

	db 0 ; warp events

	db 8 ; coord events
	coord_event  6, 18, 1, Route18MakeGrassGreen
	coord_event  7, 18, 1, Route18MakeGrassGreen
	coord_event  6, 19, 0, Route18MakeGrassYellow
	coord_event  7, 19, 0, Route18MakeGrassYellow
	coord_event 10, 26, 1, Route18MakeGrassGreen
	coord_event 11, 26, 1, Route18MakeGrassGreen
	coord_event 10, 28, 0, Route18MakeGrassYellow
	coord_event 10, 29, 0, Route18MakeGrassYellow

	db 2 ; bg events
	signpost 29,  2, SIGNPOST_READ, Route18Sunflower
	signpost 29,  3, SIGNPOST_READ, Route18Sunflower

	db 3 ; object events
	person_event SPRITE_CASINO, 28,  2, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 28,  3, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	itemball_event  2, 28, POTION, 1, EVENT_ROUTE_18_POKE_BALL

Route18Sunflower:
	jumptext Route18SunflowerText

Route18Trigger0:
	end
	
Route18Trigger1:
	end

Route18Callback:
	clearevent EVENT_ROUTE_18_GRASS_YELLOW
	dotrigger $0
	return
	
Route18MakeGrassGreen:
	clearevent EVENT_ROUTE_18_GRASS_YELLOW
	special Special_UpdatePalsInstant
	dotrigger $0
	end
	
Route18MakeGrassYellow:
	setevent EVENT_ROUTE_18_GRASS_YELLOW
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
Route18SunflowerText:
	text "A huge sunflower!"
	done