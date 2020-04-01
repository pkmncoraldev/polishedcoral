LusterCityBusiness_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BusinessCallback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

	
BusinessCallback:
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	setevent EVENT_IN_BUSINESS_DISTRICT
	return
