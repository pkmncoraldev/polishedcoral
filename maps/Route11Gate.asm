Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, PARK, 3
	warp_event  4,  0, PARK, 4
	warp_event  3,  7, ROUTE_1, 1
	warp_event  4,  7, ROUTE_1, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
