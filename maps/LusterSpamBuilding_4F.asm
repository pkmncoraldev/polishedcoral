LusterSpamBuilding_4F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSpamBuilding_4FCallBack

	db 2 ; warp events
	warp_event  8,  5, LUSTER_SPAM_BUILDING_ELEVATOR, 1
	warp_event 37,  1, LUSTER_SPAM_BUILDING_RIGHT_ROOM, 7

	db 15 ; coord events
	coord_event 33,  1, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 13,  7, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 17,  7, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 21,  7, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 37,  9, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  1, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  5, 13, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 21, 15, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 29, 15, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  5, 21, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 23, 23, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 27, 23, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 35, 23, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 39, 23, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 37,  1, -1, LusterSpamBuilding_2FRightRoom

	db 15 ; bg events
	signpost  7, 12, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText1
	signpost 15, 20, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText2
	signpost 13,  0, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText3
	signpost  7, 16, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText4
	signpost 13,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText5
	signpost  7, 20, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText6
	signpost 23, 34, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText7
	signpost  1, 32, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText8
	signpost  9, 36, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText9
	signpost 15, 28, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText10
	signpost 23, 38, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText11
	signpost 23, 22, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText12
	signpost 21,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText13
	signpost 23, 26, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FWrongSignText14
	signpost  1, 36, SIGNPOST_JUMPTEXT, LusterSpamBuilding_4FRightSignText

	db 0 ; object events


LusterSpamBuilding_4FCallBack:
	checkevent EVENT_STEP_DOWN
	iffalse .skip
	clearevent EVENT_STEP_DOWN
	applyonemovement PLAYER, step_down
.skip
	checkevent EVENT_SPAM_BUILDING_4F_DOOR
	iftrue .door
	return
.door
	changeblock $24, $0, $1f
	return

LusterSpamBuilding_4FWrongSignText1:
	text "Vice Synergy"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText2:
	text "Co-Vice Energy"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText3:
	text "Co-Vice Synergy"
	line "Marketer"
	done
	
LusterSpamBuilding_4FWrongSignText4:
	text "Convince Synergy"
	line "Manger"
	done
	
LusterSpamBuilding_4FWrongSignText5:
	text "Synergy"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText6:
	text "Assistant Synergy"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText7:
	text "Vice Principal"
	done
	
LusterSpamBuilding_4FWrongSignText8:
	text "Sub-Co-Vice"
	line "Synergy Manager"
	done
	
LusterSpamBuilding_4FWrongSignText9:
	text "Co-Vice Managing"
	line "Manager"
	done

LusterSpamBuilding_4FWrongSignText10:
	text "Sub-Vice Synergy"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText11:
	text "Sub-Vice Sandwhich"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText12:
	text "Co-Vice Synergy"
	line "Mangler"
	done
	
LusterSpamBuilding_4FWrongSignText13:
	text "Co-Video"
	line "Manager"
	done
	
LusterSpamBuilding_4FWrongSignText14:
	text "Co-Vice Synchro"
	line "Manager"
	done
	
LusterSpamBuilding_4FRightSignText:
	text "Co-Vice Synergy"
	line "Manager"
	done
