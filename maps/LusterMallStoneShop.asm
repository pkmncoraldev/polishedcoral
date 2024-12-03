LusterMallStoneShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  4, 17, LUSTER_MALL
	warp_def  7,  5, 18, LUSTER_MALL

	db 0 ; coord events

	db 11 ; bg events
	signpost  3,  1, SIGNPOST_JUMPTEXT, LusterMallStoneShopCaseText
	signpost  3,  2, SIGNPOST_JUMPTEXT, LusterMallStoneShopCaseText
	signpost  5,  1, SIGNPOST_JUMPTEXT, LusterMallStoneShopCaseText
	signpost  5,  2, SIGNPOST_JUMPTEXT, LusterMallStoneShopCaseText
	signpost  7,  1, SIGNPOST_JUMPTEXT, LusterMallStoneShopCaseText
	signpost  7,  2, SIGNPOST_JUMPTEXT, LusterMallStoneShopCaseText
	signpost  1,  0, SIGNPOST_JUMPTEXT, LusterMallStoneShopPosterText
	signpost  1,  1, SIGNPOST_JUMPTEXT, LusterMallStoneShopPosterText
	signpost  1,  2, SIGNPOST_JUMPTEXT, LusterMallStoneShopPosterText
	signpost  1,  3, SIGNPOST_JUMPTEXT, LusterMallStoneShopPosterText
	signpost  1,  4, SIGNPOST_JUMPTEXT, LusterMallStoneShopPosterText

	db 4 ; object events
	object_event  6,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_COMMAND, pokemart, MARTTYPE_STONE, MART_LUSTER_MALL_STONE, -1
	person_event SPRITE_GENTLEMAN,  4,  1, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallStoneShop_NPC1, -1
	person_event SPRITE_POKEFAN_F,  5,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallStoneShop_NPC2, -1
	person_event SPRITE_POLLY,  5,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallStoneShopPolly, EVENT_POLLY_NOT_IN_SHINY_SHARDS

	
	const_def 1 ; object constants
	const LUSTER_MALL_STONE_SHOP_CLERK
	const LUSTER_MALL_STONE_SHOP_NPC1
	const LUSTER_MALL_STONE_SHOP_NPC2
	const LUSTER_MALL_STONE_SHOP_POLLY
	
LusterMallStoneShopPolly:
	faceplayer
	opentext
	writetext LusterMallStoneShopPollyText
	waitbutton
	closetext
	setevent EVENT_POLLY_NOT_IN_SHINY_SHARDS
	clearevent EVENT_POLLY_NOT_IN_KOFFING_BEAN
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement LUSTER_MALL_STONE_SHOP_POLLY, Movement_LusterMallStoneShopPolly1
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_MALL_STONE_SHOP_POLLY
	end
.YouAreFacingLeft
	applymovement LUSTER_MALL_STONE_SHOP_POLLY, Movement_LusterMallStoneShopPolly2
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_MALL_STONE_SHOP_POLLY
	end
	
LusterMallStoneShopPollyText:
	text "Oh it's you…"
	
	para "Nope!"
	
	para "Still not gonna"
	line "battle you!"
	
	para "But look at how"
	line "beautiful all this"
	cont "jewlery is!"
	
	para "It's totally"
	line "making my mouth"
	cont "water…"
	
	para "…<WAIT_L>and my stomach"
	line "grumble…"
	
	para "Maybe I'm just"
	line "hungry!"
	done
	
Movement_LusterMallStoneShopPolly1:
	step_right
	step_down
	step_down
	step_end
	
Movement_LusterMallStoneShopPolly2:
	step_down
	step_right
	step_down
	step_end
	
LusterMallStoneShop_NPC1:
	jumptextfaceplayer LusterMallStoneShop_NPC1Text
	
LusterMallStoneShop_NPC2:
	jumptextfaceplayer LusterMallStoneShop_NPC2Text
	
LusterMallStoneShop_NPC1Text:
	text "A lot of TRAINERS"
	line "use these stones"
	cont "to evolve their "
	cont "#MON."
	
	para "Me personally?"
	
	para "I'm a collector."
	done
	
LusterMallStoneShop_NPC2Text:
	text "The prices here"
	line "are outragious!"
	
	para "I guess you get"
	line "what you pay for,"
	cont "though."
	done
	
LusterMallStoneShopCaseText:
	text "A variety of shiny"
	line "stones."
	
	para "So pretty!"
	done
	
LusterMallStoneShopPosterText:
	text "A poster of a cute"
	line "#MON."
	
	para "I wonder if it"
	line "evolves with a"
	cont "stone…"
	done