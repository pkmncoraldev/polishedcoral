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

	db 0 ; object events

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