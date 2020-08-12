LusterMallBallShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 19, LUSTER_MALL
	warp_def  7,  3, 20, LUSTER_MALL

	db 0 ; coord events

	db 11 ; bg events
	signpost  7,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText1
	signpost  7,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText1
	signpost  3,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  3,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  5,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  5,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  1,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText1
	signpost  1,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText2
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText2
	signpost  1,  4, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText3
	signpost  1,  3, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText3

	db 0 ; object events

	
LusterMallBallShopCaseText1:
	text "A case of regular"
	line "# BALLS."
	done
	
LusterMallBallShopCaseText2:
	text "A variety of cool"
	line "# BALLS!"
	done
	
LusterMallBallShopPosterText1:
	text "A # BALL"
	line "poster."
	done
	
LusterMallBallShopPosterText2:
	text "A GREAT BALL"
	line "poster."
	done
	
LusterMallBallShopPosterText3:
	text "An ULTRA BALL"
	line "poster."
	done