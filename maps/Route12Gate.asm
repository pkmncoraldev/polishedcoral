Route12Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route12GateCallback

	db 4 ; warp events
	warp_event  3,  0, LUSTER_CITY_RESIDENTIAL, 10
	warp_event  4,  0, LUSTER_CITY_RESIDENTIAL, 11
	warp_event  3,  7, ROUTE_12, 1
	warp_event  4,  7, ROUTE_12, 2

	db 1 ; coord events
	coord_event  3,  7, 0, Route12GateOfficerStopsYou

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_OFFICER,  3,  0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12GateOfficer, -1
	person_event SPRITE_OFFICER,  7,  4, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route12GateNettOfficer, EVENT_NETT_OFFICE_CUTSCENE_DONE

	const_def 1 ; object constants
	const ROUTE_12_GATE_OFFICER
	const ROUTE_12_GATE_OFFICER2


Route12GateCallback:
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	return
	
Route12GateOfficer:
	jumptextfaceplayer Route12GateOfficerText

Route12GateOfficerText:
	text "The ROUTE 12 park"
	line "is through those"
	cont "doors."
	
	para "It may seem like"
	line "like you're still"
	cont "in the city,"
	cont "but watch out!"
	
	para "Plenty of TRAINERS"
	line "will want a fight!"
	done
	
Route12GateNettOfficer:
	faceplayer
	opentext
	writetext Route12GateNettOfficerText
	waitbutton
	closetext
	spriteface ROUTE_12_GATE_OFFICER2, UP
	end
	
Route12GateNettOfficerText:
	text "You're <PLAYER>,"
	line "right?"
	
	para "MR. NETT wanted"
	line "to see you."
	
	para "You shouldn't keep"
	line "someone important"
	cont "like him waiting."
	
	para "The NETT BUILDING"
	line "is in the BUSINESS"
	cont "DISTRICT on the"
	cont "EAST side of town."
	done
	
Route12GateOfficerStopsYou:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface ROUTE_12_GATE_OFFICER2, LEFT
	showemote EMOTE_SHOCK, ROUTE_12_GATE_OFFICER2, 15
	spriteface PLAYER, RIGHT
	opentext
	writetext Route12GateNettOfficerText
	waitbutton
	closetext
	follow PLAYER, ROUTE_12_GATE_OFFICER2
	applyonemovement PLAYER, step_up
	stopfollow
	applyonemovement ROUTE_12_GATE_OFFICER2, step_right
	spriteface ROUTE_12_GATE_OFFICER2, UP
	end
