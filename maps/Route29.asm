Route29_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route29Callback

	db 1 ; warp events
	warp_def  1, -1, 2, GREEN_GROTTO_1F

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	
	
Route29Callback:
	checkevent EVENT_DONE_ROUTE_29_MINA
	iftrue .skip
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA_GROUND
	variablesprite SPRITE_DISGUISEMAN, SPRITE_VALVE_1
.skip
	return