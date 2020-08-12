LusterMallSkateShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  4, 11, LUSTER_MALL
	warp_def  5,  5, 12, LUSTER_MALL

	db 0 ; coord events

	db 7 ; bg events
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  4,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  5,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  0,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  0,  5, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  5,  2, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  5,  1, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText

	db 0 ; object events

	
LusterMallSkateShopShelfText:
	text "It's filled with"
	line "tools for fixing"
	cont "skateboards."
	done
	
LusterMallSkateShopSkateboardText:
	text "A variety of skate-"
	line "board decks."
	done
