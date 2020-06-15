Route8Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 0, 3, 1, ROUTE_8
	warp_def 0, 4, 2, ROUTE_8
	warp_def 7, 3, 7, LAKE_ONWA
	warp_def 7, 4, 7, LAKE_ONWA

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route8GateOfficer, -1

	const_def 1 ; object constants
	const ROUTE8ROUTE6GATE_OFFICER
	
Route8GateOfficer:
	faceplayer
	opentext
	writetext Route8GateOfficerText
	waitbutton
	closetext
	end

Route8GateOfficerText:
	text "You say there was"
	line "a #MON blocking"
	cont "the path?"
	
	para "That explains why"
	line "no one has been"
	cont "passing through."
	
	para "You just made my"
	line "job a lot tougher."
	
	para "Thanks a lot, kid…"
	done