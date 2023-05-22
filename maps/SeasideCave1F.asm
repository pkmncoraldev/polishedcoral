SeasideCave1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  7,  1, ROUTE_17, 3
	warp_event 15,  3, SEASIDE_CAVE_B1F, 1
	warp_event 15, 19, SEASIDE_CAVE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
