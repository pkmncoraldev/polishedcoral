Route12Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route12GateCallback

	db 4 ; warp events
	warp_event  3,  0, LUSTER_CITY_RESIDENTIAL, 10
	warp_event  4,  0, LUSTER_CITY_RESIDENTIAL, 11
	warp_event  3,  7, ROUTE_12, 1
	warp_event  4,  7, ROUTE_12, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12GateOfficer, -1

	const_def 1 ; object constants
	const ROUTE_12_GATE_OFFICER


Route12GateCallback:
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	return
	
Route12GateOfficer:
	jumptextfaceplayer Route12GateOfficerText

Route12GateOfficerText:
	text "The ROUTE 12 PARK"
	line "is through those"
	cont "doors."
	
	para "It may seem like"
	line "like you're still"
	cont "in the city,"
	cont "but watch out!"
	
	para "Plenty of TRAINERS"
	line "will want a fight!"
	done