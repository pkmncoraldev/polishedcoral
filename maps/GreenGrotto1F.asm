GreenGrotto1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_event 35, 25, ROUTE_28, 4
	warp_event  3, 19, ROUTE_1, 1
	warp_event 11, 13, GREEN_GROTTO_B1F, 1
	warp_event 19, 21, GREEN_GROTTO_B1F, 2
	warp_event 39, 13, GREEN_GROTTO_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
