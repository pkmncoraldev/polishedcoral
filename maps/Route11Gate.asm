Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, ROUTE_9, 4
	warp_event  4,  0, ROUTE_9, 5
	warp_event  3,  7, ROUTE_11_2, 1
	warp_event  4,  7, ROUTE_11_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11GateOfficer, -1

	const_def 1 ; object constants
	const ROUTE_11_GATE_OFFICER

	
Route11GateOfficer:
	jumptextfaceplayer Route11GateOfficerText

Route11GateOfficerText:
	text "TEXT"
	done