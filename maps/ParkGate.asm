ParkGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, LUSTER_CITY_RESIDENTIAL, 10
	warp_event  4,  0, LUSTER_CITY_RESIDENTIAL, 11
	warp_event  3,  7, PARK, 1
	warp_event  4,  7, PARK, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
