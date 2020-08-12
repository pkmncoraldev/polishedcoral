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

	db 0 ; object events

LusterMallHerbShopShelfText:
	text "Bottles and jars"
	line "of vitamins and"
	cont "herbs."
	done
	
LusterMallHerbShopPlantText:
	text "An exotic plant."
	
	para "It smells strange…"
	done