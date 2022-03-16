DaybreakGrotto1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 13, 11, ROUTE_2, 1
	warp_event 13,  5, DAYBREAK_GROTTO_2, 1
	warp_event  3,  5, DAYBREAK_GROTTO_3, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
