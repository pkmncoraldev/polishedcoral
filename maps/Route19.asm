Route19_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  8, 26, ROUTE_17, 1
	warp_event  8, 27, ROUTE_17, 2

	db 0 ; coord events

	db 7 ; bg events
	signpost 21, 31, SIGNPOST_JUMPTEXT, Route19BrokenCar
	signpost 21, 32, SIGNPOST_JUMPTEXT, Route19BrokenCar
	signpost 20, 23, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 20, 33, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 22, 30, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 23, 30, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 24, 29, SIGNPOST_JUMPTEXT, Route19Tire
	

	db 1 ; object events
	person_event SPRITE_PLANK_BRIDGE,  5, 20, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


Route19BrokenCar:
	text "A broken down car."
	done
	
Route19Tire:
	text "Tires are stacked"
	line "around randomly."
	done