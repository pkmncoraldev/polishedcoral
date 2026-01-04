LusterMallBackRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterMallBackRoomCallback

	db 3 ; warp events
	warp_def 15,  8, 23, LUSTER_MALL
	warp_def 15,  9, 23, LUSTER_MALL
	warp_def  3,  8, 7, LUSTER_CITY_SHOPPING

	db 0 ; coord events

	db 20 ; bg events
	signpost  4,  6, SIGNPOST_UP, LusterMallBackRoomSecuritySign
	signpost  0,  0, SIGNPOST_JUMPTEXT, LusterMallBackRoomExitSignText
	signpost  2,  0, SIGNPOST_JUMPTEXT, LusterMallBackRoomMonitorsText
	signpost  2,  1, SIGNPOST_JUMPTEXT, LusterMallBackRoomMonitorsText
	signpost  2,  2, SIGNPOST_JUMPTEXT, LusterMallBackRoomMonitorsText
	signpost  2,  3, SIGNPOST_JUMPTEXT, LusterMallBackRoomMonitorsText
	signpost  2,  4, SIGNPOST_JUMPTEXT, LusterMallBackRoomMonitorsText
	signpost  6,  0, SIGNPOST_JUMPTEXT, LusterMallBackRoomComputerText
	signpost  6,  1, SIGNPOST_JUMPTEXT, LusterMallBackRoomComputerText
	signpost  6,  2, SIGNPOST_JUMPTEXT, LusterMallBackRoomComputerText
	signpost  4, 12, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost  5, 13, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost  8, 12, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost  9, 12, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost 10, 12, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost 14,  6, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost 14, 13, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost 15,  6, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost 15, 13, SIGNPOST_JUMPTEXT, LusterMallBackRoomBoxesText
	signpost  9,  4, SIGNPOST_JUMPTEXT, LusterMallBackRoomTableText

	db 2 ; object events
	person_event SPRITE_OFFICER,  3,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallBackRoomNpc1, -1
	person_event SPRITE_SUPER_NERD,  9,  0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMallBackRoomNpc2, -1

LusterMallBackRoomCallback:
	checkevent EVENT_MIDDLE_PART_TIME_JOB
	iftrue .skip
	domaptrigger LUSTER_CITY_SHOPPING, $2
.skip
	return
	
LusterMallBackRoomSecuritySign:
	jumptext LusterMallBackRoomSecuritySignText
	
LusterMallBackRoomSecuritySignText:
	text "SECURITY"
	done
	
LusterMallBackRoomExitSignText:
	text "REAR EXIT"
	done
	
LusterMallBackRoomMonitorsText:
	text "Security cameras"
	line "track various"
	cont "parts of the mall."
	
	para "None of the people"
	line "on screen know you"
	cont "can see them…"
	
	para "Cool!"
	done
	
LusterMallBackRoomComputerText:
	text "Computers that"
	line "control various"
	cont "things in the"
	cont "mall."
	
	para "Better not touch…"
	done
	
LusterMallBackRoomBoxesText:
	text "Boxes are stacked"
	line "neatly against the"
	cont "walls."
	done
	
LusterMallBackRoomTableText:
	text "A box from the"
	line "hallway is being"
	cont "used as a table."
	
	para "Someone's been"
	line "playing cards."
	done
	
LusterMallBackRoomNpc1:
	jumptext LusterMallBackRoomNpc1Text
	
LusterMallBackRoomNpc1Text:
	text "…"
	
	para "…"
	
	para "He's asleep on"
	line "the job!"
	done
	
LusterMallBackRoomNpc2:
	jumptextfaceplayer LusterMallBackRoomNpc2Text
	
LusterMallBackRoomNpc2Text:
	text "I'm the I.T. guy."
	
	para "You wanna hear a"
	line "secret?"
	
	para "You know the"
	line "buildings in the"
	cont "BUSINESS DISTRICT?"
	
	para "Well, they all"
	line "have really crummy"
	cont "security."
	
	para "The password to"
	line "their computer"
	cont "servers are all"
	cont "the same."
	
	para "I shouldn't tell"
	line "you, but I'll give"
	cont "you a hint."
	
	para "It's two words, it"
	line "starts with a “L”,"
	cont "and you can buy it"
	cont "at the ELECTRONICS"
	cont "STORE."
	done	
	