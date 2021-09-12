LusterMallAntiqueShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  4, 13, LUSTER_MALL
	warp_def  7,  5, 14, LUSTER_MALL

	db 0 ; coord events

	db 13 ; bg events
	signpost  1,  0, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopStatueText
	signpost  1,  1, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopStatueText
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopStatueText
	signpost  3,  0, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopStatueText
	signpost  3,  1, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopStatueText
	signpost  4,  1, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopStatueText
	signpost  0,  2, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopLampText
	signpost  0,  5, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopLampText
	signpost  0,  4, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopMapText
	signpost  1,  6, SIGNPOST_UP, LusterMallAntiqueShopBookShelf
	signpost  1,  3, SIGNPOST_UP, LusterMallAntiqueShopIncense
	signpost  4,  7, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopRadioText
	signpost  5,  7, SIGNPOST_JUMPTEXT, LusterMallAntiqueShopPlaqueText

	db 2 ; object events
	object_event  1,  6, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_ANTIQUE, MART_LUSTER_MALL_ANTIQUE, -1
	person_event SPRITE_POKEFAN_F,  2,  0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMallAntiqueShop_NPC, -1

	const_def 1 ; object constants
	const LUSTER_MALL_ANTIQUE_CLERK
	const LUSTER_MALL_ANTIQUE_NPC
	

LusterMallAntiqueShop_NPC:
	jumptextfaceplayer LusterMallAntiqueShop_NPCText
	
LusterMallAntiqueShopBookShelf:
	jumptext LusterMallAntiqueShopBookShelfText
	
LusterMallAntiqueShopIncense:
	jumptext LusterMallAntiqueShopIncenseText
	
LusterMallAntiqueShop_NPCText:
	text "There's so many"
	line "cute little"
	cont "trinkets for sale!"
	
	para "I want to buy all"
	line "of it!"
	done
	
LusterMallAntiqueShopStatueText:
	text "A statue of a"
	line "#MON."
	done
	
LusterMallAntiqueShopLampText:
	text "An antique lamp."
	done
	
LusterMallAntiqueShopMapText:
	text "At first glance it"
	line "looks like a map,"
	
	para "but it's actually a"
	line "painting."
	done
	
LusterMallAntiqueShopBookShelfText:
	text "It's filled with"
	line "old novels."
	
	para "Boooring!"
	done
	
LusterMallAntiqueShopIncenseText:
	text "An old incense"
	line "burner."
	
	para "It's been polished"
	line "to a shine!"
	done
	
LusterMallAntiqueShopRadioText:
	text "It's unplugged."
	
	para "I wonder if it"
	line "still works."
	done
	
LusterMallAntiqueShopPlaqueText:
	text "A bronze plaque"
	line "of some kind."
	done
