DragonShrineInterior_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 73,  7, 1, LUMINA_GYM
	warp_def 73,  8, 2, LUMINA_GYM
	warp_def  1,  7, 1, ROUTE_1
	warp_def  1,  8, 1, ROUTE_1

	db 0 ; coord events

	db 8 ; bg events
	signpost  1,  7, SIGNPOST_JUMPTEXT, DragonShrineInteriorDoorText
	signpost  1,  8, SIGNPOST_JUMPTEXT, DragonShrineInteriorDoorText
	signpost  6,  7, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  6,  8, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  7,  7, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  7,  8, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  8,  7, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  8,  8, SIGNPOST_READ, DragonShrineInteriorBigStatue

	db 0 ; object events


DragonShrineInteriorDoorText:
	text "It looks like"
	line "someone broke"
	cont "down the door."
	done
	
DragonShrineInteriorBigStatue:
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	jumptext DragonShrineInteriorBigStatueText
.YouAreFacingUp
	opentext
	writetext DragonShrineInteriorBigStatueLegendText1
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText2
	waitbutton
.end
	closetext
	end
	
DragonShrineInteriorBigStatueText:
	text "A familiar looking"
	line "statue."
	
	para "It shines, radiant"
	line "and untarnished."
	
	para "The plaque on the"
	line "the front seems"
	cont "unobscured."
	done
	
DragonShrineInteriorBigStatueLegendText1:
	text "A familiar looking"
	line "statue."
	
	para "It shines, radiant"
	line "and untarnished."
	
	para "The plaque under"
	line "it is unobscured."
	
	para "Read it?"
	done
	
DragonShrineInteriorBigStatueLegendText2:
	text "TODO: DRAGON STONE"
	line "LEGEND FULL"
	done
	