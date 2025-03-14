AirportGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, ROUTE_12, 3
	warp_event  4,  0, ROUTE_12, 4
	warp_event  3,  7, ONWA_INTL_AIRPORT, 1
	warp_event  4,  7, ONWA_INTL_AIRPORT, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AirportGateOfficer, -1
	
AirportGateOfficer:
	jumptext AirportGateOfficerText
	
AirportGateOfficerText:
	text "The path to the"
	line "SOUTH ends ahead."
	
	para "The AIRPORT is all"
	line "there is that way."
	done
