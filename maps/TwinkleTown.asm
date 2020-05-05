TwinkleTown_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleTownTrigger0
	scene_script TwinkleTownTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, TwinkleTownFlypointCallback
	callback MAPCALLBACK_OBJECTS, TwinkleTownStopSnowstorm

	db 5 ; warp events
	warp_def 47, 11, 1, TWINKLE_POKECENTER
	warp_def 41, 17, 1, TWINKLE_MART
	warp_def 31, 17, 1, TWINKLE_HOUSE_1
	warp_def 39,  7, 1, TWINKLE_HOUSE_2
	warp_def 49, 21, 1, TWINKLE_HOUSE_3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

TwinkleTownFlypointCallback:
	setflag ENGINE_FLYPOINT_TWINKLE
	return
	
TwinkleTownStopSnowstorm:
	clearevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger ROUTE_10, $0
	return
	
TwinkleTownTrigger0:
	end

TwinkleTownTrigger1:
	end