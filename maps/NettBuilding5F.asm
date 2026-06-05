NettBuilding5F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 21,  0, NETT_BUILDING_4F, 2
	warp_event 17,  0, NETT_BUILDING_6F, 1

	db 4 ; coord events
	coord_event  3,  3, -1, NettBuilding5FTeleporter1
	coord_event 11,  9, -1, NettBuilding5FTeleporter2
	coord_event  7, 15, -1, NettBuilding5FTeleporter3
	coord_event 15, 11, -1, NettBuilding5FTeleporter4

	db 31 ; bg events
	signpost  0, 19, SIGNPOST_JUMPTEXT, NettBuilding5FSignText
	signpost  4, 14, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 15, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 16, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 17, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 18, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 19, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 20, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 21, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 22, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 23, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 14, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 15, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 16, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 17, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 18, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 19, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 20, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 21, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 22, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 23, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 14, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 15, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 16, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 17, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 18, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 19, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 20, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 21, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 22, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 23, SIGNPOST_JUMPTEXT, NettBuilding5FServerText

	db 6 ; object events
	itemball_event 23,  7, KEY_CARD_B, 1, EVENT_GOT_BLUE_KEY_CARD
	person_event SPRITE_SLOWPOKETAIL,  9,  2, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  5,  2, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7, 16, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7, 20, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1


NettBuilding5FServerText:
	text "A huge stack of"
	line "computer servers"
	cont "click and whir."
	done

NettBuilding5FTeleporter1:
	teleporter NETT_BUILDING_4F, 11, 11
	end
	
NettBuilding5FTeleporter2:
	teleporter NETT_BUILDING_7F, 2, 9
	end
	
NettBuilding5FTeleporter3:
	teleporter NETT_BUILDING_6F, 3, 3
	end
	
NettBuilding5FTeleporter4:
	teleporter NETT_BUILDING_3F, 21, 11
	end
