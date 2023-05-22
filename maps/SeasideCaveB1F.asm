SeasideCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 15,  5, SEASIDE_CAVE_1F, 2
	warp_event 15, 21, SEASIDE_CAVE_1F, 3
	warp_event 13, 31, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
