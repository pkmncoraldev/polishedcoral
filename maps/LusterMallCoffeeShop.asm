LusterMallCoffeeShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  4, 9, LUSTER_MALL
	warp_def  7,  5, 10, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  1, SPRITE_N64, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GameConsole, -1
