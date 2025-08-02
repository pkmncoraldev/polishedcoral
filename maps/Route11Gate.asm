Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route11GateCallback

	db 4 ; warp events
	warp_event  3,  0, ROUTE_9, 4
	warp_event  4,  0, ROUTE_9, 5
	warp_def  7,  3, 255, ROUTE_11
	warp_def  7,  4, 255, ROUTE_11

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11GateOfficer, -1

	const_def 1 ; object constants
	const ROUTE_11_GATE_OFFICER

Route11GateCallback:
	checkevent EVENT_ROUTE_11_BRIDGE_BUILT
	iffalse .no_bridge
	warpmod 1, ROUTE_11_2
	return
.no_bridge
	warpmod 1, ROUTE_11
	return
	
Route11GateOfficer:
	jumptextfaceplayer Route11GateOfficerText

Route11GateOfficerText:
	text "TEXT"
	done