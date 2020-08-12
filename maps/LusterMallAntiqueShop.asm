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

	db 0 ; object events

LusterMallAntiqueShopBookShelf:
	jumptext LusterMallAntiqueShopBookShelfText
	
LusterMallAntiqueShopIncense:
	jumptext LusterMallAntiqueShopIncenseText
	
LusterMallAntiqueShopStatueText:
	text "A statue of a"
	line "#MON."
	done
	
LusterMallAntiqueShopLampText:
	text "An antique lamp."
	done
	
LusterMallAntiqueShopMapText:
	text "At first glance"
	line "it looks like a map,"
	
	para "but it's actually a"
	line "painting."
	done
	
LusterMallAntiqueShopBookShelfText:
	text "It's filled with old"
	line "novels."
	
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
	text "A bronze plaque of"
	line "some kind."
	done
