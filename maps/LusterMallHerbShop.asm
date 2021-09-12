LusterMallHerbShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  2, 15, LUSTER_MALL
	warp_def  5,  3, 16, LUSTER_MALL

	db 0 ; coord events

	db 11 ; bg events
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallHerbShopShelfText
	signpost  1,  2, SIGNPOST_JUMPTEXT, LusterMallHerbShopShelfText
	signpost  1,  3, SIGNPOST_JUMPTEXT, LusterMallHerbShopShelfText
	signpost  2,  0, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  3,  0, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  1,  4, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  1,  5, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  1,  6, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  5,  0, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  4,  0, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText
	signpost  1,  1, SIGNPOST_JUMPTEXT, LusterMallHerbShopPlantText

	db 3 ; object events
	object_event  6,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_HERB, MART_LUSTER_MALL_HERB, -1
	person_event SPRITE_AROMA_LADY,  2,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterMallHerbShop_NPC1, -1
	person_event SPRITE_BATTLE_GIRL,  3,  1, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallHerbShop_NPC2, -1

LusterMallHerbShop_NPC1:
	jumptextfaceplayer LusterMallHerbShop_NPC1Text
	
LusterMallHerbShop_NPC2:
	jumptextfaceplayer LusterMallHerbShop_NPC2Text
	
	
LusterMallHerbShop_NPC1Text:
	text "The herbs sold at"
	line "this little shop"
	cont "taste gross!"
	
	para "But they're very"
	line "good for #MON!"
	
	para "They don't like"
	line "taking them,"
	
	para "but it's for their"
	line "own good!"
	done
	
LusterMallHerbShop_NPC2Text:
	text "Pee-yew!"
	
	para "This place stinks!"
	done
	
LusterMallHerbShopShelfText:
	text "Bottles and jars"
	line "of vitamins and"
	cont "herbs."
	done
	
LusterMallHerbShopPlantText:
	text "An exotic plant."
	
	para "It smells strange…"
	done