LusterSpamBuilding_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSpamBuilding_2FCallBack

	db 3 ; warp events
	warp_event 12,  9, LUSTER_SPAM_BUILDING_ELEVATOR, 1
	warp_event 11,  1, LUSTER_SPAM_BUILDING_RIGHT_ROOM, 1
	warp_event 15, 17, LUSTER_SPAM_BUILDING_RIGHT_ROOM, 3

	db 15 ; coord events
	coord_event  1,  1, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  5,  1, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  5,  9, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  9,  9, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 15,  9, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  3, 17, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  1, 25, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  5, 25, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  9, 25, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 13, 25, -1, LusterSpamBuilding_2FWrongRoom
	coord_event  7, 17, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 15,  1, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 11, 17, -1, LusterSpamBuilding_2FWrongRoom
	coord_event 15, 17, -1, LusterSpamBuilding_2FRightRoom
	coord_event 11,  1, -1, LusterSpamBuilding_2FRightRoom

	db 15 ; bg events
	signpost  9, 14, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText1
	signpost  9,  8, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText2
	signpost 25,  0, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText3
	signpost 25,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText4
	signpost  9,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText5
	signpost 25,  8, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText6
	signpost 25, 12, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText7
	signpost 17,  2, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText8
	signpost 17,  6, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText9
	signpost 17, 10, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText10
	signpost  1,  0, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText11
	signpost  1,  4, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText12
	signpost  1, 14, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FWrongSignText13
	signpost  1, 10, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FRightSignText1
	signpost 17, 14, SIGNPOST_JUMPTEXT, LusterSpamBuilding_2FRightSignText2

	db 0 ; object events


LusterSpamBuilding_2FCallBack:
	checkevent EVENT_STEP_DOWN
	iffalse .skip
	clearevent EVENT_STEP_DOWN
	applyonemovement PLAYER, step_down
.skip
	checkevent EVENT_SPAM_BUILDING_2F_DOOR_1
	iftrue .door1
	checkevent EVENT_SPAM_BUILDING_2F_DOOR_2
	iftrue .door2
	return
.door1
	changeblock $a, $0, $1f
	return
.door2
	changeblock $e, $10, $1f
	return

LusterSpamBuilding_2FRightRoom:
LusterSpamBuilding_2FWrongRoom:
	playsound SFX_ENTER_DOOR
	applyonemovement PLAYER, hide_person
	waitsfx
	pause 10
	opentext
	writetext LusterSpamBuildingWrongRoomText
	waitbutton
	closetext
	pause 10
	special FadeOutPalettes
	pause 15
	applyonemovement PLAYER, show_person
	opentext
	writetext LusterSpamBuildingWrongRoomText2
	waitbutton
	closetext
	special Special_FadeOutMusic
	pause 10
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing DOWN, LUSTER_CITY_BUSINESS, $16, $1a
	end
	
LusterSpamBuildingWrongRoomText:
	text "Hey!<WAIT_S> You shouldn't"
	line "in be here!"
	
	para "SECURITY!"
	done
	
LusterSpamBuildingWrongRoomText2:
	text "You're outta here,"
	line "bub!"
	done

LusterSpamBuilding_2FWrongSignText1:
	text "Customer"
	line "Representations"
	done
	
LusterSpamBuilding_2FWrongSignText2:
	text "Customer"
	line "Reciprocations"
	done
	
LusterSpamBuilding_2FWrongSignText3:
	text "Customer"
	line "Reparations"
	done
	
LusterSpamBuilding_2FWrongSignText4:
	text "Customer"
	line "Regulations"
	done
	
LusterSpamBuilding_2FWrongSignText5:
	text "Customer"
	line "Retributions"
	done
	
LusterSpamBuilding_2FWrongSignText6:
	text "Customer"
	line "Retaliations"
	done
	
LusterSpamBuilding_2FWrongSignText7:
	text "Consumer"
	line "Rehabilitations"
	done
	
LusterSpamBuilding_2FWrongSignText8:
	text "Customer"
	line "Reorganizations"
	done
	
LusterSpamBuilding_2FWrongSignText9:
	text "Customer"
	line "Reintegrations"
	done
	
LusterSpamBuilding_2FWrongSignText10:
	text "Customer"
	line "Recompilations"
	done
	
LusterSpamBuilding_2FWrongSignText11:
	text "Consumer"
	line "Representative"
	done
	
LusterSpamBuilding_2FWrongSignText12:
	text "Consumer"
	line "Reforestations"
	done
	
LusterSpamBuilding_2FWrongSignText13:
	text "Customer"
	line "Reflections"
	done
	
LusterSpamBuilding_2FRightSignText1:
	text "Customer"
	line "Representative"
	done
	
LusterSpamBuilding_2FRightSignText2:
	text "Consumer"
	line "Relations"
	done