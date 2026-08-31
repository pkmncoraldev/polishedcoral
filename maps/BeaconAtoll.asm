BeaconAtoll_MapScriptHeader:
	db 1 ; scene scripts
	scene_script BeaconAtollTrigger0

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_MISC_PALM,  3, 24, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, EventideBikeShopOwner, -1
	person_event SPRITE_MISC_PALM,  3, 26, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, EventideBikeShopOwner, -1
	person_event SPRITE_MISC_PALM,  3, 33, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, EventideBikeShopOwner, -1
	person_event SPRITE_MISC_PALM,  3, 35, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, EventideBikeShopOwner, -1
	
	
BeaconAtollTrigger0:
	special Special_UpdatePalsInstant
	end
