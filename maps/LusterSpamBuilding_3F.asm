LusterSpamBuilding_3F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSpamBuilding_3FCallBack

	db 2 ; warp events
	warp_event 24,  3, LUSTER_SPAM_BUILDING_ELEVATOR, 1
	warp_event  9,  7, LUSTER_SPAM_BUILDING_RIGHT_ROOM, 5

	db 12 ; coord events
	coord_event 21,  3, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 35, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 27,  7, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 31,  7, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 35,  7, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  1, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  5, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 13, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 17, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 21, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 27, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  9,  7, -1, LusterSpamBuilding_2FRightRoom

	db 16 ; bg events
	signpost  3, 20, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText1
	signpost 13, 34, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText2
	signpost  7, 26, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText3
	signpost  7, 30, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText4
	signpost  7, 34, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText5
	signpost 13,  0, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText6
	signpost 13,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText7
	signpost 13, 12, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText8
	signpost 13, 16, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText9
	signpost 13, 20, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText10
	signpost 13, 26, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FWrongSignText11
	signpost  7,  8, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FRightSignText
	signpost  7,  3, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FMotivationalPoster
	signpost  4,  2, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FComputer1
	signpost  4,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FComputer2
	signpost  4,  6, SIGNPOST_JUMPTEXT, LusterSpamBuilding_3FComputer3

	db 0 ; object events
	
	
LusterSpamBuilding_3FCallBack:
	checkevent EVENT_STEP_DOWN
	iffalse .skip
	clearevent EVENT_STEP_DOWN
	applyonemovement PLAYER, step_down
.skip
	checkevent EVENT_SPAM_BUILDING_3F_DOOR
	iftrue .door
	return
.door
	changeblock $8, $6, $1f
	return
	
LusterSpamBuilding_3FWrongSignText1:
	text "Heart of"
	line "Marketing"
	done
	
LusterSpamBuilding_3FWrongSignText2:
	text "Head of"
	line "Meerkating"
	done
	
LusterSpamBuilding_3FWrongSignText3:
	text "Head of"
	line "Mermaiding"
	done
	
LusterSpamBuilding_3FWrongSignText4:
	text "Head of"
	line "Managing"
	done
	
LusterSpamBuilding_3FWrongSignText5:
	text "Head of"
	line "Muttering"
	done
	
LusterSpamBuilding_3FWrongSignText6:
	text "Head of"
	line "Migrating"
	done
	
LusterSpamBuilding_3FWrongSignText7:
	text "Head of"
	line "Misleading"
	done
	
LusterSpamBuilding_3FWrongSignText8:
	text "Head of"
	line "Measuring"
	done
	
LusterSpamBuilding_3FWrongSignText9:
	text "Head of"
	line "Mirroring"
	done

LusterSpamBuilding_3FWrongSignText10:
	text "Head of"
	line "Misgiving"
	done
	
LusterSpamBuilding_3FWrongSignText11:
	text "Head of"
	line "Mustarding"
	done
	
LusterSpamBuilding_3FRightSignText:
	text "Head of"
	line "Marketing"
	done
	
LusterSpamBuilding_3FMotivationalPoster:
	text "A picture of a"
	line "MEOWTH with a big"
	cont "smile."
	
	para "“Friday is on the"
	line "way, baby!”"
	done
	
LusterSpamBuilding_3FComputer1:
	text "Boring"
	line "spreadsheets."
	done
	
LusterSpamBuilding_3FComputer2:
	text "A cool 3D"
	line "pinball game."
	
	para "How does anyone"
	line "get any work done?"
	done
	
LusterSpamBuilding_3FComputer3:
	text "A blue screen"
	line "with text you don't"
	cont "understand."
	done
	
