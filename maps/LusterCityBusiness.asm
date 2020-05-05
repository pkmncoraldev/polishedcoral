LusterCityBusiness_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BusinessCallback

	db 0 ; warp events

	db 16 ; coord events
	xy_trigger 0, 19, 15, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 0, 25, 18, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 0, 25, 33, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 0, 19, 36, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 1, 18, 36, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 19, 35, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 20, 36, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 24, 18, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 25, 17, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 26, 18, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 24, 33, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 25, 34, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 26, 33, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 18, 15, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 19, 16, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 20, 15, 0, LusterCityResidentialDark, 0, 0

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 24, 14, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1

	
BusinessCallback:
	checktime 1<<NITE
	iffalse .notnite
	changeblock $12, $18, $86
	changeblock $24, $12, $86
	changeblock $e, $12, $87
	changeblock $20, $18, $87
.notnite
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	setevent EVENT_IN_BUSINESS_DISTRICT
	return
