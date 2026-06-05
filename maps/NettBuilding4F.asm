NettBuilding4F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 21,  0, NETT_BUILDING_3F, 2
	warp_event 17,  0, NETT_BUILDING_5F, 1

	db 4 ; coord events
	coord_event  3,  7, -1, NettBuilding4FTeleporter1
	coord_event  3, 15, -1, NettBuilding4FTeleporter2
	coord_event 11, 11, -1, NettBuilding4FTeleporter3
	coord_event 17, 11, -1, NettBuilding4FTeleporter4
	

	db 1 ; bg events
	signpost  0, 19, SIGNPOST_JUMPTEXT, NettBuilding4FSignText

	db 5 ; object events
	itemball_event 23, 13, KEY_CARD_Y, 1, EVENT_GOT_YELLOW_KEY_CARD
	person_event SPRITE_SLOWPOKETAIL,  3,  8, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 11,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  3,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 11,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1


NettBuilding4FTeleporter1:
	teleporter NETT_BUILDING_6F, 21, 13
	end
	
NettBuilding4FTeleporter2:
	teleporter NETT_BUILDING_3F, 1, 3
	end
	
NettBuilding4FTeleporter3:
	teleporter NETT_BUILDING_5F, 3, 3
	end
	
NettBuilding4FTeleporter4:
	teleporter NETT_BUILDING_2F, 1, 15
	end
	