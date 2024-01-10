KomoreVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, KomoreVillageFlyPoint
	callback MAPCALLBACK_TILES, Route23Callback

	db 7 ; warp events
	warp_def 19, 32, 1, KOMORE_COMMUNITY_CENTER
	warp_def 19, 33, 2, KOMORE_COMMUNITY_CENTER
	warp_def  7, 11, 1, KOMORE_HOUSE_1
	warp_def 13, 23, 1, KOMORE_HOUSE_2
	warp_def 13, 13, 1, KOMORE_HOUSE_3
	warp_def  5, 31, 1, KOMORE_POKECENTER
	warp_def  7, 19, 1, KOMORE_MART

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK

KomoreVillageFlyPoint:
	setflag ENGINE_FLYPOINT_KOMORE
	return