InnVent_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, InnVentCallback

	db 5 ; warp events
	warp_event 0, 1, INN_3F, 19
	warp_event  6,  1, INN_3F, 20
	warp_event -2, -1, INN_3F, 21
	warp_event 28,  1, INN_3F, 22
	warp_event 35,  1, INN_3F, 23

	db 0 ; coord events

	db 9 ; bg events
	signpost  1,  0, SIGNPOST_READ, InnVentGrate1
	signpost  1,  6, SIGNPOST_READ, InnVentGrate2
	signpost -1, -2, SIGNPOST_READ, InnVentGrate3
	signpost  1, 28, SIGNPOST_READ, InnVentGrate4
	signpost  0,  1, SIGNPOST_IFSET, InnVentGrate5
	signpost  0,  7, SIGNPOST_IFSET, InnVentGrate6
	signpost -1, -2, SIGNPOST_IFSET, InnVentGrate7
	signpost  0, 29, SIGNPOST_IFSET, InnVentGrate8
	signpost  1, 22, SIGNPOST_READ, InnVentGrate

	db 0 ; object events


InnVentGrate:
	jumptext InnVentGrateText
	
InnVentGrateText:
	text "The air vent to"
	line "ROOM 302."
	
	para "It's bolted shut."
	
	para "Better find a"
	line "different way in…"
	done

InnVentCallback:
	checkevent EVENT_INN_VENT_GRATE_1
	iffalse .skip_1
	changeblock $0, $0, $3d
.skip_1
	checkevent EVENT_INN_VENT_GRATE_2
	iffalse .skip_2
	changeblock $6, $0, $3d
.skip_2
	checkevent EVENT_INN_VENT_GRATE_3
	iffalse .skip_3
	changeblock $14, $0, $42
	changeblock $16, $0, $43
.skip_3
	checkevent EVENT_INN_VENT_GRATE_4
	iffalse .end
	changeblock $1c, $0, $3d
.end
	return

InnVentGrate1:
	checkevent EVENT_INN_VENT_GRATE_1
	iftrue InnVentGrate5_2
	opentext
	writetext InnVentGrateText1
	yesorno
	iffalse InnVentGrateNo
	setevent EVENT_INN_VENT_GRATE_1
	changeblock $0, $0, $3d
	jump InnVentGrateEnd
	
InnVentGrate2:
	checkevent EVENT_INN_VENT_GRATE_2
	iftrue InnVentGrate6_2
	opentext
	writetext InnVentGrateText3
	yesorno
	iffalse InnVentGrateNo
	setevent EVENT_INN_VENT_GRATE_2
	changeblock $6, $0, $3d
	jump InnVentGrateEnd
	
InnVentGrate3:
	checkevent EVENT_INN_VENT_GRATE_3
	iftrue InnVentGrate7_2
	opentext
	writetext InnVentGrateText1
	yesorno
	iffalse InnVentGrateNo
	setevent EVENT_INN_VENT_GRATE_3
	changeblock $14, $0, $42
	changeblock $16, $0, $43
	jump InnVentGrateEnd
	
InnVentGrate4:
	checkevent EVENT_INN_VENT_GRATE_4
	iftrue InnVentGrate8_2
	opentext
	writetext InnVentGrateText4
	yesorno
	iffalse InnVentGrateNo
	setevent EVENT_INN_VENT_GRATE_4
	changeblock $1c, $0, $3d
	jump InnVentGrateEnd
	
InnVentGrate5:
	dw EVENT_INN_VENT_GRATE_1
InnVentGrate5_2:
	opentext
	writetext InnVentGrateText2
	yesorno
	iffalse InnVentGrateNo
	clearevent EVENT_INN_VENT_GRATE_1
	changeblock $0, $0, $3c
	jump InnVentGrateEnd
	
InnVentGrate6:
	dw EVENT_INN_VENT_GRATE_2
InnVentGrate6_2:
	opentext
	writetext InnVentGrateText2
	yesorno
	iffalse InnVentGrateNo
	clearevent EVENT_INN_VENT_GRATE_2
	changeblock $6, $0, $3c
	jump InnVentGrateEnd
	
InnVentGrate7:
	dw EVENT_INN_VENT_GRATE_3
InnVentGrate7_2:
	opentext
	writetext InnVentGrateText2
	yesorno
	iffalse InnVentGrateNo
	clearevent EVENT_INN_VENT_GRATE_3
	changeblock $14, $0, $3b
	changeblock $16, $0, $3c
	jump InnVentGrateEnd
	
InnVentGrate8:
	dw EVENT_INN_VENT_GRATE_4
InnVentGrate8_2:
	opentext
	writetext InnVentGrateText2
	yesorno
	iffalse InnVentGrateNo
	clearevent EVENT_INN_VENT_GRATE_4
	changeblock $1c, $0, $3c
	
InnVentGrateEnd:
	closetext
	playsound SFX_SLUDGE_BOMB
	reloadmappart
	loadvar wScriptVar, 0
	end
	
InnVentGrateNo:
	closetext
	end
	
InnVentGrateText1:
	text "The air vent to"
	line "ROOM 304."
	
	para "It's loose.<WAIT_S>"
	line "Pull it aside?"
	done
	
InnVentGrateText2:
	text "Replace the"
	line "grate?"
	done
	
InnVentGrateText3:
	text "The air vent to"
	line "ROOM 303."
	
	para "It's loose.<WAIT_S>"
	line "Pull it aside?"
	done
	
InnVentGrateText4:
	text "The air vent to"
	line "ROOM 301."
	
	para "It's loose.<WAIT_S>"
	line "Pull it aside?"
	done
	