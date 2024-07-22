Inn1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 11, 13, CROSSROADS, 1
	warp_event 12, 13, CROSSROADS, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_MINA_GROUND,  7,  6, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND,  7,  7, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND,  7,  8, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND,  7,  9, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FAT_GUY,  9,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, -1
	
	
Inn1FClerk:
	end
