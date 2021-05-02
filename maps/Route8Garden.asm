Route8Garden_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route8GardenCallback

	db 3 ; warp events
	warp_def  7, 17, 3, ROUTE_8_ENCOUNTER_HOUSE
	warp_def  7, 18, 3, ROUTE_8_ENCOUNTER_HOUSE
	warp_def 11, 17, 1, ROUTE_8_ENCOUNTER_HOUSE

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

Route8GardenCallback:
	checkflag ENGINE_DAILY_ROUTE_GARDEN
	iftrue .setflag
	return
.setflag
	setflag ENGINE_ENCOUNTER_HOUSE
	return