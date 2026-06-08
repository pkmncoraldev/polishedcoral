NettBuildingSpinnerRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding2FCallback

	db 0 ; warp events

	db 14 ; coord events
	coord_event 27,  5, -1, NettBuildingSpinnerRoomTeleporter1
	coord_event 27, 17, -1, NettBuildingSpinnerRoomTeleporter2
	coord_event  9, 21, -1, NettBuildingSpinnerRoomTeleporter3
	coord_event  6,  2, -1, NettBuildingSpinDown
	coord_event 12,  7, -1, NettBuildingSpinLeft
	coord_event 17,  9, -1, NettBuildingSpinRight
	coord_event  2, 12, -1, NettBuildingSpinRight
	coord_event 10,  9, -1, NettBuildingSpinRight
	coord_event 19,  6, -1, NettBuildingSpinLeft
	coord_event 19, 12, -1, NettBuildingSpinDown
	coord_event  8, 12, -1, NettBuildingSpinDown
	coord_event 28, 13, -1, NettBuildingSpinDown
	coord_event 29, 13, -1, NettBuildingSpinDown
	coord_event 12, 12, -1, NettBuildingSpinDown
	

	db 1 ; bg events
	signpost 14, 26, SIGNPOST_JUMPTEXT, NettBuildingSpinnerRoomWetFloorText

	db 12 ; object events
	person_event SPRITE_SPINNER,  2,  6, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER,  7, 12, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER,  9, 17, SPRITEMOVEDATA_TILE_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER, 12,  2, SPRITEMOVEDATA_TILE_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER,  9, 10, SPRITEMOVEDATA_TILE_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER,  6, 19, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER, 12, 19, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER, 12,  8, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER, 13, 28, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER, 13, 29, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPINNER, 12, 12, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  6, 20, EMPLOYEE_ID, 1, EVENT_GOT_EMPLOYEE_ID
	
	
NettBuildingSpinnerRoomTeleporter1:
	teleporter NETT_BUILDING_5F, 15, 11
	end
	
NettBuildingSpinnerRoomTeleporter2:
	teleporter NETT_BUILDING_2F, 11, 9
	end
	
NettBuildingSpinnerRoomTeleporter3:
	teleporter NETT_BUILDING_SPINNER_ROOM, 27, 16
	end
	
NettBuildingSpinRight:
	loadvar wPlayerStandingTile, COLL_SPIN_RIGHT
	end
	
NettBuildingSpinLeft:
	loadvar wPlayerStandingTile, COLL_SPIN_LEFT
	end
	
NettBuildingSpinDown:
	loadvar wPlayerStandingTile, COLL_SPIN_DOWN
	end
	
NettBuildingSpinnerRoomWetFloorText:
	text "CAUTION!"
	line "SLIPPERY FLOOR!"
	done