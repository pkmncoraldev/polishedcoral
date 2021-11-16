Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route11GateCallback

	db 4 ; warp events
	warp_event  3,  0, LUSTER_CITY_RESIDENTIAL, 10
	warp_event  4,  0, LUSTER_CITY_RESIDENTIAL, 11
	warp_event  3,  7, ROUTE_11, 1
	warp_event  4,  7, ROUTE_11, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

Route11GateCallback:
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	return