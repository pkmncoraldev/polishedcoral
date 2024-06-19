LusterMallClothesShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 21, LUSTER_MALL
	warp_def  7,  3, 22, LUSTER_MALL

	db 0 ; coord events

	db 3 ; bg events
	signpost  2,  3, SIGNPOST_READ, LusterMallClothesShopShoes
	signpost  2,  4, SIGNPOST_READ, LusterMallClothesShopShoes
	signpost  2, 10, SIGNPOST_READ, LusterMallClothesShopShoes

	db 9 ; object events
	object_event 7, 2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_CLOTHES, MART_LUSTER_MALL_CLOTHES, -1
	person_event SPRITE_CUTE_GIRL,  4,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopNpc1, -1
	person_event SPRITE_BEAUTY,  6,  9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopNpc2, -1
	person_event SPRITE_POLLY,  6,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopPolly, EVENT_POLLY_NOT_IN_BOUTIQUE
	person_event SPRITE_CLOTHES_RACKS,  6,  8, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  7,  8, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  4,  1, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  5,  1, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  7,  6, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	const_def 1 ; object constants
	const LUSTER_MALL_CLOTHES_SHOP_CLERK
	const LUSTER_MALL_CLOTHES_SHOP_NPC_1
	const LUSTER_MALL_CLOTHES_SHOP_NPC_2
	const LUSTER_MALL_CLOTHES_SHOP_POLLY
	
	
LusterMallClothesShopPolly:
	setevent EVENT_MET_POLLY
	faceplayer
	opentext
	writetext LusterMallClothesShopPollyText
	waitbutton
	closetext
	setevent EVENT_POLLY_NOT_IN_BOUTIQUE
	clearevent EVENT_POLLY_NOT_IN_ELECTRONICS
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement LUSTER_MALL_CLOTHES_SHOP_POLLY, Movement_LusterMallClothesShopPolly1
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_MALL_CLOTHES_SHOP_POLLY
	end
.YouAreFacingRight
	applymovement LUSTER_MALL_CLOTHES_SHOP_POLLY, Movement_LusterMallClothesShopPolly2
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_MALL_CLOTHES_SHOP_POLLY
	end
	
LusterMallClothesShopPollyText:
	text "Huh?"
	
	para "GYM LEADER?"
	
	para "Maybe I am, <WAIT_S>what"
	line "about it?"
	
	para "A battle?"
	
	para "Like, <WAIT_S>no way!"
	
	para "Can't you see"
	line "I'm busy?"
	
	para "Anyway I'm going"
	line "shopping for a"
	cont "new phone."
	
	para "Later!"
	done
	
Movement_LusterMallClothesShopPolly1:
	step_left
	step_left
	step_left
	step_down
	step_end
	
Movement_LusterMallClothesShopPolly2:
	step_up
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end
	
LusterMallClothesShopNpc1:
	faceplayer
	opentext
	writetext LusterMallClothesShopNpc1Text
	waitbutton
	closetext
	spriteface LUSTER_MALL_CLOTHES_SHOP_NPC_1, LEFT
	end
	
LusterMallClothesShopNpc2:
	jumptextfaceplayer LusterMallClothesShopNpc2Text
	
LusterMallClothesShopShoes:
	jumptextfaceplayer LusterMallClothesShopShoesText
	
LusterMallClothesShopNpc1Text:
	text "Oh these clothes"
	line "are cute."
	
	para "Hmm…"
	
	para "Do I really need"
	line "more clothes?"
	done
	
LusterMallClothesShopNpc2Text:
	text "What do you think"
	line "of my outfit?"
	
	para "…"
	
	para "Actually,<WAIT_S>"
	line "nevermind."
	
	para "You clearly have"
	line "no sense of style…"
	done
	
LusterMallClothesShopShoesText:
	text "Shoes, <WAIT_S>hats,<WAIT_S> and"
	line "bags."
	done
	