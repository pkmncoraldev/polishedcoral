LusterMallFurniture_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 11,  6, 24, LUSTER_MALL
	warp_def 11,  7, 25, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_CLERK,  1,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShopClerk2, -1
