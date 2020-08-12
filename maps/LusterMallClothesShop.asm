LusterMallClothesShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 21, LUSTER_MALL
	warp_def  7,  3, 22, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	person_event SPRITE_FAT_GUY,  2,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopClerk, -1
	person_event SPRITE_CUTE_GIRL,  4,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  6,  8, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  7,  8, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  4,  1, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  5,  1, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  6, 10, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  7, 10, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  7,  5, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

LusterMallClothesShopClerk:
	callasm ClothesShop
	end
	
ClothesShop:
	ld a, PIPPI
	ld [wPlayerGender], a
	call ReplaceKrisSprite
	ret