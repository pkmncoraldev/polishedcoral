NettBuildingTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 1 ; coord events
	coord_event  8, 13, -1, NettBuildingTopTeleporter

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_CLOTHES_RACKS,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  6, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS, 15, 20, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS, 15,  3, SPRITEMOVEDATA_TILE_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
NettBuildingTopTeleporter:
	teleporter NETT_BUILDING_OFFICE, 1, 2
	end
