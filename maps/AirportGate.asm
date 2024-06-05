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

	db 0 ; object events
