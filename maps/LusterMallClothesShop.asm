LusterMallClothesShop_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterMallClothesShopTrigger0
	scene_script LusterMallClothesShopTrigger1

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
	object_event 7, 2, SPRITE_PUNK_CHICK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_COMMAND, pokemart, MARTTYPE_CLOTHES, MART_LUSTER_MALL_CLOTHES, -1
	person_event SPRITE_CUTE_GIRL,  4,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopNpc1, -1
	person_event SPRITE_PONYTAIL,  6,  9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopNpc2, -1
	person_event SPRITE_POLLY,  6,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallClothesShopPolly, EVENT_POLLY_NOT_IN_BOUTIQUE
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
	
	
LusterMallClothesShopTrigger0:
	end
	
LusterMallClothesShopTrigger1:
	priorityjump LusterMallClothesShopClerkAfter
	end
	
LusterMallClothesShopClerkAfter:
	dotrigger $0
	pause 10
	applymovement PLAYER, ChangeColorMovement
	playsound SFX_TWINKLE
	callasm LusterMallClothesShopChangeColor
	closetext
	waitsfx
	pause 10
	callasm LusterMallClothesShopCoordAsm
	if_equal 2, .up
	applyonemovement LUSTER_MALL_CLOTHES_SHOP_CLERK, turn_step_down
	applyonemovement LUSTER_MALL_CLOTHES_SHOP_CLERK, remove_fixed_facing
	jumptext LusterMallClerkAfterText
.up
	applyonemovement LUSTER_MALL_CLOTHES_SHOP_CLERK, turn_step_left
	applyonemovement LUSTER_MALL_CLOTHES_SHOP_CLERK, remove_fixed_facing
	jumptext LusterMallClerkAfterText

LusterMallClothesShopCoordAsm:
	ld a, [wYCoord]
	ld [wScriptVar], a
	ret

LusterMallClothesShopChangeColor:
	ld a, [wPlayerInitialPalette]
	ld [wPlayerPalette], a
	jp ReplaceKrisSprite
	
LusterMallClerkAfterText:
	text "You look sooooo"
	line "good!"
	
	para "Snicker…"
	done
	
ChangeColorMovement:
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 12
	step_end
	
LusterMallClothesShopPolly:
	setevent EVENT_MET_POLLY
	faceplayer
	opentext TEXTBOX_UNKNOWN
	writetext LusterMallClothesShopPollyText
	buttonsound
	changetextboxspeaker TEXTBOX_POLLY
	farwritetext StdBlankText
	pause 6
	writetext LusterMallClothesShopPollyText2
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
	done
	
LusterMallClothesShopPollyText2:
	text "A battle?<WAIT_S>"
	line "Like, <WAIT_S>no way!"
	
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
	